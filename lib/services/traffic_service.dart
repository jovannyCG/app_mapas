import 'package:app_mapas/models/models.dart';
import 'package:app_mapas/services/services.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
class TrafficService{
//
final Dio _dioTraffic;
final Dio _dioPlaces;
final String _baseTrafficUrl = 'https://api.mapbox.com/directions/v5/mapbox';
final String _basePlacesUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';

TrafficService()
: _dioTraffic = Dio()..interceptors.add(TrafficInterceptor()),
_dioPlaces = Dio()..interceptors.add(PlacesInterceptor());

Future<TrafficResponse>getCoorsStartToEnd(LatLng start,LatLng end ) async {

  final coorsString ='${start.longitude},${start.latitude};${end.longitude},${end.latitude}';

final url = '$_baseTrafficUrl/driving/$coorsString';

final resp = await _dioTraffic.get(url);

final data =TrafficResponse.fromMap(resp.data);

return data;

  }

  Future<List<Feature>> getResultsByQuery(LatLng proximity, String query) async{
    if(query.isEmpty) return [];
    final url ='$_basePlacesUrl/$query.json';
    final resp = await _dioPlaces.get(url, queryParameters: {
      'proximity':'${proximity.longitude},${proximity.latitude}'
    });
    final placesResponce = PlacesResponse.fromJson(resp.data);
    //final data =PlacesResponse.fromMap(resp.data);

return  placesResponce.features;
  }

}