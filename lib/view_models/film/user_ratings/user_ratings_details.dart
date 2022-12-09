class UserRatingsDetails {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  String? totalRating;
  String? totalRatingVotes;
  List<Ratings>? ratings;
  DemographicAll? demographicAll;
  DemographicAll? demographicMales;
  DemographicAll? demographicFemales;
  AllAges? top1000Voters;
  AllAges? usUsers;
  AllAges? nonUSUsers;
  String? errorMessage;

  UserRatingsDetails(
      {this.imDbId,
      this.title,
      this.fullTitle,
      this.type,
      this.year,
      this.totalRating,
      this.totalRatingVotes,
      this.ratings,
      this.demographicAll,
      this.demographicMales,
      this.demographicFemales,
      this.top1000Voters,
      this.usUsers,
      this.nonUSUsers,
      this.errorMessage});

  UserRatingsDetails.fromJson(Map<String, dynamic> json) {
    imDbId = json['imDbId'];
    title = json['title'];
    fullTitle = json['fullTitle'];
    type = json['type'];
    year = json['year'];
    totalRating = json['totalRating'];
    totalRatingVotes = json['totalRatingVotes'];
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(Ratings.fromJson(v));
      });
    }
    demographicAll = json['demographicAll'] != null
        ? DemographicAll.fromJson(json['demographicAll'])
        : null;
    demographicMales = json['demographicMales'] != null
        ? DemographicAll.fromJson(json['demographicMales'])
        : null;
    demographicFemales = json['demographicFemales'] != null
        ? DemographicAll.fromJson(json['demographicFemales'])
        : null;
    top1000Voters = json['top1000Voters'] != null
        ? AllAges.fromJson(json['top1000Voters'])
        : null;
    usUsers =
        json['usUsers'] != null ? AllAges.fromJson(json['usUsers']) : null;
    nonUSUsers = json['nonUSUsers'] != null
        ? AllAges.fromJson(json['nonUSUsers'])
        : null;
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imDbId'] = imDbId;
    data['title'] = title;
    data['fullTitle'] = fullTitle;
    data['type'] = type;
    data['year'] = year;
    data['totalRating'] = totalRating;
    data['totalRatingVotes'] = totalRatingVotes;
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    if (demographicAll != null) {
      data['demographicAll'] = demographicAll!.toJson();
    }
    if (demographicMales != null) {
      data['demographicMales'] = demographicMales!.toJson();
    }
    if (demographicFemales != null) {
      data['demographicFemales'] = demographicFemales!.toJson();
    }
    if (top1000Voters != null) {
      data['top1000Voters'] = top1000Voters!.toJson();
    }
    if (usUsers != null) {
      data['usUsers'] = usUsers!.toJson();
    }
    if (nonUSUsers != null) {
      data['nonUSUsers'] = nonUSUsers!.toJson();
    }
    data['errorMessage'] = errorMessage;
    return data;
  }
}

class Ratings {
  String? rating;
  String? percent;
  String? votes;

  Ratings({this.rating, this.percent, this.votes});

  Ratings.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    percent = json['percent'];
    votes = json['votes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['percent'] = percent;
    data['votes'] = votes;
    return data;
  }
}

class DemographicAll {
  AllAges? allAges;
  AllAges? agesUnder18;
  AllAges? ages18To29;
  AllAges? ages30To44;
  AllAges? agesOver45;

  DemographicAll(
      {this.allAges,
      this.agesUnder18,
      this.ages18To29,
      this.ages30To44,
      this.agesOver45});

  DemographicAll.fromJson(Map<String, dynamic> json) {
    allAges =
        json['allAges'] != null ? AllAges.fromJson(json['allAges']) : null;
    agesUnder18 = json['agesUnder18'] != null
        ? AllAges.fromJson(json['agesUnder18'])
        : null;
    ages18To29 = json['ages18To29'] != null
        ? AllAges.fromJson(json['ages18To29'])
        : null;
    ages30To44 = json['ages30To44'] != null
        ? AllAges.fromJson(json['ages30To44'])
        : null;
    agesOver45 = json['agesOver45'] != null
        ? AllAges.fromJson(json['agesOver45'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allAges != null) {
      data['allAges'] = allAges!.toJson();
    }
    if (agesUnder18 != null) {
      data['agesUnder18'] = agesUnder18!.toJson();
    }
    if (ages18To29 != null) {
      data['ages18To29'] = ages18To29!.toJson();
    }
    if (ages30To44 != null) {
      data['ages30To44'] = ages30To44!.toJson();
    }
    if (agesOver45 != null) {
      data['agesOver45'] = agesOver45!.toJson();
    }
    return data;
  }
}

class AllAges {
  String? rating;
  String? votes;

  AllAges({this.rating, this.votes});

  AllAges.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    votes = json['votes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['votes'] = votes;
    return data;
  }
}
