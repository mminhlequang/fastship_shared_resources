class HTTPValidationError {
  List<ValidationError>? detail;

  HTTPValidationError({this.detail});

  HTTPValidationError.fromJson(Map<String, dynamic> json) {
    if (json["detail"] != null) {
      detail = <ValidationError>[];
      json["detail"].forEach((v) {
        detail!.add(ValidationError.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (detail != null) {
      data["detail"] = detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ValidationError {
  List<dynamic>? loc;
  String? msg;
  String? type;

  ValidationError({this.loc, this.msg, this.type});

  ValidationError.fromJson(Map<String, dynamic> json) {
    loc = json["loc"];
    msg = json["msg"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["loc"] = loc;
    data["msg"] = msg;
    data["type"] = type;
    return data;
  }
}
