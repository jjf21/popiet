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



def google_details(city)   
  # City -> Place Id
  url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?sensor=true&language=en&type=(cities)&input=#{city}&key=#{ENV['GOOGLE_MAP_API']}"
  data = JSON.parse(RestClient.get(url))
  return false if  data['predictions'].empty?
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

def seed_from_csv(filename, sample)
  csv_text = File.read(Rails.root.join('lib', 'seeds', "#{filename}.csv"))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

  csv.first(sample).each do |row|
    if row['state'] == 'true'
      google_details = google_details(row['city'])

      if google_details != false

        if row['lat'] == '' || row['lng'] == ''
          row['lat'] = google_details[:lat]
          row['lng'] = google_details[:lng]
        end

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
end
##################################

seed_from_csv('CARIBEAN', 3)
puts 'Caribe OK'
seed_from_csv('AUSTRALIA', 3)
puts 'australia OK'
seed_from_csv('CENTRALAMERICA', 3)
puts 'central america OK'
seed_from_csv('MIDDLEEAST', 3)
puts 'middle east OK'
seed_from_csv('NORTHAMERICA', 3)
puts 'north america OK'
seed_from_csv('OCEANIA', 3)
puts 'oceania OK'
seed_from_csv('SOUTHAMERICA', 3)
puts 'south america OK'


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
