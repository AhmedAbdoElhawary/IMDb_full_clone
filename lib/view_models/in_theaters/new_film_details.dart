import 'package:imdb/view_models/in_theaters/new_fim_items.dart';

class NewFilmDetails {
  List<NewFilmItems>? items;
  String? errorMessage;

  NewFilmDetails({this.items, this.errorMessage});

  NewFilmDetails.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <NewFilmItems>[];
      json['items'].forEach((v) {
        items!.add(NewFilmItems.fromJson(v));
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
