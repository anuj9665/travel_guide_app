import 'package:flutter/material.dart';
import 'package:travel_guide/constants.dart';

class NewOnee extends StatefulWidget {
  @override
  _NewOneeState createState() => _NewOneeState();
}

class _NewOneeState extends State<NewOnee> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://wallpapercave.com/wp/wp4496466.jpg'),
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
                'India gate',
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
                    'Monument',
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
                          "The India Gate (formerly known as the All India War Memorial) is a war memorial located astride the Rajpath, on the eastern edge of the 'ceremonial axis' of New Delhi,[1] formerly called Kingsway. It stands as a memorial to 70,000 soldiers of the British Indian Army who died in between 1914 and 1921 in the First World War, in France, Flanders, Mesopotamia, Persia, East Africa, Gallipoli and elsewhere in the Near and the Far East, and the third Anglo-Afghan War. 13,300 servicemen's names, including some soldiers and officers from the United Kingdom, are inscribed on the gate.[2] Designed by Sir Edwin Lutyens, the gate evokes the architectural style of the triumphal arch such as the Arch of Constantine, in Rome, and is often compared to the Arc de Triomphe in Paris, and the Gateway of India in Mumbai.",
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
