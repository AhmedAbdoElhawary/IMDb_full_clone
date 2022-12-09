class PersonalAwardDetails {
  String? imDbId;
  String? name;
  String? description;
  List<PersonalAwardItems>? items;
  String? nameAwardsHtml;
  String? errorMessage;

  PersonalAwardDetails(
      {this.imDbId,
      this.name,
      this.description,
      this.items,
      this.nameAwardsHtml,
      this.errorMessage});

  PersonalAwardDetails.fromJson(Map<String, dynamic> json) {
    imDbId = json['imDbId'] ?? "";
    name = json['name'] ?? "";
    description = json['description'] ?? "";
    if (json['items'] != null) {
      items = <PersonalAwardItems>[];
      json['items'].forEach((v) {
        items!.add(PersonalAwardItems.fromJson(v));
      });
    }
    nameAwardsHtml = json['nameAwardsHtml'] ?? "";
    errorMessage = json['errorMessage'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imDbId'] = imDbId;
    data['name'] = name;
    data['description'] = description;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['nameAwardsHtml'] = nameAwardsHtml;
    data['errorMessage'] = errorMessage;
    return data;
  }
}

class PersonalAwardItems {
  String? eventTitle;
  List<OutcomeItems>? outcomeItems;

  PersonalAwardItems({this.eventTitle, this.outcomeItems});

  PersonalAwardItems.fromJson(Map<String, dynamic> json) {
    eventTitle = json['eventTitle'] ?? "";
    if (json['outcomeItems'] != null) {
      outcomeItems = <OutcomeItems>[];
      json['outcomeItems'].forEach((v) {
        outcomeItems!.add(OutcomeItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventTitle'] = eventTitle;
    if (outcomeItems != null) {
      data['outcomeItems'] = outcomeItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OutcomeItems {
  String? outcomeYear;
  String? outcomeTitle;
  String? outcomeCategory;
  List<OutcomeDetails>? outcomeDetails;

  OutcomeItems(
      {this.outcomeYear,
      this.outcomeTitle,
      this.outcomeCategory,
      this.outcomeDetails});

  OutcomeItems.fromJson(Map<String, dynamic> json) {
    outcomeYear = json['outcomeYear'] ?? "";
    outcomeTitle = json['outcomeTitle'] ?? "";
    outcomeCategory = json['outcomeCategory'] ?? "";
    if (json['outcomeDetails'] != null) {
      outcomeDetails = <OutcomeDetails>[];
      json['outcomeDetails'].forEach((v) {
        outcomeDetails!.add(OutcomeDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['outcomeYear'] = outcomeYear;
    data['outcomeTitle'] = outcomeTitle;
    data['outcomeCategory'] = outcomeCategory;
    if (outcomeDetails != null) {
      data['outcomeDetails'] = outcomeDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OutcomeDetails {
  String? plainText;
  String? html;

  OutcomeDetails({this.plainText, this.html});

  OutcomeDetails.fromJson(Map<String, dynamic> json) {
    plainText = json['plainText'] ?? "";
    html = json['html'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plainText'] = plainText;
    data['html'] = html;
    return data;
  }
}
