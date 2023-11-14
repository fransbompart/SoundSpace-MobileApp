class PlaylistModel {
  final String id;
  final String name;
  final String iconPath;
  final int views;

  PlaylistModel({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.views,
  });

  factory PlaylistModel.fromJSON(Map<String, dynamic> json) => PlaylistModel(
        id: json["id"],
        name: json["name"],
        iconPath: json["icon"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iconPath": iconPath,
        "views": views,
      };
}
