class LegalDocumentResponse {
  final String id;
  final String? refType;
  final String? refId;
  final String? documentType;
  final String? title;
  final String? description;
  final String? fileUrl;
  final String? fileName;
  final String? fileSize;
  final String? mimeType;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? createdBy;
  final String? updatedBy;

  LegalDocumentResponse({
    required this.id,
    this.refType,
    this.refId,
    this.documentType,
    this.title,
    this.description,
    this.fileUrl,
    this.fileName,
    this.fileSize,
    this.mimeType,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory LegalDocumentResponse.fromJson(Map<String, dynamic> json) {
    return LegalDocumentResponse(
      id: json['id'] ?? '',
      refType: json['ref_type'],
      refId: json['ref_id'],
      documentType: json['document_type'],
      title: json['title'],
      description: json['description'],
      fileUrl: json['file_url'],
      fileName: json['file_name'],
      fileSize: json['file_size'],
      mimeType: json['mime_type'],
      status: json['status'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ref_type': refType,
      'ref_id': refId,
      'document_type': documentType,
      'title': title,
      'description': description,
      'file_url': fileUrl,
      'file_name': fileName,
      'file_size': fileSize,
      'mime_type': mimeType,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'created_by': createdBy,
      'updated_by': updatedBy,
    };
  }
}

class LegalDocumentUpdate {
  final String? title;
  final String? description;
  final String? documentType;
  final String? status;

  LegalDocumentUpdate({
    this.title,
    this.description,
    this.documentType,
    this.status,
  });

  factory LegalDocumentUpdate.fromJson(Map<String, dynamic> json) {
    return LegalDocumentUpdate(
      title: json['title'],
      description: json['description'],
      documentType: json['document_type'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'document_type': documentType,
      'status': status,
    };
  }
}

class LegalDocumentCreate {
  final String? refType;
  final String? refId;
  final String? documentType;
  final String? title;
  final String? description;
  final String? status;

  LegalDocumentCreate({
    this.refType,
    this.refId,
    this.documentType,
    this.title,
    this.description,
    this.status,
  });

  factory LegalDocumentCreate.fromJson(Map<String, dynamic> json) {
    return LegalDocumentCreate(
      refType: json['ref_type'],
      refId: json['ref_id'],
      documentType: json['document_type'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ref_type': refType,
      'ref_id': refId,
      'document_type': documentType,
      'title': title,
      'description': description,
      'status': status,
    };
  }
}
