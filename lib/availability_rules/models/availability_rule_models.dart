/// Model cho input tạo/cập nhật Availability Rule.
/// Chuẩn theo JSON:
/// {
///   "type": "string",
///   "ref_id": "string",
///   "day_of_week": "string",
///   "start_time": "string",
///   "end_time": "string",
///   "is_active": true
/// }
class AvailabilityRuleInput {
  final String refType;
  final String refId;
  final String dayOfWeek;
  final String startTime;
  final String endTime;
  final bool isActive;

  AvailabilityRuleInput({
    required this.refType,
    required this.refId,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.isActive,
  });

  factory AvailabilityRuleInput.fromJson(Map<String, dynamic> json) {
    return AvailabilityRuleInput(
      refType: json['ref_type'] as String,
      refId: json['ref_id'] as String,
      dayOfWeek: json['day_of_week'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      isActive: json['is_active'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': refType,
        'ref_type': refId,
        'day_of_week': dayOfWeek,
        'start_time': startTime,
        'end_time': endTime,
        'is_active': isActive,
      };
}

class AvailabilityRuleResponse {
  final String id;
  final String? refType;
  final String? refId;
  final String? dayOfWeek;
  final String? startTime;
  final String? endTime;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AvailabilityRuleResponse({
    required this.id,
    this.refType,
    this.refId,
    this.dayOfWeek,
    this.startTime,
    this.endTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory AvailabilityRuleResponse.fromJson(Map<String, dynamic> json) =>
      AvailabilityRuleResponse(
        id: json['id'] as String,
        refType: json['ref_type'] as String?,
        refId: json['ref_id'] as String?,
        dayOfWeek: json['day_of_week'] as String?,
        startTime: json['start_time'] as String?,
        endTime: json['end_time'] as String?,
        isActive: json['is_active'] as bool?,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ref_type': refType,
        'ref_id': refId,
        'day_of_week': dayOfWeek,
        'start_time': startTime,
        'end_time': endTime,
        'is_active': isActive,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
