class FacebookMessengerBotController < ApplicationController

  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def chalenge
    if(params['hub.mode'] == 'subscribe' && params['hub.verify_token'] == ENV['MESSENGER_BOT_VERIFY_TOKEN'])
      puts 'MessengerBot - Validating webhook'
      render json: params['hub.challenge'], status: :ok
    else
      puts 'MessengerBot - Failed validation. Make sure the validation tokens match.'
      render json: {}, status: 403
    end
  end

  def webhook
    if (params['object'] == 'page')
      params['entry'].each do |entry|
        entry_id = entry['id']
        time = entry['time']
        entry['messaging'].each do |event|
          if(event['message'] || event['postback'])
            puts 'MessengerBot - Webhook - MessengerBotJob register'
            MessengerBotJob.perform_later(event.to_unsafe_h)
          else
            puts 'MessengerBot - Webhook - Unknown event'
          end
        end
      end
    end
    # You must send back a 200, within 20 seconds
    render json: {}, status: 200
  end

end