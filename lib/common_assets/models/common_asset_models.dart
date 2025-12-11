
/// Response model for common assets (chuẩn hóa theo JSON mới nhất)
class CommonAssetResponse {
  final String id;
  final String? refType;
  final String? refId;
  final String? fileType;
  final String? fileUrl;
  final String? fileCompressedUrl;
  final String? originalFilename;
  final int? fileSize;
  final String? mimeType;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  String? get displayUrl => fileCompressedUrl ?? fileUrl;

  CommonAssetResponse({
    required this.id,
    this.refType,
    this.refId,
    this.fileType,
    this.fileUrl,
    this.fileCompressedUrl,
    this.originalFilename,
    this.fileSize,
    this.mimeType,
    this.createdAt,
    this.updatedAt,
  });

  /// Parse từ JSON trả về từ API
  factory CommonAssetResponse.fromJson(Map<String, dynamic> json) {
    return CommonAssetResponse(
      id: json['id'] as String,
      refType: json['ref_type'] as String?,
      refId: json['ref_id'] as String?,
      fileType: json['file_type'] as String?,
      fileUrl: json['file_url'] as String?,
      fileCompressedUrl: json['file_compressed_url'] as String?,
      originalFilename: json['original_filename'] as String?,
      fileSize: json['file_size'] is int
          ? json['file_size'] as int
          : int.tryParse(json['file_size']?.toString() ?? ''),
      mimeType: json['mime_type'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  /// Chuyển về JSON (dùng cho gửi lên API hoặc lưu local)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (refType != null) 'ref_type': refType,
      if (refId != null) 'ref_id': refId,
      if (fileType != null) 'file_type': fileType,
      if (fileUrl != null) 'file_url': fileUrl,
      if (fileCompressedUrl != null) 'file_compressed_url': fileCompressedUrl,
      if (originalFilename != null) 'original_filename': originalFilename,
      if (fileSize != null) 'file_size': fileSize,
      if (mimeType != null) 'mime_type': mimeType,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }
}