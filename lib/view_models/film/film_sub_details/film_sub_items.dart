class FilmSubItems {
  String id;
  String rank;
  String title;
  String fullTitle;
  String rankUpDown;
  String year;
  String image;
  String crew;
  String imDbRating;
  String imDbRatingCount;

  FilmSubItems(
      {required this.id,
      required this.rank,
      required this.title,
      required this.fullTitle,
      required this.rankUpDown,
      required this.year,
      required this.image,
      required this.crew,
      required this.imDbRating,
      required this.imDbRatingCount});

  static FilmSubItems fromJson(Map<String, dynamic> json) {
    return FilmSubItems(
      id: json['id'] ?? "",
      rank: json['rank'] ?? "",
      title: json['title'] ?? "",
      fullTitle: json['fullTitle'] ?? "",
      rankUpDown: json['rankUpDown'] ?? "",
      year: json['year'] ?? "",
      image: json['image'] ?? "",
      crew: json['crew'] ?? "",
      imDbRating: json['imDbRating'] ?? "",
      imDbRatingCount: json['imDbRatingCount'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['title'] = title;
    data['fullTitle'] = fullTitle;
    data['rankUpDown'] = rankUpDown;
    data['year'] = year;
    data['image'] = image;
    data['crew'] = crew;
    data['imDbRating'] = imDbRating;
    data['imDbRatingCount'] = imDbRatingCount;
    return data;
  }
}
