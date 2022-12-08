
import 'package:imdb/view_models/film/film_items.dart';

class FilmDetails {
  List<FilmItems>? items;
  String? errorMessage;

  FilmDetails({this.items, this.errorMessage = ""});

  FilmDetails.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <FilmItems>[];
      json['items'].forEach((v) {
        items!.add(FilmItems.fromJson(v));
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
