class SongModel {
  final String id;
  final String name;
  final Duration duration;
  final String audioStreamURL; /* ****** */
  final String imageURL;
  final int views;

  SongModel(
      {required this.id,
      required this.name,
      required this.duration,
      required this.audioStreamURL,
      required this.imageURL,
      required this.views});

  factory SongModel.fromJSON(Map<String, dynamic> json) {
    List<String> timeParts = json["duration"].split(':');
    Duration duration = Duration(
        minutes: int.parse(timeParts[0]), seconds: int.parse(timeParts[1]));

    return SongModel(
        id: json["id"],
        name: json["name"],
        duration: duration,
        audioStreamURL: json["audioStreamURL"],
        imageURL: json["imageURL"],
        views: json["views"] ?? 0);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "duration": duration,
        "audioStreamURL": audioStreamURL,
        "imageURL": imageURL,
        "views": views,
      };
}
