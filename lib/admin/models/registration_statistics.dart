
class RegistrationStatistics {
  StatusCounts? statusCounts;
  TypeCounts? typeCounts;
  int? recentRequests;
  int? previousPeriodRequests;
  int? growthPercentage;
  String? growthTrend;
  int? totalRequests;

  RegistrationStatistics({this.statusCounts, this.typeCounts, this.recentRequests, this.previousPeriodRequests, this.growthPercentage, this.growthTrend, this.totalRequests});

  RegistrationStatistics.fromJson(Map<String, dynamic> json) {
    if(json["status_counts"] is Map) {
      statusCounts = json["status_counts"] == null ? null : StatusCounts.fromJson(json["status_counts"]);
    }
    if(json["type_counts"] is Map) {
      typeCounts = json["type_counts"] == null ? null : TypeCounts.fromJson(json["type_counts"]);
    }
    if(json["recent_requests"] is int) {
      recentRequests = json["recent_requests"];
    }
    if(json["previous_period_requests"] is int) {
      previousPeriodRequests = json["previous_period_requests"];
    }
    if(json["growth_percentage"] is int) {
      growthPercentage = json["growth_percentage"];
    }
    if(json["growth_trend"] is String) {
      growthTrend = json["growth_trend"];
    }
    if(json["total_requests"] is int) {
      totalRequests = json["total_requests"];
    }
  }

  static List<RegistrationStatistics> fromList(List<Map<String, dynamic>> list) {
    return list.map(RegistrationStatistics.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(statusCounts != null) {
      _data["status_counts"] = statusCounts?.toJson();
    }
    if(typeCounts != null) {
      _data["type_counts"] = typeCounts?.toJson();
    }
    _data["recent_requests"] = recentRequests;
    _data["previous_period_requests"] = previousPeriodRequests;
    _data["growth_percentage"] = growthPercentage;
    _data["growth_trend"] = growthTrend;
    _data["total_requests"] = totalRequests;
    return _data;
  }
}

class TypeCounts {
  int? driver;
  int? restaurant;

  TypeCounts({this.driver, this.restaurant});

  TypeCounts.fromJson(Map<String, dynamic> json) {
    if(json["driver"] is int) {
      driver = json["driver"];
    }
    if(json["restaurant"] is int) {
      restaurant = json["restaurant"];
    }
  }

  static List<TypeCounts> fromList(List<Map<String, dynamic>> list) {
    return list.map(TypeCounts.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["driver"] = driver;
    _data["restaurant"] = restaurant;
    return _data;
  }
}

class StatusCounts {
  int? pending;
  int? approved;
  int? rejected;

  StatusCounts({this.pending, this.approved, this.rejected});

  StatusCounts.fromJson(Map<String, dynamic> json) {
    if(json["pending"] is int) {
      pending = json["pending"];
    }
    if(json["approved"] is int) {
      approved = json["approved"];
    }
    if(json["rejected"] is int) {
      rejected = json["rejected"];
    }
  }

  static List<StatusCounts> fromList(List<Map<String, dynamic>> list) {
    return list.map(StatusCounts.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["pending"] = pending;
    _data["approved"] = approved;
    _data["rejected"] = rejected;
    return _data;
  }
}