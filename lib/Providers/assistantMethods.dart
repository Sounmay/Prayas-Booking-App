import 'package:freelance_booking_app/Providers/configmaps.dart';
import 'package:freelance_booking_app/Providers/requestAssistant.dart';
import 'package:geolocator/geolocator.dart';

class AssistantMethods{
  static Future<String> searchCoordinateAddress(Position position) async {
    String placeAddress = "";
    String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    var response = await RequestAssistant.getRequest(url);

    if(response != "Failed"){
      placeAddress = response["results"][0]["formatted_address"];

    }
    return placeAddress;
  }
}