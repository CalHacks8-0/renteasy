class Rental {
  Rental(
      {required this.id,
      required this.amount,
      required this.address,
      required this.bedrooms,
      required this.bathrooms,
      required this.owner,
      required this.rating,
      required this.longitude,
      required this.latitude,
      required this.review1,
      required this.review2});

  int amount;
  int bedrooms;
  int bathrooms;
  int rating;
  String owner;
  String longitude;
  String latitude;
  String review1;
  String review2;
  String address;
  int id;
}
