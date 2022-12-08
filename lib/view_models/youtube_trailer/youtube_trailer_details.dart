class YoutubeTrailerDetails {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  String? videoId;
  String? videoUrl;
  String? errorMessage;

  YoutubeTrailerDetails(
      {this.imDbId,
      this.title,
      this.fullTitle,
      this.type,
      this.year,
      this.videoId,
      this.videoUrl,
      this.errorMessage});

  YoutubeTrailerDetails.fromJson(Map<String, dynamic> json) {
    imDbId = json['imDbId'] ?? "";
    title = json['title'] ?? "";
    fullTitle = json['fullTitle'] ?? "";
    type = json['type'] ?? "";
    year = json['year'] ?? "";
    videoId = json['videoId'] ?? "";
    videoUrl = json['videoUrl'] ?? "";
    errorMessage = json['errorMessage'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imDbId'] = imDbId;
    data['title'] = title;
    data['fullTitle'] = fullTitle;
    data['type'] = type;
    data['year'] = year;
    data['videoId'] = videoId;
    data['videoUrl'] = videoUrl;
    data['errorMessage'] = errorMessage;
    return data;
  }
}
