import 'package:geolocator/geolocator.dart';

class LocationService {
  
  
  
  static Future<Position> getLocation () async {
   
    await checkPermission();

    final Position pos =  await Geolocator.getCurrentPosition(
      // desiredAccuracy: LocationAccuracy.lowest,
      // forceAndroidLocationManager: true,
      /// when time limit is reached then throw TimeOut Exception
      timeLimit: const  Duration(seconds: 60)
    );
    
    return pos  ; 
  }
  
  
  static Future<bool> checkPermission () async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return true; 
  }
}