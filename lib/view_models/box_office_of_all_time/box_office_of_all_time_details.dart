import 'package:imdb/view_models/box_office_of_all_time/box_office_of_all_time_items.dart';

class BoxOfficeOfAllTimeDetails {
  List<BoxOfficeOfAllTimeItems>? items;
  String? errorMessage;

  BoxOfficeOfAllTimeDetails({this.items, this.errorMessage});

  BoxOfficeOfAllTimeDetails.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <BoxOfficeOfAllTimeItems>[];
      json['items'].forEach((v) {
        items!.add(BoxOfficeOfAllTimeItems.fromJson(v));
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
