// ignore_for_file: prefer_collection_literals

class DogModel {
  String? bredFor;
  String? breedGroup;
  Height? height;
  int? id;
  Image? image;
  String? lifeSpan;
  String? name;
  String? origin;
  String? referenceImageId;
  String? temperament;
  Height? weight;

  DogModel(
      {this.bredFor,
      this.breedGroup,
      this.height,
      this.id,
      this.image,
      this.lifeSpan,
      this.name,
      this.origin,
      this.referenceImageId,
      this.temperament,
      this.weight});

  DogModel.fromJson(Map<String, dynamic> json) {
    bredFor = json['bred_for'];
    breedGroup = json['breed_group'];
    height =
        json['height'] != null ? Height.fromJson(json['height']) : null;
    id = json['id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    lifeSpan = json['life_span'];
    name = json['name'];
    origin = json['origin'];
    referenceImageId = json['reference_image_id'];
    temperament = json['temperament'];
    weight =
        json['weight'] != null ? Height.fromJson(json['weight']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['bred_for'] = bredFor;
    data['breed_group'] = breedGroup;
    if (height != null) {
      data['height'] = height!.toJson();
    }
    data['id'] = id;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['life_span'] = lifeSpan;
    data['name'] = name;
    data['origin'] = origin;
    data['reference_image_id'] = referenceImageId;
    data['temperament'] = temperament;
    if (weight != null) {
      data['weight'] = weight!.toJson();
    }
    return data;
  }
}

class Height {
  String? imperial;
  String? metric;

  Height({this.imperial, this.metric});

  Height.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['imperial'] = imperial;
    data['metric'] = metric;
    return data;
  }
}

class Image {
  int? height;
  String? id;
  String? url;
  int? width;

  Image({this.height, this.id, this.url, this.width});

  Image.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['height'] = height;
    data['id'] = id;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}
