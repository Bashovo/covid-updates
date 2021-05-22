import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'country_details_screen.dart';
import 'data_storage.dart';
import 'models/countryModel.dart';

class World extends StatefulWidget {
  World({Key key}) : super(key: key);

  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  BuildContext _myContext;
  Completer<GoogleMapController> _controller = Completer();
  List<Countries> countries;
  static const LatLng _center = const LatLng(30.585163, 36.238415);
  Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  //this function generates the countries markers
  Future<void> _onMapCreated(GoogleMapController controller) async {
    _myContext = context;
    try {
      final List<Countries> countries = await DataStorage().getAllCountries();
      for (int x = 0; countries.length > x; x++) {
        if (x != 33) {
          LatLng coordinates =
              LatLng(countries[x].latlng[0], countries[x].latlng[1]);
          print(coordinates);
          print(countries[x].latlng[0]);
          _markers.add(Marker(
              markerId: MarkerId(coordinates.toString()),
              position: coordinates,
              infoWindow: InfoWindow(
                  onTap: () {
                    Navigator.push(
                        _myContext,
                        MaterialPageRoute(
                            builder: (context) => CountryDetailsScreen(
                                  countryCode: countries[x].alpha2Code,
                                  country: countries[x].name,
                                )));
                  },
                  title: countries[x].name,
                  snippet: 'Tap to see the countries news'),
              icon: BitmapDescriptor.defaultMarker));
        }
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _controller.complete(controller);
      });
    }
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(
        icon,
        size: 36,
      ),
    );
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          onCameraMove: _onCameraMove,
          initialCameraPosition: CameraPosition(target: _center, zoom: 5),
          mapType: _currentMapType,
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, right: 16),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                button(_onMapTypeButtonPressed, Icons.map),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
