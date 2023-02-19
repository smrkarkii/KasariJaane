import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kasarijaane/components/constants.dart';
import 'package:latlong2/latlong.dart';
import '../components/footer.dart';
import '../components/searchbar.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final center = LatLng(27.74238819677683, 85.33275784413591);
    List<LatLng> latLngList = [
      LatLng(27.72, 85.33),
      LatLng(27.617245, 85.323459),
      LatLng(27.687945, 85.353459),
      LatLng(27.74238819677683, 85.33275784413591)
    ];

    List<Marker> _markers = latLngList
        .map((point) => Marker(
              point: point,
              width: 60,
              height: 60,
              builder: (context) => Icon(
                Icons.pin_drop,
                size: 40,
                color: Colors.blueAccent,
              ),
            ))
        .toList();

    return Scaffold(
      backgroundColor: kgrey,
      body: Column(
        children: [
          Flexible(
            child: Mapintro(center: center,markers: _markers,),
          ),
          SearchBar(label: 'Search for pickup',),
          SearchBar(label: 'Search for destination',),
        ],
      ),
      
    );
  }
}

class Mapintro extends StatelessWidget {
  const Mapintro({
    Key? key,
    required this.center,
    required List<Marker> markers,
  })  : _markers = markers,
        super(key: key);

  final LatLng center;
  final List<Marker> _markers;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlutterMap(
        options: MapOptions(
          center: center,
          zoom: 15,
        ),
        nonRotatedChildren: [
          AttributionWidget(
            attributionBuilder: (attr) => Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'attr',
                style: TextStyle(fontSize: 10.0),
              ),
            ),
          ),
        ],
        children: [
          TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              maxClusterRadius: 120,
              size: Size(40, 40),
              fitBoundsOptions: FitBoundsOptions(
                padding: EdgeInsets.all(50),
              ),
              markers: _markers,
              polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3,
              ),
              builder: (context, markers) {
                return FloatingActionButton(
                  child: Text(markers.length.toString()),
                  onPressed: null,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
