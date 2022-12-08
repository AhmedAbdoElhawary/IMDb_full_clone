
class BoxOfficeItems {
  String? id;
  String? rank;
  String? title;
  String? image;
  String? weekend;
  String? gross;
  String? weeks;

  BoxOfficeItems(
      {this.id,
      this.rank,
      this.title,
      this.image,
      this.weekend,
      this.gross,
      this.weeks});

  BoxOfficeItems.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    rank = json['rank'] ?? "";
    title = json['title'] ?? "";
    image = json['image'] ?? "";
    weekend = json['weekend'] ?? "";
    gross = json['gross'] ?? "";
    weeks = json['weeks'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['title'] = title;
    data['image'] = image;
    data['weekend'] = weekend;
    data['gross'] = gross;
    data['weeks'] = weeks;
    return data;
  }
}
