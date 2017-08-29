require "./lib/messenger_bot/handle_bot_messaging"

class MessengerBotJob < ApplicationJob
  queue_as :default

  # Handle facebook messenger bot message

  # See https://developers.facebook.com/docs/messenger-platform/webhook-reference/message
  # For all messages format
  
  def perform(event)
    return if event.nil?

    sender_id = event['sender']['id']
    p event
    if event['message']
      if event['message']['text']
        handle_text(event, sender_id)
      elsif event['message']['attachments']
        p 'EVENT ATTACHEMENTS'
        handle_attachments(event, sender_id)
      end
    end
    if event['postback']
        p 'helloooo'
        handle_postback(event, sender_id)
    elsif event['quick_reply']
        p 'quick response'
        handle_quick_reply(event)
    else
      puts 'MessengerBot - Unable to handle event'
    end
  end

  def handle_text(event, sender_id)
    text = event['message']['text']
    HandleBotMessaging.new.handle_text_message(text, sender_id)
  end

  def handle_postback(event, sender_id)
    postback = event['postback']['payload']
    HandleBotMessaging.new.handle_postback(postback, sender_id)
  end

  def handle_quick_reply(event)
    quick_reply = event['quick_reply']
    HandleBotMessaging.new.handle_quick_reply(quick_reply, sender_id)
  end

  def handle_attachments(event, sender_id)
    attachments = event['message']['attachments']
    HandleBotMessaging.new.handle_attachments(attachments, sender_id.to_i)
  end

end