import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_guide/constants.dart';
import 'package:travel_guide/model/spot.dart';

List<Spot> spotList = [];

Future<List<Spot>> getSpotList(List<String> spotIDList) async {
  try {
    spotIDList.forEach((element) async {
      String spotDetailsURL =
          "$apiConstantAddress/places/xid/$element?apikey=$apiKey";
      var response = await http.get(Uri.parse(spotDetailsURL));
      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (jsonData['name'] != null) {
          Spot spot = Spot(
            name: jsonData['name'],
            id: jsonData['xid'],
            image: jsonData['image'],
            info: jsonData['wikipedia_extracts']['text'],
            kinds: jsonData['kinds'],
          );
          spotList.add(spot);
        }
      } else {
        print(response.statusCode);
      }
    });
  } catch (SocketException) {
    print('no data');
  }

  if (spotList.length > 0) {
    return spotList;
  } else {
    return null;
  }
}
