require 'open-uri'
require 'nokogiri'
require 'json'
BASE_URL = "https://www.youride.fr/6-kitesurf?p="

Product.destroy_all

def page
  doc = Nokogiri::HTML(open(BASE_URL))
  doc.search('.product-block').each do |bloc|
    # itération sur toutes les divs qui ont la class ??? CSSCLASS -> a toi de trouver
    pd = product_details(bloc)
    if pd[:price].to_i > 100
      Product.create!(
        title:pd[:title],
        price:pd[:price].gsub(' ', '').to_i,
        image_link:pd[:image].gsub('small', 'home'),
        product_link:pd[:link]
        )
    end
  end
end
def product_details(product_bloc)
  #### complete each detail ####
  title = product_bloc.css('.product-name').text
  price = product_bloc.css('.product-price').text
  image = product_bloc.at_css('.img-responsive').first(2).last.last
  link =product_bloc.at_css('.product_img_link').first(2).last.last
  {title: title, price: price, image: image, link: link}
end

page

# require 'csv'

# puts 'Erasing all the DB'

# Review.destroy_all
# # MonthlyRating.destroy_all
# WishlistsPlace.destroy_all
# Wishlist.destroy_all
# # Place.destroy_all
# User.destroy_all




# puts 'Seeding your app'

# ########### PLACE 1 ##############



# def google_details(city)   
#   # City -> Place Id
#   url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?sensor=true&language=en&type=(cities)&input=#{city}&key=#{ENV['GOOGLE_MAP_API']}"
#   data = JSON.parse(RestClient.get(url))

#   return false if  data['predictions'].empty? || data['predictions'].nil?
#   place_id = data['predictions'].first['place_id'] 

#   #Place id -> Photo Reference
#   url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=#{ENV['GOOGLE_MAP_API']}"
#   data = JSON.parse(RestClient.get(url))

#   return false if  data["status"] != "OK" || data['result']['photos'].nil?
  
#   photo_reference = data['result']['photos'].first['photo_reference']
#   lat = data['result']['geometry']['location']['lat']
#   lng = data['result']['geometry']['location']['lng']

#   # Photo Reference -> Photo
#   {
#     photo_url: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=2000&photoreference=#{photo_reference}&key=#{ENV['GOOGLE_MAP_API']}",
#     lat: lat,
#     lng: lng
#   }
# end

# def seed_from_csv(filename)

#   csv_text = File.read(Rails.root.join('lib', 'seeds', "#{filename}.csv"))
#   csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
#   csv.each do |row|
#     if row['state'] == 'true' && row['description'].length > 1 && row['city'].ascii_only?
#       puts '*****************'
#       puts row['city']
#       puts '*****************'
#       google_details = google_details(row['city'])

#       if google_details != false 

#         if row['lat'] == '' || row['lng']
#           row['lat'] = google_details[:lat]
#           row['lng'] = google_details[:lng]
#         end

#         place = Place.create!(
#                     city: row['city'],
#                     country: row['country'],
#                     name: row['name'],
#                     latitude:  row['lat'] ,
#                     longitude:  row['lng'],
#                     description: row['description'],
#                     remote_photo_url: google_details[:photo_url],
#                     windfinder_stat: row['wndfinder_link']
#                     )
#         puts place[:city] + 'ADDED'
#         statistics = eval(row['stat[]'])
#         statistics.each do |stat|
#           MonthlyRating.create!(
#                   month_number: stat[:month],
#                   rating: stat[:stat],
#                   place: place
#                   )
#         end
#       end
#     end
#   end
# end


# # seed_from_csv('CARIBEAN')
# # seed_from_csv('EUROPE')
# # seed_from_csv('AUSTRALIA')
# # seed_from_csv('CENTRALAMERICA')
# # seed_from_csv('MIDDLEEAST')
# # seed_from_csv('NORTHAMERICA')
# seed_from_csv('OCEANIA')
# seed_from_csv('SOUTHAMERICA')



# User.create!(
#              email: 'carl.quivron@gmail.com',
#              password: '123456',
#              password_confirmation: '123456'
#              )

# User.create!(
#             email: 'augustin.poupard@gmail.com',
#             password: '123456',
#             password_confirmation: '123456'
#           )


# puts 'Seed Completed'
