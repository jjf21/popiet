require 'rest-client'

GRAPH_URL = "https://graph.facebook.com/v2.6"

class MessengerBot

  def send_message_text(recipient, text_message)
    send_message(recipient, {text: text_message})
  end

  def send_message(recipient, message)
    body = {
      "recipient":{
        "id": recipient
      },
      "message": message
    }
    url = "#{GRAPH_URL}/me/messages?access_token=#{ENV['MESSENGER_BOT_ACCESS_TOKEN']}"
    puts "MessengerBot - Send message to #{recipient} with message : #{message.to_json}"

    begin
      RestClient.post(url, body.to_json, {content_type: :json, accept: :json})
    rescue RestClient::ExceptionWithResponse => err
      puts "MessengerBot - Unable to send a message"
      puts err.response
    end
  end

  def simulate_typing(recipient)
    body = {
      "recipient":{
        "id": recipient
      },
      "sender_action": 'typing_on'
    }
    url = "#{GRAPH_URL}/me/messages?access_token=#{ENV['MESSENGER_BOT_ACCESS_TOKEN']}"

    begin
      RestClient.post(url, body.to_json, {content_type: :json, accept: :json})
    rescue RestClient::ExceptionWithResponse => err
      puts "MessengerBot - Unable to send a message"
      puts err.response
    end

  end

  def send_greeting_message
    body = {
            "greeting":[
              {
                "text":"Hey {{user_first_name}}! You're connected to our brand new chatbot! He will find kite spots based on your wishes"
              }
            ] 
          }
    url = "#{GRAPH_URL}/me/messenger_profile?access_token=#{ENV['MESSENGER_BOT_ACCESS_TOKEN']}"
    puts "MessengerBot - Send message greeting with message : #{body.to_json}"

    begin
      RestClient.post(url, body.to_json, {content_type: :json, accept: :json})
    rescue RestClient::ExceptionWithResponse => err
      puts "MessengerBot - Unable to send a message"
      puts err.response
    end
  end

  # Only when user has already send a message to the bot !
  def get_user_informations(user_id)
    url = "#{GRAPH_URL}/#{user_id}?fields=first_name,last_name,profile_pic,locale,timezone,gender&access_token=#{ENV['MESSENGER_BOT_ACCESS_TOKEN']}"
    data = RestClient.get url
    if data.empty?
      puts "MessengerBot - Unable to get user_informations (User has not already send a message or has revoked platform permissions on Facebook)"
      nil
    else
      puts "MessengerBot - Get user information with user_id : #{user_id}"
      JSON.parse(data)
    end
  end

  # Resubscribe to Webhook
  # After many errors
  def subscribe!
    url = "#{GRAPH_URL}/me/subscribed_apps?access_token=#{ENV['MESSENGER_BOT_ACCESS_TOKEN']}"
    data = RestClient.post(url, nil)
    if data
      json = JSON.parse(data)
      json['success']
    else
      false
    end
  end

end