URL = 'https://9554a743.ngrok.io/'
 
def places_to_list(places)
  places_arrayed = []
  places.each do |place|
    if !place.description.blank?
      places_arrayed << { 
                          title: place.name, 
                          subtitle: place.description.first(30) + '...',
                          image_url: place.photo_url,
                          buttons: [
                            {
                              title: "View",
                              type: "web_url",
                              url: URL + '/places/' + place.id.to_s,
                              webview_height_ratio: "tall"           
                            }
                          ]
                        }
    end
  end

  {
    attachment: {
      type: "template",

      payload: {
        template_type: "list",
        top_element_style: "compact",
        elements: places_arrayed.first(3)
      }
    }
  }
end

def places_to_list_wind(places)
  places_arrayed = []
  places.each do |place|
    if !place.description.blank?
      places_arrayed << { 
                          title: place.name, 
                          subtitle: "Temp: #{place.w_temp} / Wind: #{place.w_wind}knt",
                          image_url: place.photo_url,
                        }
    end
  end

  {
    attachment: {
      type: "template",

      payload: {
        template_type: "list",
        top_element_style: "compact",
        elements: places_arrayed.first(3)
      }
    }
  }
end
