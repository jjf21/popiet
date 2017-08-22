puts 'Erasing all the DB'

Review.destroy_all
MonthlyRating.destroy_all
WishlistsPlace.destroy_all
Wishlist.destroy_all
Place.destroy_all
User.destroy_all




puts 'Seeding your app'

########### PLACE 1 ##############
place1 = Place.create!(
              city: "Grand Cayman",
              name: "Grand Cayman",
              latitude:  19.292997 ,
              longitude:  -81.366806,
              description: "Grand Cayman has some of the best kiteboarding conditions in the world. The wind tends to be steady and warm, and the protected bays situated all over the island offer lots of room for experienced riders to cruise around and for beginners to build their skills. If you’re new to the sport or not interested in traveling with all your gear, check out Sweet Spot Watersports for rentals and lesson packages.",
              photo: "cayman.jpg",
              country:"Cayman Islands"
              )

MonthlyRating.create!(
              month_number: 1,
              rating:4,
              place: place1
           )
MonthlyRating.create!(
              month_number: 2,
              rating:3,
              place: place1
           )
MonthlyRating.create!(
              month_number: 3,
              rating:4,
              place: place1
           )
MonthlyRating.create!(
              month_number: 4,
              rating:4,
              place: place1
           )
MonthlyRating.create!(
              month_number: 5,
              rating:5,
              place: place1
           )
MonthlyRating.create!(
              month_number: 6,
              rating:5,
              place: place1
           )
MonthlyRating.create!(
              month_number: 7,
              rating:2,
              place: place1
           )
MonthlyRating.create!(
              month_number: 8,
              rating:2,
              place: place1
           )
MonthlyRating.create!(
              month_number: 9,
              rating:1,
              place: place1
           )
MonthlyRating.create!(
              month_number: 10,
              rating:1,
              place: place1
           )
MonthlyRating.create!(
              month_number: 11,
              rating:2,
              place: place1
           )
MonthlyRating.create!(
              month_number: 12,
              rating:2,
              place: place1
           )
##################################


place2 = Place.create!(
              city: "Nabq Bay",
              name: "Nabq Bay",
              latitude: 50.8833,
              longitude: 1.6667,
              description: "This beautiful beach town offers a riding area guarded by reefs, which create relatively shallow and flat waters, and the wind blows at least 20 knots on most days. The reef also means that the riding area is minimally affected by tides, giving you hours of uninterrupted play time.",
              photo: "egypt1.jpg",
              country:"Egypt"
              )

MonthlyRating.create!(
              month_number: 1,
              rating:3,
              place: place2
           )
MonthlyRating.create!(
              month_number: 2,
              rating:5,
              place: place2
           )
MonthlyRating.create!(
              month_number: 3,
              rating:5,
              place: place2
           )
MonthlyRating.create!(
              month_number: 4,
              rating:5,
              place: place2
           )
MonthlyRating.create!(
              month_number: 5,
              rating:5,
              place: place2
           )
MonthlyRating.create!(
              month_number: 6,
              rating:4,
              place: place2
           )
MonthlyRating.create!(
              month_number: 7,
              rating:4,
              place: place2
           )
MonthlyRating.create!(
              month_number: 8,
              rating:3,
              place: place2
           )
MonthlyRating.create!(
              month_number: 9,
              rating:5,
              place: place2
           )
MonthlyRating.create!(
              month_number: 10,
              rating:5,
              place: place2
           )
MonthlyRating.create!(
              month_number: 11,
              rating:5,
              place: place2
           )
MonthlyRating.create!(
              month_number: 12,
              rating:5,
              place: place2
           )

#############################################

place3 = Place.create!(
              city: "Maui",
              name: "Maui",
              latitude:  21.289373,
              longitude:  -157.917480,
              description: "Maui is arguably the best known kiteboarding destination in the world, and Kite Beach is probably the best place to experience all that Maui has to offer. The beautiful tropical beach has clean, warm water, steady trade winds, long stretches of calm water, and gentle waves for more experienced riders. The area is full of world-class instructors and amazing athletes. Want to try kiteboarding? Check out Action Sports Maui for lessons and gear.",
              photo: "hawaii.jpg",
              country:"Hawaii"
              )
  MonthlyRating.create!(
                month_number: 1,
                rating:1,
                place: place3
             )
  MonthlyRating.create!(
                month_number: 2,
                rating:2,
                place: place3
             )
  MonthlyRating.create!(
                month_number: 3,
                rating:4,
                place: place3
             )
  MonthlyRating.create!(
                month_number: 4,
                rating:5,
                place: place3
             )
  MonthlyRating.create!(
                month_number: 5,
                rating:4,
                place: place3
             )
  MonthlyRating.create!(
                month_number: 6,
                rating:5,
                place: place3
             )
  MonthlyRating.create!(
                month_number: 7,
                rating:5,
                place: place3
             )
  MonthlyRating.create!(
                month_number: 8,
                rating:5,
                place: place3
             )
  MonthlyRating.create!(
                month_number: 9,
                rating:4,
                place: place3
             )
  MonthlyRating.create!(
                month_number: 10,
                rating:4,
                place: place3
             )
  MonthlyRating.create!(
                month_number: 11,
                rating:4,
                place: place3
             )
  MonthlyRating.create!(
                month_number: 12,
                rating:2,
                place: place3
             )

############################

place4 = Place.create!(
              city: "CALAMIANES ISLANDS,".downcase,
              name: "CALAMIANES ISLANDS,".downcase,
              latitude:  14.599512,
              longitude: 120.984222,
              description: "The unspoiled tranquility of the Calamines Islands may be a plane and a boat ride away, but the perfect and uncrowded kitesurfing conditions make the extra effort worth it. The secluded area has conditions for every skill level: open water chop or silky smooth water all surrounded by unspoiled beauty. For island tours, lessons, and equipment get in touch with the solar powered kite camp 250K Kitesurf Camp.",
              photo: "phillipine.jpg",
              country:"PHILIPPINES"
              )

  MonthlyRating.create!(
                month_number: 1,
                rating:5,
                place: place4
             )
  MonthlyRating.create!(
                month_number: 2,
                rating:5,
                place: place4

             )
  MonthlyRating.create!(
                month_number: 3,
                rating:5,
                place: place4
             )
  MonthlyRating.create!(
                month_number: 4,
                rating:4,
                place: place4
             )
  MonthlyRating.create!(
                month_number: 5,
                rating:3,
                place: place4
             )
  MonthlyRating.create!(
                month_number: 6,
                rating:3,
                place: place4
             )
  MonthlyRating.create!(
                month_number: 7,
                rating:2,
                place: place4
             )
  MonthlyRating.create!(
                month_number: 8,
                rating:1,
                place: place4

             )
  MonthlyRating.create!(
                month_number: 9,
                rating:2,
                place: place4
             )
  MonthlyRating.create!(
                month_number: 10,
                rating:3,
                place: place4
             )
  MonthlyRating.create!(
                month_number: 11,
                rating:4,
                place: place4
             )
  MonthlyRating.create!(
                month_number: 12,
                rating:4,
                place: place4
             )

place5 = Place.create!(
              city: "Jupiter",
              name: "Park city",
              latitude: 26.9338889,
              longitude:  -80.0944444,
              description: "This beach town sits on the southeast coast of Florida, and the water here offers everything from glossy flat water to big swells for the advanced riders. Head down to the part of Juno Beach appropriately named Kite Beach and get ready to launch. The locals here are known for being super friendly, and you can check out Jupiter Kiteboarding for lessons, rentals, or some local knowledge.",
              photo: "jupiter.jpg",
              country:"United States"
              )

 MonthlyRating.create!(
                month_number: 1,
                rating:2,
                place: place5
             )
  MonthlyRating.create!(
                month_number: 2,
                rating:2,
                place: place5
             )
  MonthlyRating.create!(
                month_number: 3,
                rating:2,
                place: place5
             )
  MonthlyRating.create!(
                month_number: 4,
                rating:2,
                place: place5
             )
  MonthlyRating.create!(
                month_number: 5,
                rating:3,
                place: place5
             )
  MonthlyRating.create!(
                month_number: 6,
                rating:4,
                place: place5
             )
  MonthlyRating.create!(
                month_number: 7,
                rating:5,
                place: place5
             )
  MonthlyRating.create!(
                month_number: 8,
                rating:5,
                place: place5
             )
  MonthlyRating.create!(
                month_number: 9,
                rating:5,
                place: place5
             )
  MonthlyRating.create!(
                month_number: 10,
                rating:3,
                place: place5
             )
  MonthlyRating.create!(
                month_number: 11,
                rating:2,
                place: place5
             )
  MonthlyRating.create!(
                month_number: 12,
                rating:2,
                place: place5
             )

place6 = Place.create!(
              city: "Wissant",
              name: "Wissant",
              latitude: 50.8833,
              longitude: 1.6667,
              description: "A very large beach of nice and soft sand at low tide, it could be a bit far away to walk to the sea when it's low tide. At high tide there is only a little part of sand which is enough to put the stuff of everyone. There are no rocks. No problem to launch and land kites.",
              photo: "wissant.jpg",
              country:"France"
              )

 MonthlyRating.create!(
                month_number: 1,
                rating:2,
                place: place6
             )
  MonthlyRating.create!(
                month_number: 2,
                rating:2,
                place: place6
             )
  MonthlyRating.create!(
                month_number: 3,
                rating:3,
                place: place6
             )
  MonthlyRating.create!(
                month_number: 4,
                rating:4,
                place: place6
             )
  MonthlyRating.create!(
                month_number: 5,
                rating:4,
                place: place6
             )
  MonthlyRating.create!(
                month_number: 6,
                rating:3,
                place: place6
             )
  MonthlyRating.create!(
                month_number: 7,
                rating:5,
                place: place6
             )
  MonthlyRating.create!(
                month_number: 8,
                rating:5,
                place: place6
             )
  MonthlyRating.create!(
                month_number: 9,
                rating:5,
                place: place6
             )
  MonthlyRating.create!(
                month_number: 10,
                rating:4,
                place: place6
             )
  MonthlyRating.create!(
                month_number: 11,
                rating:3,
                place: place6
             )
  MonthlyRating.create!(
                month_number: 12,
                rating:3,
                place: place6
             )


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

User.create!(
            email: 'hauwengeoffroy@gmail.com',
            password: '123456',
            password_confirmation: '123456'
          )



############ WISHLIST 1 ##############
a = Wishlist.create!(
              user_id: User.first.id,
              name: "holidays"
              )

a.wishlists_places.create!(
              place_id: Place.last.id
              )
a.wishlists_places.create!(
              place_id: Place.first.id
              )
#######################################



Review.create!(
             user_id: User.first.id,
             place_id: Place.last.id,
             content: "Amazing place ! a lot of wind during my holidays in december ",
             rating: 5
   )

Review.create!(
             user_id: User.last.id,
             place_id: Place.first.id,
             content: "amazing spot ! Big wave for people like surf with your kite :) ",
             rating: 2
   )


puts 'Seed Completed'
