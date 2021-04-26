import 'package:flutter/material.dart';
import 'package:travel_guide/constants.dart';

class NewOne extends StatefulWidget {
  @override
  _NewOneState createState() => _NewOneState();
}

class _NewOneState extends State<NewOne> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2015/07/An-exhibit-at-National-Gallery-of-Modern-art.jpg'),
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
              ObjectInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class ObjectInfo extends StatefulWidget {
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
                'Modern Art Gallery',
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
                    ' New Delhi',
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(width: 30.0),
                  Text(
                    'Art Museum',
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
                          'Museums are a passé but this modern gallery is not! Spend a day exploring not just the fantastic locations but also the breathtaking art that the city has at its disposal. A trip to NGMA, /one of the most unique and fun places to visit in Delhi will surprise you with the amazing collection of paintings and sculptures.',
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
