class Song {
  final String id;
  final String name;
  final Duration duration;
  final String audioStreamURL; /* ****** */
  final String imageURL;
  final int views;

  Song(
      {required this.id,
      required this.name,
      required this.duration,
      required this.audioStreamURL,
      required this.imageURL,
      required this.views});
}
