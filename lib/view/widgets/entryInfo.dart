import 'package:flutter/material.dart';
import 'package:travel_guide/view/screens/home_screen.dart';
import 'package:travel_guide/view/widgets/entry_button.dart';
import 'package:travel_guide/constants.dart';

class EntryInfo extends StatefulWidget {
  @override
  _EntryInfoState createState() => _EntryInfoState();
}

class _EntryInfoState extends State<EntryInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Enjoy Every\nMoment With Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: size.height * 0.2,
          width: size.width,
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EntryButton(
                color: kPrimaryColor,
                text: "Lets plan your trip",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreen()));
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
