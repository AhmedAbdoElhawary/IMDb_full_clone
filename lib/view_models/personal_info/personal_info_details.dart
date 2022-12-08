class PersonalInfoDetails {
  String? id;
  String? name;
  String? role;
  String? image;
  String? summary;
  String? birthDate;
  String? deathDate;
  String? awards;
  String? height;
  List<KnownFor>? knownFor;
  List<CastMovies>? castMovies;
  String? errorMessage;

  PersonalInfoDetails(
      {this.id,
      this.name,
      this.role,
      this.image,
      this.summary,
      this.birthDate,
      this.deathDate,
      this.awards,
      this.height,
      this.knownFor,
      this.castMovies,
      this.errorMessage});

  PersonalInfoDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    role = json['role'] ?? "";
    image = json['image'] ?? "";
    summary = json['summary'] ?? "";
    birthDate = json['birthDate'] ?? "";
    deathDate = json['deathDate'] ?? "";
    awards = json['awards'] ?? "";
    height = json['height'] ?? "";
    if (json['knownFor'] != null) {
      knownFor = <KnownFor>[];
      json['knownFor'].forEach((v) {
        knownFor!.add(KnownFor.fromJson(v));
      });
    }
    if (json['castMovies'] != null) {
      castMovies = <CastMovies>[];
      json['castMovies'].forEach((v) {
        castMovies!.add(CastMovies.fromJson(v));
      });
    }
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    data['image'] = image;
    data['summary'] = summary;
    data['birthDate'] = birthDate;
    data['deathDate'] = deathDate;
    data['awards'] = awards;
    data['height'] = height;
    if (knownFor != null) {
      data['knownFor'] = knownFor!.map((v) => v.toJson()).toList();
    }
    if (castMovies != null) {
      data['castMovies'] = castMovies!.map((v) => v.toJson()).toList();
    }
    data['errorMessage'] = errorMessage;
    return data;
  }
}

class KnownFor {
  String? id;
  String? title;
  String? fullTitle;
  String? year;
  String? role;
  String? image;

  KnownFor(
      {this.id, this.title, this.fullTitle, this.year, this.role, this.image});

  KnownFor.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    title = json['title'] ?? "";
    fullTitle = json['fullTitle'] ?? "";
    year = json['year'] ?? "";
    role = json['role'] ?? "";
    image = json['image'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['fullTitle'] = fullTitle;
    data['year'] = year;
    data['role'] = role;
    data['image'] = image;
    return data;
  }
}

class CastMovies {
  String? id;
  String? role;
  String? title;
  String? year;
  String? description;

  CastMovies({this.id, this.role, this.title, this.year, this.description});

  CastMovies.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    role = json['role'] ?? "";
    title = json['title'] ?? "";
    year = json['year'] ?? "";
    description = json['description'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    data['title'] = title;
    data['year'] = year;
    data['description'] = description;
    return data;
  }
}
