class ListResponse<T> {
  List<T>? data;
  int? count;

  ListResponse({this.data, this.count});

  ListResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    data = <T>[];
    json["data"].forEach((v) {
      data!.add(fromJsonT(v));
    });

    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data!.map((v) => (v as dynamic).toJson()).toList();
    }
    data["count"] = count;
    return data;
  }
}
