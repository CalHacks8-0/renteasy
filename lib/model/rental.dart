import 'package:cloud_firestore/cloud_firestore.dart';

class Rental {
  Rental(
      {required this.id,
      required this.amount,
      required this.address,
      required this.bedrooms,
      required this.bathrooms,
      required this.owner,
      required this.rating,
      required this.geoPoint,
      required this.reviews});

  int amount;
  int bedrooms;
  int bathrooms;
  double rating;
  String owner;
  GeoPoint geoPoint;
  List<Review> reviews;
  String address;
  int id;
}

class Review {
  String author;
  String description;
  double starRating;
  String title;

  Review(
      {required this.author,
      required this.description,
      required this.starRating,
      required this.title});
}
