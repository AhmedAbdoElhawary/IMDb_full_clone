import 'package:imdb/view_models/film/film_sub_details/film_sub_items.dart';

class FilmSubDetails {
  List<FilmSubItems>? items;
  String? errorMessage;

  FilmSubDetails({this.items, this.errorMessage = ""});

  FilmSubDetails.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <FilmSubItems>[];
      json['items'].forEach((v) {
        items!.add(FilmSubItems.fromJson(v));
      });
    }
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['errorMessage'] = errorMessage;
    return data;
  }
}
