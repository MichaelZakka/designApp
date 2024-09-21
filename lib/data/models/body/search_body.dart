class SearchBody {
  String? name;
  String? category;
  String? description;
  String? prepareDuration;

  SearchBody(
      {this.name, this.category, this.description, this.prepareDuration});

  SearchBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    description = json['description'];
    prepareDuration = json['prepare_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['category'] = this.category;
    data['description'] = this.description;
    data['prepare_duration'] = this.prepareDuration;
    return data;
  }
}
