import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'components/modal_fit.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> googleMapMarker = HashSet<Marker>();

  late GoogleMapController mapController;
  Set<Circle> warningcircle = HashSet<Circle>();

  void addRadius() {
    warningcircle.add(
      const Circle(
          circleId: CircleId("0"),
          center: LatLng(49.933611, -119.401389),
          radius: 1000,
          strokeWidth: 2,
          fillColor: Color.fromRGBO(102, 51, 153, .5)),
    );
  }

  void _getCurrentLocation() async {
    Position myposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(myposition);
  }

  void addMap() async {
    String style = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    mapController.setMapStyle(style);
  }

  @override
  void initState() {
    super.initState();
    googleMapMarker.add(
      Marker(
          markerId: const MarkerId("id"),
          icon: BitmapDescriptor.defaultMarker,
          position: const LatLng(49.934793318231065, -119.40051134095724),
          onTap: () {
            //this is what you're looking for!
            showFloatingModalBottomSheet(
              context: context,
              builder: (context) => ModalFit(),
            );
          }),
    );

    _getCurrentLocation();
  }

  void mapCreated(GoogleMapController controller) {
    mapController = controller;

    addMap();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
      target: LatLng(49.933611, -119.401389),
      zoom: 18,
      tilt: 15,
    );
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: GoogleMap(
            onMapCreated: mapCreated,
            initialCameraPosition: initialCameraPosition,
            markers: googleMapMarker,
            circles: warningcircle,
            tiltGesturesEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
        ),
        Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: IconButton(
                color: Colors.white,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )),
      ],
    ));
  }
}

class ModalSheetWithPadding extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const ModalSheetWithPadding(
      {Key? key, required this.child, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }
}

Future<T> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
}) async {
  final result = await showCustomModalBottomSheet(
      context: context,
      builder: builder,
      containerWidget: (_, animation, child) => ModalSheetWithPadding(
            child: child,
          ),
      expand: false);

  return result;
}
