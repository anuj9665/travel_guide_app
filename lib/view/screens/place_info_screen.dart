import 'package:flutter/material.dart';
import 'package:travel_guide/constants.dart';
import 'package:travel_guide/model/spot.dart';

class PlaceInfoScreen extends StatefulWidget {
  final String info;
  final String image;
  final String name;
  final String kinds;
  final String city;
  PlaceInfoScreen({ this.info, this.image, this.name, this.kinds, this.city});
  @override
  _PlaceInfoScreenState createState() => _PlaceInfoScreenState();
}

class _PlaceInfoScreenState extends State<PlaceInfoScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.image),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: size.height * 0.08,
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.favorite_rounded,
                      size: 30.0,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ),
              Spacer(),
              ObjectInfo(info: widget.info,
                    name: widget.name,
                    kinds: widget.kinds,
                    image: widget.image,
                    city: widget.city,),
            ],
          ),
        ),
      ),
    );
  }
}

class ObjectInfo extends StatefulWidget {
  final String info;
  final String image;
  final String name;
  final String kinds;
  final String city;

  const ObjectInfo({Key key, this.info, this.image, this.name, this.kinds, this.city}) : super(key: key);
  @override
  _ObjectInfoState createState() => _ObjectInfoState();
}

class _ObjectInfoState extends State<ObjectInfo> {
  bool showDescription = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          GestureDetector(
            child: Icon(
                showDescription
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_up,
                color: Colors.white),
            onTap: () {
              setState(() {
                showDescription = !showDescription;
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.0),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Divider(
                thickness: 3.0,
                indent: 80.0,
                endIndent: 80.0,
                color: Colors.white,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 20.0,
                  ),
                  Text(
                    widget.city,
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(width: 30.0),
                  Text(
                    widget.kinds,
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              showDescription
                  ? Container(
                      margin: EdgeInsets.only(top: 10.0),
                      height: size.height * 0.27,
                      child: SingleChildScrollView(
                        child: Text(
                          widget.info,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    )
                  : Text(''),
            ]),
          ),
        ],
      ),
    );
  }
}
