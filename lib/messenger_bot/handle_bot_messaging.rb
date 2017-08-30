require "./lib/messenger_bot/messenger_bot"
require "./lib/messenger_bot/message_template"
require "./lib/messenger_bot/quick_replies"

class HandleBotMessaging  
  def handle_text_message(text, sender_id)
    MessengerBot.new.simulate_typing(sender_id)

    text = text.downcase if !text.nil? && text.class == String
    answered = false
    case text
    when 'next kitetrip'
      # Looking for a kitetrip
      message = "Which month are you planning to go kiting?"
      MessengerBot.new.send_message_text(sender_id, message)
      answered = true

    when 'hello', 'bonjour', 'salut', 'yo', 'hey'
      f_name = MessengerBot.new.get_user_informations(sender_id)['first_name']
      message = begining_replies(f_name)
      MessengerBot.new.send_message(sender_id, message)
      answered = true

    when 'january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december'
      # Ask for a trip on particular month
      MessengerBot.new.send_message_text(sender_id, "In #{text.downcase}, the bests spots are:")
      date = Date.parse(text).strftime('%m')
      places = Place.all.sort_by {|place| place.stat_avg_score(date, date) }.reverse
      message = places_to_list(Place.first(4))
      MessengerBot.new.send_message(sender_id, message)
      answered = true

    when 'best spots around'  
      # Looking for a spot around
      message = get_location()
      MessengerBot.new.send_message(sender_id, message)
      answered = true

    when 'again'
      message = begining_replies('')
      MessengerBot.new.send_message(sender_id, message)
      answered = true

    end

    if !text.blank? && answered == false && text != 'What are you looking for?'
        p text
        message = "Sorry, I didn't catch what you tried to tell me"
        MessengerBot.new.send_message_text(sender_id, message)
        message = begining_replies('')
        MessengerBot.new.send_message(sender_id, message)
        answer = true
    end
    
    sleep(4)
  end


  def handle_postback(payload, sender_id)
    case payload
    when 'GET_STARTED_PAYLOAD'
      f_name = MessengerBot.new.get_user_informations(sender_id)['first_name']
      message = begining_replies(f_name)
      MessengerBot.new.send_message(sender_id, message)
    end
  end

  def handle_quick_reply(quick_reply, sender_id)
    p "Quick reply: " + quick_reply
    MessengerBot.new.send_message(sender_id, 'handle quick')
  end

  def handle_attachments(attachments, sender_id)
    MessengerBot.new.simulate_typing(sender_id)

    if attachments.first['payload']["coordinates"]
      lat = attachments.first['payload']["coordinates"]['lat'].to_f
      lng = attachments.first['payload']["coordinates"]['lng'].to_f
      places = Place.near([lat, lng], 100)
      if !places.empty?
        windy_places = []
        MessengerBot.new.send_message_text(sender_id, "I'm looking for a windy place next to you:")
        MessengerBot.new.simulate_typing(sender_id)
        places.each do |place|
          place = place.place_with_data
          windy_places << place if place.w_wind > 15
        end
      end

      if !windy_places.empty? && !places.empty?
        message = places_to_list_wind(windy_places.first(4))
        MessengerBot.new.send_message(sender_id, message)
      else
        message = "Unfortunatly, there is no spot working around you."
        MessengerBot.new.send_message_text(sender_id, message)
      end

      message = "Type 'again' if you have any other query."
      MessengerBot.new.send_message_text(sender_id, message)
      message = "Have a great day!"
      MessengerBot.new.send_message_text(sender_id, message)
    end
    sleep(4)
  end
end