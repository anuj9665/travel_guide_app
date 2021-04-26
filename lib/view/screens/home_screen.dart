import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/constants.dart';
import 'package:travel_guide/controller/places_api.dart';
import 'package:travel_guide/controller/spot_api.dart';
import 'package:travel_guide/main.dart';
import 'package:travel_guide/model/place..dart';
import 'package:travel_guide/model/spot.dart';
import 'package:travel_guide/model/temp/newone1.dart';
import 'package:travel_guide/view/screens/newone.dart';
import 'package:travel_guide/view/screens/place_attraction.dart';
import 'package:travel_guide/view/screens/place_info_screen.dart';

final globalScaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalScaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://image.freepik.com/free-vector/gray-white-gradient-abstract-background_53876-62182.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discover',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                            size: 30.0,
                          ),
                        ],
                      ),
                      Text(
                        'Amazing Places',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(
                          color: Colors.white, fontFamily: "WorkSansLight"),
                      filled: true,
                      fillColor: kPrimaryColor.withOpacity(0.7),
                      hintText: 'Search city or place',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 20.0,
                      ),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.38,
                  //  color: Colors.redAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '     Popular Cities to travel  ',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0),
                            textAlign: TextAlign.center,
                          ),
                          CircleAvatar(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 23.0,
                            ),
                            backgroundColor: kPrimaryColor,
                            radius: 13.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView(
                          children: [
                            CarouselSlider(
                              items: [
                                //1st Image of Slider
                                CityCards(
                                  url:
                                      "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/02/a0002533/img/basic/a0002533_main.jpg?20210122155600&q=80&rw=750&rh=536",
                                  placeTitle: 'Tokyo',
                                  placeCountry: 'Japan',
                                ),

                                CityCards(
                                  placeTitle: 'Athens',
                                  placeCountry: 'Greece',
                                  url:
                                      "https://www.smartcitiesworld.net/AcuCustom/Sitename/DAM/016/Athens_-_AdobeStock_125876014.jpg",
                                ),

                                CityCards(
                                    placeTitle: 'NewYork',
                                    placeCountry: 'USA',
                                    url:
                                        "https://2486634c787a971a3554-d983ce57e4c84901daded0f67d5a004f.ssl.cf1.rackcdn.com/new-york-hotel-pennsylvania/media/hotelpenn-homepage-01-mobileheader-5cc091eb8cc0a.jpg"),
                                CityCards(
                                    placeTitle: 'London',
                                    placeCountry: 'United Kingdom',
                                    url:
                                        "https://cdn.citybaseapartments.com/blog/cba-media/2017-02/London-with-rainbow-Houses-of-parliament-Big-ben-iStock_000051762496_small.jpg?ooMediaId=4463"),

                                CityCards(
                                    placeTitle: 'Austria',
                                    placeCountry: 'Australia',
                                    url:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtuTz45JchkWn9botXpMgDVj21sJKEsaNbcw&usqp=CAU"),
                              ],

                              //Slider Container properties
                              options: CarouselOptions(
                                height:
                                    MediaQuery.of(context).size.height * 0.29,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                viewportFraction: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '     Popular Spots near you  ',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    CircleAvatar(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 23.0,
                      ),
                      backgroundColor: kPrimaryColor,
                      radius: 13.0,
                    ),
                  ],
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          NearSpotsCard(
                            url:
                                'https://www.holidify.com/images/cmsuploads/compressed/5621259188_e74d63cb05_b_20180302140149.jpg',
                            objectName: 'India Gate',
                            objectPlace: 'Monument',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          NewOnee()));
                            },
                          ),
                          NearSpotsCard(
                            url:
                                'https://www.holidify.com/images/cmsuploads/compressed/Qutub_Minar_in_the_monsoons_20170908115259.jpg',
                            objectName: 'Qutub Minar',
                            objectPlace: 'Monument',
                          ),
                          NearSpotsCard(
                            url:
                                'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2015/07/The-Fort-at-Hauz-Khas-.jpg',
                            objectName: 'Hauz Khas',
                            objectPlace: 'Adventure',
                          ),
                          NearSpotsCard(
                            url:
                                'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2015/07/Paintball-in-Delhi-.jpg',
                            objectName: 'Paint Ball',
                            objectPlace: 'Fun Activity',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          PlaceInfoScreen()));
                            },
                          ),
                          NearSpotsCard(
                            url:
                                'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2015/07/An-exhibit-at-National-Gallery-of-Modern-art.jpg',
                            objectName: 'Modern Art',
                            objectPlace: 'Museum',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          NewOne()));
                            },
                          ),
                          NearSpotsCard(
                            url:
                                'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2015/07/All-American-Diner-in-India-Habitat-Centre-.jpg',
                            objectName: 'Dine-In',
                            objectPlace: 'Restaurant',
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NearSpotsCard extends StatelessWidget {
  final String url;
  final String objectName;
  final String objectPlace;
  final Function onTap;
  const NearSpotsCard({
    Key key,
    this.url,
    this.objectName,
    this.objectPlace,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.3,
        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              objectName,
              style: TextStyle(color: Colors.white, fontSize: 21.0),
            ),
            Text(
              objectPlace,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CityCards extends StatefulWidget {
  final String url;
  final String placeTitle;
  final String placeCountry;

  const CityCards({Key key, this.url, this.placeTitle, this.placeCountry});

  @override
  _CityCardsState createState() => _CityCardsState();
}

class _CityCardsState extends State<CityCards> {
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          navigatorKey.currentContext,
          MaterialPageRoute(builder: (context) {
            return PlaceAttraction(
              placeName: widget.placeTitle,

            );
          }),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(widget.url),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.placeTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  size: 15.0,
                  color: Colors.white,
                ),
                Text(
                  widget.placeCountry,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 15.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// List<Spot> spotlist = [
//   Spot(
//     name: "The Imperial Palace",
//     image:
//         "https://www.planetware.com/photos-large/JPN/japan-tokyo-imperial-palace.jpg",
//     info:
//         "The chief attraction of Tokyo's Marunouchi district is the Imperial Palace (Kōkyo) with its beautiful 17th-century parks surrounded by walls and moats. Still in use by the Imperial family, the Imperial Palace stands on the site where, in 1457, the Feudal Lord Ota Dokan built the first fortress, the focal point from which the city of Tokyo (or Edo, as it was then) gradually spread.",
//     kinds: "Cultural",
//     city: "Tokyo",
//   ),
//   Spot(
//     name: "Ginza District",
//     image:
//         "https://www.planetware.com/photos-large/JPN/japan-tokyo-ginza.jpg",
//     info:
//         "Ginza is Tokyo's busiest shopping area and it's as iconic as Times Square in New York, and much older. It has in fact been the commercial center of the country for centuries, and is where five ancient roads connecting Japan's major cities all met. Lined by exclusive shops and imposing palatial stores, the Ginza district is also fun to simply wander around or. ",
//     kinds: "Shopping",
//     city: "Tokyo",
//   ),
//   Spot(
//     name: "Sensō-ji Temple",
//     image:
//         "https://www.planetware.com/photos-large/JPN/japan-tokyo-asakusa-senso-ji-temple.jpg",
//     info:
//         "In the Asakusa district of Tokyo, the exquisite Sensō-ji Temple (Kinryū-zan Sensō-ji)) - the city's most famous shrine - stands at the end of a long street market hosting vendors selling masks, carvings, combs made of ebony and wood, toys, kimonos, fabrics, and precious paper goods.",
//     kinds: "Temple",
//     city: "Tokyo",
//   ),
//   Spot(
//     name: "National Museum of Nature and Science",
//     image:
//         "https://www.planetware.com/wpimages/2020/09/japan-tokyo-top-attractions-national-museum-nature-science.jpg",
//     info:
//         "Located in Tokyo's Ueno Park, the superb National Museum of Nature and Science (Kokuritsu Kagaku Hakubutsukan) opened in 1871 and is one of the country's oldest museums.Now completely renovated and modernized, the museum also boasts a reputation as one of the country's busiest and largest museums, housing a vast collection of some 250,000 materials related to natural history and science.",
//     kinds: "Museum",
//     city: "Tokyo",
//   ),
//   Spot(
//     name: "Ueno Park and Ueno Zoo",
//     image:
//         "https://www.planetware.com/photos-large/JPN/japan-tokyo-ueno-park-zoo.jpg",
//     info:
//         "A paradise-like oasis of green in the heart of busy Tokyo, Ueno Park (Ueno Kōen) is the city's largest green space and one of its most popular tourist attractions. In addition to its lovely grounds, the park also boasts numerous temples and museums to explore",
//     kinds: "Park",
//     city: "Tokyo",
//   ),
// ];
