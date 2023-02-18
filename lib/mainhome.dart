import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kasarijaane/components/constants.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key});

  @override
  Widget build(BuildContext context) {
    final center = LatLng(27.717245, 85.323959);
    List<LatLng> _latLngList = [
      LatLng(27.72, 85.33),
      LatLng(27.617245, 85.323459),
      LatLng(27.687945, 85.353459),
    ];

    List<Marker> _markers = _latLngList
        .map((point) => Marker(
              point: point,
              width: 60,
              height: 60,
              builder: (context) => Icon(
                Icons.pin_drop,
                size: 60,
                color: Colors.blueAccent,
              ),
            ))
        .toList();
    return SafeArea(
      child: FlutterMap(
        options: MapOptions(
          center: center,
          zoom: 12,
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
          MarkerClusterLayerWidget(options: MarkerClusterLayerOptions(
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
