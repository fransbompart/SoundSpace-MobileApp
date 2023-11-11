class ArtistModel {
  final String id;
  final String name;
  final String imageURL;

  ArtistModel({required this.id, required this.name, required this.imageURL});

  factory ArtistModel.fromJSON(Map<String, dynamic> json) => ArtistModel(
        id: json["id"],
        name: json["name"],
        imageURL: json["imageURL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageURL": imageURL,
      };
}
