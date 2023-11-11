class Album {
  final String id;
  final String name;
  final String imageURL;
  final Duration duration;
  final int totalSongs;

  Album(
      {required this.id,
      required this.name,
      required this.imageURL,
      required this.duration,
      required this.totalSongs});
}
