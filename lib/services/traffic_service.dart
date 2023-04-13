import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
class TrafficService{

final Dio _dioTRaffic;
final String _baseTrafficUrl = 'https://api.mapbox.com/directions/v5/mapbox';

TrafficService()
: _dioTRaffic = Dio();

Future getCoorsStartToEnd(LatLng start,LatLng end )async{
  final coorsString ='${start.longitude}, ${start.latitude}:${end.longitude}, ${end.latitude}';
final url = '$_baseTrafficUrl/driving/$coorsString';
final resp =await _dioTRaffic.get(url);
return resp.data;

  }

}