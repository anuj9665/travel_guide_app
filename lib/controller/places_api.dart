import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_guide/constants.dart';
import 'package:travel_guide/model/place..dart';

List<String> spotIDList = [];
Place placeData;

Future<List<String>> getPlaceDetails(String placeName) async {
  String placeURL =
      "$apiConstantAddress/places/geoname?name=$placeName&apikey=$apiKey";
  print(placeURL);
  try {
    var response = await http.get(Uri.parse(placeURL));

    var placejsonData = jsonDecode(response.body);
 
    String placeSpotListURL =
        "$apiConstantAddress/places/radius?radius=10000&lon=${placejsonData['lon']}&lat=${placejsonData['lat']}&limit=10&apikey=$apiKey";
    var response1 = await http.get(Uri.parse(placeSpotListURL));
    var spotJsonData = jsonDecode(response1.body);
    
      spotJsonData['features'].forEach((element) {
        spotIDList.add(element['properties']['xid']);
      });
   
    if (placejsonData['status'] == "OK") {
      Place place = Place(
        placeName: placejsonData['name'],
        latitude: placejsonData['lat'],
        longitude: placejsonData['lon'],
        spotID: spotIDList,
      );
      placeData = place;
    } else {
      print('some error');
    }
  } catch (SocketException) {
    print("no data");
  }
  if (placeData.spotID.length > 0) {
    return placeData.spotID;
  } else {
    return null;
  }
}
