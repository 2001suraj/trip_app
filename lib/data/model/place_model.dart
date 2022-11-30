// ignore_for_file: public_member_api_docs, sort_constructors_first
class Places {
  String name;
  String des1;
  String des2;
  String photourl;
  String location;
  double lat;
  double log;
  Places({
    required this.photourl,
    required this.location,
    required this.des1,
    required this.des2,
    required this.name,
    required this.lat,
    required this.log,
  });
}
//   static List<Places> place = [
//     Places(
//       lat: 27.7149,
//       log: 85.2903,
//       name: 'Swayambhunath Temple',
//       des1:
//           '''Swayambhunath Temple is amongst the most famous holy places to visit in Nepal. The presence of a large number of monkeys around the complex makes it popular as the Monkey Temple. The temple's architect is also grand and impressive with a central white stupa, a golden spire depicting Buddha’s eyes in all four directions.   ''',
//       des2:
//           '''The complex is home to several small beautifully-carved temples, statues, flags and Buddhist prayer wheels and is visited by Hindu and Buddhist devotees.''',
//       location: 'BHAGANPAU 44600, Nepal',
//       photourl:
//           'https://images.thrillophilia.com/image/upload/s--cgWM95ZK--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/881/original/1614582769_shutterstock_1463337548.jpg.jpg',
//     ),
//     Places(
//       lat: 27.9881,
//       log: 86.9250,
//       name: 'Mt. Everest',
//       des1:
//           '''The highest mountain on the earth, Mount Everest is known as a dream destination for trekkers and indeed a life changing experience. Bordering north eastern Nepal and Tibet Autonomous Region of China, the region is home to vast glaciers, icefalls, mountains, deep valleys, Sherpa villages and the centre of attraction for alpine and adventure enthusiasts. ''',
//       des2:
//           '''Several rare and endangered species such as snow leopard, Himalayan black bear, red panda, musk deer, Himalayan wolves, etc., are also found in the region.''',
//       location: 'Solukhumbu District, Province No. 1, Nepal',
//       photourl:
//           'https://images.thrillophilia.com/image/upload/s--_sflx9eE--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/882/original/1614583009_shutterstock_347564906.jpg.jpg',
//     ),
//     Places(
//       lat: 27.49,
//       log: 84.46,
//       name: 'Trisuli River',
//       des1:
//           'A popular destination for kayaking, rafting, camping, and day trips, the Trisuli River is one of the most adventure-filled places to visit in Nepal. Running through a forested valley, it features relatively warm water and level IV rapids to enjoy thrilling water sports and adventures.',
//       des2:
//           '''It is also a preferred destination for short weekend trips as it is just 3 to 3.5 hours drive from Kathmandu and offers a nature retreat away from the city's hustle-bustle. Originating from the Tibet region of China it ends into the Narayani River and offers plenty of opportunities for fun.''',
//       location: 'Gosaikunda, Rasuwa, Nepal',
//       photourl:
//           'https://images.thrillophilia.com/image/upload/s--lwmFjpwi--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/883/original/1614583171_shutterstock_1761642863.jpg.jpg',
//     ),
//     Places(
//       lat: 26.9127,
//       log: 87.1567,
//       name: 'Bhote Kosi River',
//       des1:
//           '''Known as 'The harmony of Tibet and the Himalayas', the Kosi River is another stunning destination for experiencing the excitements and thrills of white water rafting. Being the steepest river in Nepal, rafting through this river promises endless rapid action and a huge adrenaline rush.''',
//       des2:
//           '''Bhote Kosi runs through lush valleys, unexplored archaeological sites, class III to IV levels of rapids, boulder gardens, small waterfalls, etc., making rafting through it an everlasting experience complete with pleasure, beauty, and thrills. It also features a highly sought-after spot for enjoying bungee jumping activities.''',
//       location: 'Kabra',
//       photourl:
//           'https://images.thrillophilia.com/image/upload/s--1u1Trt2i--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/884/original/1614583303_shutterstock_2649165.jpg.jpg',
//     ),
//     Places(
//       lat: 28.1900,
//       log: 83.9593,
//       name: 'Davis Falls',
//       des1:
//           '''A small yet stunning waterfall, Davis Fall was discovered when a woman named Devi was drowned in it in 1961. The waterfall is situated amidst rocky and lush landscapes and ends in a 500 feet long underground tunnel. ''',
//       des2:
//           '''Davis Waterfall water stream gets diminished leaving no clue of its presence and is amongst the most mysterious places to see in Nepal. The elegance of the area multiplies manifold during rains and is a sight to behold.''',
//       location: 'Sital path, Pokhara 33700, Nepal',
//       photourl:
//           'https://images.thrillophilia.com/image/upload/s--LvmEOVSP--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/890/original/1614583629_shutterstock_1269879145.jpg.jpg',
//     ),
//     Places(
//       lat: 27.9324,
//       log: 86.7014,
//       name: 'Sagarmatha National Park',
//       des1:
//           'Another UNESCO World Heritage Site, the Sagarmatha National Park is a world-famous wildlife reserve for its rare species of animals, birds, majestic Mount Everest and many other Himalayan peaks. It is also a famous region for indulging in trekking and hiking amidst stunning scenery. ',
//       des2:
//           'It also served as a preservation centre for rare wild animals like pheasant, snow leopard, and red panda. Featuring a diverse fauna of pine, oak and rhododendrons, the area attracts wildlife and nature photographers as well.',
//       location: 'Solukhumbu District, Nepal',
//       photourl:
//           'https://images.thrillophilia.com/image/upload/s--Qx8O4aSh--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/892/original/1614583722_1516167688_Yak-nepal.jpg.jpg.jpg',
//     ),
//     Places(
//       lat: 27.6727,
//       log: 85.3253,
//       name: 'Patan Durbar Square',
//       des1:
//           'A UNESCO heritage site in Lalitpur, the Patan Durbar Square is amongst the major Durbar Squares in Kathmandu Valley. It reflects the ancient architecture, heritage, and culture of the country through its temples, old palaces and houses.',
//       des2:
//           'Though a large part of the Square got destroyed during the 2015 earthquake, the Nepal government is trying to preserve and rebuild the structures to get back that age-old elegance.',
//       location: ' Lalitpur 44600, Nepal',
//       photourl:
//           'https://images.thrillophilia.com/image/upload/s--h4IN-iLV--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/896/original/1616065561_1614599843_shutterstock_219249130.jpg.jpg.jpg',
//     ),
//     Places(
//         lat: 26.9112,
//         log: 87.9237,
//         name: 'Ilam',
//         des1:
//             '''Offering a respite from the city's hectic and fast running life, Ilam is known for its tea gardens, lush woods, majestic hills, and friendly ambience. Famously known as Charkhol (area of four rivers), this region has four main rivers and is also rich in cultural diversity, natural scenery, and spices & tea estates.''',
//         des2:
//             '''It is located in far eastern Nepal and is a quaint little hill town. A favourite destination amongst locals to tourists for having a revitalizing vacation amidst greens, it also offers settings for indulging in activities like nature walks, birdwatching, hiking, trekking, plantation tours, horse riding, etc.''',
//         location: ' Mahabharata Hilly Range, Nepal',
//         photourl:
//             'https://images.thrillophilia.com/image/upload/s--UUoy68gx--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/935/original/1614591645_1614327509_shutterstock_1694944438.jpg.jpg.jpg'),
//     Places(
//       lat: 27.9320,
//       log: 86.8050,
//       name: 'Khumbu Valley',
//       des1:
//           'Located in Solukhumbu District, in northeastern Nepal, the valley is home to Mt Everest and many other enormous Himalayan peaks. The valley has various Khambu and Sherpa settlements and villages. Sherpas have built some lodges for the visitors and also work as guides who help foreign climbers and trekkers in reaching the summits.',
//       des2:
//           'The renowned Tengboche Buddhist monastery and Sagarmatha National Park along with its buffer zone are also part of this region making it one of the most beautiful and famous places to visit in Nepal.',
//       location: 'Solukhumbu District, Nepal',
//       photourl:
//           'https://images.thrillophilia.com/image/upload/s--tDnWVeB4--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/899/original/1614584086_1614333219_shutterstock_1756963373.jpg.jpg.jpg',
//     ),
//     Places(
//       lat: 27.9194,
//       log: 85.1661,
//       name: 'Nuwakot',
//       des1:
//           'A town of great historical significance, Nuwakot (nine forts) is settled near the convergence point of the Tandi and Trisuli Rivers. The fortress is a seven-story structure known as the Nuwakot Durbar complex and served as an important trading gate between India and Tibet.',
//       des2:
//           'The complex is a marvellous example of Newari architectural style and houses Bhairav Temple and many other shrines. Nuwakot is also a centre of attraction not only for its architectural glory but for offering scenic opportunities for trekking, hiking, climbing and mountain biking.',
//       location: 'Nuwakot District, Bagmati Province, Nepal',
//       photourl:
//           'https://images.thrillophilia.com/image/upload/s--U4eLJUmd--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/900/original/1616065668_13185632224_4f825aa7f7_b.jpg.jpg',
//     ),
//   ];

//   static List<Places> place1 = [
//     Places(
//       name: 'White Monastery',
//       des1:
//           'A place of spiritual and religious significance, the White Monastery in Nepal amuses the visitors with its white facade and impressive interiors. The surroundings act as a stunning backdrop and offer surreal views of the rising and setting sun.',
//       des2:
//           'The monastery is perched on a hilltop and can be reached either by a hired cab or bike or trekking through picturesque trails. The views of the Kathmandu Valley are mesmerizing and offer opportunities to capture dreamy sceneries.',
//       location: 'White Monastery Road, Kathmandu 44600, Nepal',
//       photourl:
//           'https://images.thrillophilia.com/image/upload/s--Uo0l-icM--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/901/original/1614584549_7865946718_7023e90987_b.jpg.jpg.jpg',
//       lat: 27.7250,
//       log: 27.7250,
//     ),
//     Places(
//       name:'Thamel',
//       des1:'''Famous for its street shops and bustling nightlife, Thamel is indeed a haven for tourists looking for good food, souvenirs, and nightspots in Kathmandu. But the town has another side beyond night parties and shopping sprees that makes it a significant location to learn about Nepal' rich heritage and culture.''',
//       des2: 'It houses a serene and centuries-old Vikramshila Mahavihara Monastery, Tri Devi Mandir, Ghairi Dhara, Ashoka Stupa, several other ancient shrines, and cultural monuments that add to its religious and historical importance. Thamel is truly a treasure of attractions and activities and is one of the vibrant places to visit in Nepal.',
          
//       location: 'Bagmati Province, Kathmandu',
//       photourl:'https://images.thrillophilia.com/image/upload/s--0V9o5jpV--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/916/original/1614586191_1612436859_shutterstock_1163823799.jpg.jpg.jpg' ,
//       lat: 27.7154,
//       log: 85.3123,
//     ),
//     Places(
//       name: 'Garden Of Dreams',
//       des1:'Known as the Garden of Six Senses, this is a neo-classical oasis settled in Kaiser Mahal complex Kathmandu. It is spread across 6,895 square metres and comprises aesthetically designed landscapes, three pavilions, a magnificent amphitheatre, ponds, urns, paved paths, pergolas, and stunning views.',
//       des2:'The garden was restored to its new look and is a centre of attraction for tourists. Amongst the most crowded places to visit in Nepal, it is thronged by families, couples to the group of friends to experience some beautiful moments.' ,
          
//       location: ',White Monastery Road, Kathmandu 44600, Nepal',
//       photourl:'https://images.thrillophilia.com/image/upload/s--Hxosr3vu--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/915/original/1614586131_24774944299_92a05caabb_b.jpg.jpg.jpg' ,
//       lat: 27.7141,
//       log: 85.3145,
//     ),
//     Places(
//       name: 'Rupa Tal Lake',
//       des1:'The freshwater lake in Pokhara, Rupa Tal Lake is appreciated for its serene surroundings and pristine water. It is the third-largest lake in Pokhara valley and offers boating and fishing, like activities. Located at 600 m from sea level, this lake is surrounded by rich flora and fauna and offers a sight to capture and cherish.',
//       des2: 'Its twin, Begnas Lake is also nearby and is connected with the Rupa Lake with a bridge making the lakes appear like the eyes of Pokhara. ',
          
//       location: 'Kaski District, Pokhara 33700, Nepal',
//       photourl:'https://images.thrillophilia.com/image/upload/s--q2d7g2PM--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/922/original/1614586779_6171682195_1995482ddc_b.jpg.jpg.jpg' ,
//       lat: 28.1542,
//       log:84.1132 ,
//     ),
//     Places(
//       name: 'Dharan',
//       des1:'A beautiful city located near the southeastern border of India, Dharan serves as the gateway to the Mahabharata Hills. It is a city of cultural diversity and a hub for football in Nepal. It is one of the famous places to visit in Nepal for its natural beauty as well as thrilling activities like golf, hiking, trekking, picnicking, night parties, etc.',
//       des2: 'Tamar Khola, Yalamber Park, Bhanu Chowk, Budha Subba Temple, Jatta, Vijaypur Hill, Dantakali Temple, Pindeshwor Temple, and Panchakanya Temple, are a few attractions in Dharan that make it a major tourist place in Nepal.',
          
//       location: 'Sunsari District, Nepal',
//       photourl: 'https://images.thrillophilia.com/image/upload/s--VSfXz7Gg--/c_fill,g_center,h_300,q_auto,w_576/dpr_1.5,f_auto,fl_strip_profile/v1/images/photos/000/367/933/original/1614591306_1516107240_bhedetar.jpg.jpg.jpg',
//       lat: 26.8065,
//       log:87.2846 ,
//     ),
//   ];

//   toList() {}
// }
