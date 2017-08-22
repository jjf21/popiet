puts 'Erasing all the DB'
puts 'Seeding your app'


Place.create!(
              id:"1"
              city: "Grand Cayman",
              name: "Grand Cayman",
              latitude: " 19.292997",
              longitude: " -81.366806",
              description: "Grand Cayman has some of the best kiteboarding conditions in the world. The wind tends to be steady and warm, and the protected bays situated all over the island offer lots of room for experienced riders to cruise around and for beginners to build their skills. If you’re new to the sport or not interested in traveling with all your gear, check out Sweet Spot Watersports for rentals and lesson packages."
              photo: "cayman.jpg"
              country:"Cayman Islands"
              )

Place.create!(
              id:"2"
              city: "Nabq Bay",
              name: "Nabq Bay",
              latitude: "50.8833",
              longitude: "1.6667",
              description: "This beautiful beach town offers a riding area guarded by reefs, which create relatively shallow and flat waters, and the wind blows at least 20 knots on most days. The reef also means that the riding area is minimally affected by tides, giving you hours of uninterrupted play time."
              photo: "egypt1.jpg"
              country:"Egypt"
              )

Place.create!(
              id:"3"
              city: "Maui",
              name: "Maui",
              latitude: "50.8833",
              longitude: "1.6667",
              description: "Maui is arguably the best known kiteboarding destination in the world, and Kite Beach is probably the best place to experience all that Maui has to offer. The beautiful tropical beach has clean, warm water, steady trade winds, long stretches of calm water, and gentle waves for more experienced riders. The area is full of world-class instructors and amazing athletes. Want to try kiteboarding? Check out Action Sports Maui for lessons and gear."
              photo: "hawaii.jpg"
              country:"Hawaii"
              )

Place.create!(
              id:"4"
              city: "Wissant",
              name: "Wissant",
              latitude: "50.8833",
              longitude: "1.6667",
              description: "Wissant, à la pointe du pas de Calais est le spot le plus venté et fréquenté du nord. Assez accessible par vent modéré, il peut devenir très technique par vent fort avec un courant et une barre dissuasive."
              photo: "wissant.jpg"
              country:"France"
              )

Place.create!(
              id:"5"
              city: "Wissant",
              name: "Wissant",
              latitude: "50.8833",
              longitude: "1.6667",
              description: "Wissant, à la pointe du pas de Calais est le spot le plus venté et fréquenté du nord. Assez accessible par vent modéré, il peut devenir très technique par vent fort avec un courant et une barre dissuasive."
              photo: "wissant.jpg"
              country:"France"
              )

Place.create!(
              id:"6"
              city: "Wissant",
              name: "Wissant",
              latitude: "50.8833",
              longitude: "1.6667",
              description: "Wissant, à la pointe du pas de Calais est le spot le plus venté et fréquenté du nord. Assez accessible par vent modéré, il peut devenir très technique par vent fort avec un courant et une barre dissuasive."
              photo: "wissant.jpg"
              country:"France"
              )


User.create!(
             email: 'carl.quivron@gmail.com',
             password: '123456',
             password_confirmation: '123456',
             )

User.create!(
            email: 'augustin.poupard@gmail.com',
            password: '123456',
            password_confirmation: '123456',
          )

User.create!(
            email: 'hauwengeoffroy@gmail.com',
            password: '123456',
            password_confirmation: '123456',
          )

puts 'Seed Completed'
