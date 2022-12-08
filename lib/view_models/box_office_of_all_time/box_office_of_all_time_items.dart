
class BoxOfficeOfAllTimeItems {
  String? id;
  String? rank;
  String? title;
  String? worldwideLifetimeGross;
  String? domesticLifetimeGross;
  String? domestic;
  String? foreignLifetimeGross;
  String? foreign;
  String? year;

  BoxOfficeOfAllTimeItems(
      {this.id,
      this.rank,
      this.title,
      this.worldwideLifetimeGross,
      this.domesticLifetimeGross,
      this.domestic,
      this.foreignLifetimeGross,
      this.foreign,
      this.year});

  BoxOfficeOfAllTimeItems.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    rank = json['rank'] ?? "";
    title = json['title'] ?? "";
    worldwideLifetimeGross = json['worldwideLifetimeGross'] ?? "";
    domesticLifetimeGross = json['domesticLifetimeGross'] ?? "";
    domestic = json['domestic'] ?? "";
    foreignLifetimeGross = json['foreignLifetimeGross'] ?? "";
    foreign = json['foreign'] ?? "";
    year = json['year'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['title'] = title;
    data['worldwideLifetimeGross'] = worldwideLifetimeGross;
    data['domesticLifetimeGross'] = domesticLifetimeGross;
    data['domestic'] = domestic;
    data['foreignLifetimeGross'] = foreignLifetimeGross;
    data['foreign'] = foreign;
    data['year'] = year;
    return data;
  }
}
