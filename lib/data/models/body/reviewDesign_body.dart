class ReviewDesignBody {
  String? designId;
  String? rate;

  ReviewDesignBody({this.designId, this.rate});

  ReviewDesignBody.fromJson(Map<String, dynamic> json) {
    designId = json['design_id'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['design_id'] = this.designId;
    data['rate'] = this.rate;
    return data;
  }
}
