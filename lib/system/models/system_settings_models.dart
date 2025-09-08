class SystemSettingResponse {
  String? namespace;
  String? key;
  String? value;
  String? valueType;
  String? description;
  String? unit;
  bool? allowPublic;
  int? id;

  SystemSettingResponse({
    this.namespace,
    this.key,
    this.value,
    this.valueType,
    this.description,
    this.unit,
    this.allowPublic,
    this.id,
  });

  SystemSettingResponse.fromJson(Map<String, dynamic> json) {
    if (json["namespace"] is String) {
      namespace = json["namespace"];
    }
    if (json["key"] is String) {
      key = json["key"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
    if (json["value_type"] is String) {
      valueType = json["value_type"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["unit"] is String) {
      unit = json["unit"];
    }
    if (json["allow_public"] is bool) {
      allowPublic = json["allow_public"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
  }

  static List<SystemSettingResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(SystemSettingResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["namespace"] = namespace;
    _data["key"] = key;
    _data["value"] = value;
    _data["value_type"] = valueType;
    _data["description"] = description;
    _data["unit"] = unit;
    _data["allow_public"] = allowPublic;
    _data["id"] = id;
    return _data;
  }
}

class SystemSettingCreate {
  String? namespace;
  String? key;
  String? value;
  String? valueType;
  String? description;
  String? unit;
  bool? allowPublic;

  SystemSettingCreate({
    this.namespace,
    this.key,
    this.value,
    this.valueType,
    this.description,
    this.unit,
    this.allowPublic,
  });

  SystemSettingCreate.fromJson(Map<String, dynamic> json) {
    if (json["namespace"] is String) {
      namespace = json["namespace"];
    }
    if (json["key"] is String) {
      key = json["key"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
    if (json["value_type"] is String) {
      valueType = json["value_type"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["unit"] is String) {
      unit = json["unit"];
    }
    if (json["allow_public"] is bool) {
      allowPublic = json["allow_public"];
    }
  }

  static List<SystemSettingCreate> fromList(List<Map<String, dynamic>> list) {
    return list.map(SystemSettingCreate.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["namespace"] = namespace;
    _data["key"] = key;
    _data["value"] = value;
    _data["value_type"] = valueType;
    _data["description"] = description;
    _data["unit"] = unit;
    _data["allow_public"] = allowPublic;
    return _data;
  }
}

class SystemSettingUpdate {
  String? namespace;
  String? value;
  String? valueType;
  String? description;
  String? unit;
  bool? allowPublic;

  SystemSettingUpdate({
    this.namespace,
    this.value,
    this.valueType,
    this.description,
    this.unit,
    this.allowPublic,
  });

  SystemSettingUpdate.fromJson(Map<String, dynamic> json) {
    if (json["namespace"] is String) {
      namespace = json["namespace"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
    if (json["value_type"] is String) {
      valueType = json["value_type"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["unit"] is String) {
      unit = json["unit"];
    }
    if (json["allow_public"] is bool) {
      allowPublic = json["allow_public"];
    }
  }

  static List<SystemSettingUpdate> fromList(List<Map<String, dynamic>> list) {
    return list.map(SystemSettingUpdate.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["namespace"] = namespace;
    _data["value"] = value;
    _data["value_type"] = valueType;
    _data["description"] = description;
    _data["unit"] = unit;
    _data["allow_public"] = allowPublic;
    return _data;
  }
}
