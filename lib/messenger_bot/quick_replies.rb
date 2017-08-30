def begining_replies(name, message)
  if name == ''
    text = "What are you looking for?"
  else
    if message
      text = "#{message.capitalize} #{name}! What are you looking for?"
    end
  end
  {
    text: text,
    quick_replies:[
      {
        content_type: "text",
        title: "Next Kitetrip",
        payload: 'kitetrip'
      },
      {
        content_type: "text",
        title: "Best Spots Around",
        payload: 'now_spot'
      }
    ]
  }
end

def get_location()
  {
    text: "Ok! To help you, I will need your location",
    quick_replies:[
      {
        content_type: "location"
      }
    ]
  }
end