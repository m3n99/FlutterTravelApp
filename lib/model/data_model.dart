class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;

  DataModel(
      {required this.description,
      required this.img,
      required this.location,
      required this.name,
      required this.people,
      required this.price,
      required this.stars});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json["name"],
        img: json["img"],
        price: json["price"],
        people: json["people"],
        stars: json["stars"],
        description: json["description"],
        location: json["location"],
        );
  }
}
