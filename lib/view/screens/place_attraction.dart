import 'package:flutter/material.dart';
import 'package:travel_guide/controller/places_api.dart';
import 'package:travel_guide/controller/spot_api.dart';
import 'package:travel_guide/model/spot.dart';
import 'package:travel_guide/view/screens/place_info_screen.dart';

import '../../constants.dart';

List<Spot> spotList = [];

class PlaceAttraction extends StatefulWidget {
  final String placeName;

  PlaceAttraction({
    this.placeName,
  });

  @override
  _PlaceAttractionState createState() => _PlaceAttractionState();
}

class _PlaceAttractionState extends State<PlaceAttraction> {
  getPlaceData() async {
    List<String> spotIDList = await getPlaceDetails(widget.placeName);
    print(spotIDList);

    spotList = await getSpotList(spotIDList);
    print(spotList[0].image);
  }

  @override
  void initState() {
    getPlaceDetails(widget.placeName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: GestureDetector(
                  onTap: () {
                    spotIDList.clear();
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size: 40.0,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Some Places to explore in ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.placeName,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.74,
                        child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                          return SpotCards(
                            name: spotList[index].name,
                            image: spotList[index].image,
                            kinds: spotList[index].kinds,
                            city: spotList[index].city,
                            info: spotList[index].info,
                          );
                        }))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpotCards extends StatelessWidget {
  final String name;
  final List<Spot> spotList;
  final String kinds;
  final String image;
  final String info;
  final String city;
  const SpotCards({
    Key key,
    this.spotList,
    this.name,
    this.kinds,
    this.image,
    this.info,
    this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlaceInfoScreen(
                    info: info,
                    name: name,
                    kinds: kinds,
                    image: image,
                    city: city,
                  )),
        );
      },
      child: Container(
        height: 180.0,
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0),
            ),
            Text(
              kinds,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
