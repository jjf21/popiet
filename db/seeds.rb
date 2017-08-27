require 'csv'
puts 'Erasing all the DB'

Review.destroy_all
MonthlyRating.destroy_all
WishlistsPlace.destroy_all
Wishlist.destroy_all
Place.destroy_all
User.destroy_all




puts 'Seeding your app'

########### PLACE 1 ##############

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'EUROPE.csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'EUROPE.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

def google_details(city)   
  # City -> Place Id
  url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?sensor=true&language=en&type=(cities)&input=#{city}&key=#{ENV['GOOGLE_MAP_API']}"
  data = JSON.parse(RestClient.get(url))
  return false if  data['predictions'].first['place_id'] == nil
  place_id = data['predictions'].first['place_id'] 

  #Place id -> Photo Reference
  url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=#{ENV['GOOGLE_MAP_API']}"
  data = JSON.parse(RestClient.get(url))
  photo_reference = data['result']['photos'].first['photo_reference']
  lat = data['result']['geometry']['location']['lat']
  lng = data['result']['geometry']['location']['lng']

  # Photo Reference -> Photo
  {
    photo_url: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=2000&photoreference=#{photo_reference}&key=#{ENV['GOOGLE_MAP_API']}",
    lat: lat,
    lng: lng
  }
end



csv.first(5).each do |row|
  google_details = google_details(row['city'])
  if google_details != false
    if row['lat'] == '' || row['lng'] == ''
      row['lat'] = google_details[:lat]
      row['lng'] = google_details[:lng]
    end

    if row['state'] == 'true'

      place = Place.create!(
                  city: row['city'],
                  country: row['country'],
                  name: row['name'],
                  latitude:  row['lat'] ,
                  longitude:  row['lng'],
                  description: row['description'],
                  remote_photo_url: google_details[:photo_url],
                  windfinder_stat: row['wndfinder_link']
                  )

      statistics = eval(row['stat[]'])
      statistics.each do |stat|
        MonthlyRating.create!(
                month_number: stat[:month],
                rating: stat[:stat],
                place: place
                )
      end
    end
  end
end

##################################



User.create!(
             email: 'carl.quivron@gmail.com',
             password: '123456',
             password_confirmation: '123456'
             )

User.create!(
            email: 'augustin.poupard@gmail.com',
            password: '123456',
            password_confirmation: '123456'
          )


puts 'Seed Completed'
