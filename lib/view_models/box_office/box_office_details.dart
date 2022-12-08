import 'package:imdb/view_models/box_office/box_office_items.dart';

class BoxOfficeDetails {
  List<BoxOfficeItems>? items;
  String? errorMessage;

  BoxOfficeDetails({this.items, this.errorMessage});

  BoxOfficeDetails.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <BoxOfficeItems>[];
      json['items'].forEach((v) {
        items!.add(BoxOfficeItems.fromJson(v));
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
