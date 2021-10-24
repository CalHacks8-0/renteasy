import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:renteasy/constants.dart';
import 'components/modal_fit.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> googleMapMarker = HashSet<Marker>();

  late GoogleMapController mapController;
  Set<Circle> warningcircle = HashSet<Circle>();

  List<DocumentSnapshot> rentalList = [];
  late StreamSubscription<QuerySnapshot> rentalListSubscription;
  final Stream<QuerySnapshot> _rentalsStream =
      FirebaseFirestore.instance.collection('rentalListings').snapshots();

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

  List<String> prices = [];
  List<GeoPoint> geoPoint = [];
  List<String> ids = [];

  @override
  void initState() {
    super.initState();
    addPoints();
    for (int i = 0; i < prices.length; i++) {
      setState(() {
        addMarker('\$${prices[i]}', geoPoint[i], ids[i]);
      });
    }
    addMarker(
        '\$850', const GeoPoint(49.934793318231065, -119.40051134095724), 'id');
    addMarker('\$1000', const GeoPoint(49.9382361, -119.4018663), 'id1');
    addMarker('\$900', const GeoPoint(49.93308, -119.40312), 'id2');
    addMarker('\$975', const GeoPoint(49.93459, -119.39974), 'id3');
    addMarker(
        '\$700', const GeoPoint(49.93100546797583, -119.39898569024542), 'id4');

    _getCurrentLocation();
  }

  void addPoints() async {
    FirebaseFirestore.instance
        .collection('rentalListings')
        .snapshots()
        .map((event) => {
              event.docs.forEach((DocumentSnapshot document) async {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                prices.add(data['amount']);
                geoPoint.add(data['location']);
                ids.add(document.id);
                // GeoPoint geoPoint = data['location'];
                // print('Maps ID: ${document.id}');
                // Rental rentalHouse = Rental(
                //     id: '',
                //     amount: data['amount'],
                //     address: data['address'],
                //     bedrooms: data['bedrooms'],
                //     bathrooms: data['bathrooms'],
                //     owner: data['owner'],
                //     rating: 0,
                //     reviews: [],
                //     geoPoint: geoPoint);
                // List<String> imagePictures = List.from(data['images']);
              })
            });
  }

  void mapCreated(GoogleMapController controller) {
    mapController = controller;

    addMap();
  }

  void addMarker(String price, GeoPoint point, String id) async {
    print("Map ID: $id");
    BitmapDescriptor bitmapDescriptor = await createCustomMarkerBitmap(price);
    googleMapMarker.add(
      Marker(
          markerId: MarkerId(id),
          icon: bitmapDescriptor,
          position: LatLng(point.latitude, point.longitude),
          onTap: () {
            showFloatingModalBottomSheet(
              context: context,
              builder: (context) => ModalFit(),
            );
          }),
    );
  }

  Future<BitmapDescriptor> createCustomMarkerBitmap(String title) async {
    TextSpan span = TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
      text: title,
    );

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.text = TextSpan(
      text: title.toString(),
      style: const TextStyle(
        fontSize: 50.0,
        backgroundColor: kPrimaryColor,
        color: Colors.black,
        letterSpacing: 1.0,
        fontFamily: 'Roboto Bold',
      ),
    );

    PictureRecorder recorder = PictureRecorder();
    Canvas c = Canvas(recorder);

    tp.layout();
    tp.paint(c, const Offset(20.0, 10.0));

    /* Do your painting of the custom icon here, including drawing text, shapes, etc. */

    Picture p = recorder.endRecording();
    ByteData? pngBytes =
        await (await p.toImage(tp.width.toInt() + 40, tp.height.toInt() + 20))
            .toByteData(format: ImageByteFormat.png);

    Uint8List data = Uint8List.view(pngBytes!.buffer);

    return BitmapDescriptor.fromBytes(data);
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
      target: LatLng(49.933611, -119.401389),
      zoom: 18,
      tilt: 15,
    );
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('rentalListings')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return Stack(
                children: [
                  Positioned.fill(
                    child: GoogleMap(
                      onMapCreated: mapCreated,
                      initialCameraPosition: initialCameraPosition,
                      markers: googleMapMarker,
                      circles: warningcircle,
                      myLocationEnabled: true,
                      buildingsEnabled: true,
                    ),
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
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
              );
            }));
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
