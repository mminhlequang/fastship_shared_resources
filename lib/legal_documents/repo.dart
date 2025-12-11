import 'dart:io';
import 'dart:typed_data';

import 'package:internal_core/network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';
import '../models/models.dart';

class LegalDocumentsRepo {
  static final LegalDocumentsRepo _instance = LegalDocumentsRepo._internal();
  factory LegalDocumentsRepo() => _instance;
  LegalDocumentsRepo._internal();

  final LegalDocumentsApi _api = LegalDocumentsApiImpl();

  // Get legal documents with filtering and pagination
  Future<NetworkResponse<ListResponse<LegalDocumentResponse>>>
  getLegalDocuments({
    String? refType,
    String? refId,
    String? documentType,
    String? status,
    int offset = 0,
    int limit = 100,
  }) => _api.getLegalDocuments(
    refType: refType,
    refId: refId,
    documentType: documentType,
    status: status,
    offset: offset,
    limit: limit,
  );

  // Create and upload legal document
  Future<NetworkResponse<LegalDocumentResponse>> createLegalDocument({
    required String refType,
    required String refId,
    required String documentType,
    required String title,
    String? description,
    String? status,
    required Uint8List fileBytes,
    required String fileName,
  }) async {
    try {
      final result = await _api.createLegalDocument(
        refType: refType,
        refId: refId,
        documentType: documentType,
        title: title,
        description: description,
        status: status,
        fileBytes: fileBytes,
        fileName: fileName,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  // Update legal document
  Future<NetworkResponse<LegalDocumentResponse>> updateLegalDocument({
    required String documentId,
    String? title,
    String? description,
    String? documentType,
    String? status,
  }) => _api.updateLegalDocument(
    documentId: documentId,
    title: title,
    description: description,
    documentType: documentType,
    status: status,
  );

  // Delete legal document
  Future<NetworkResponse<void>> deleteLegalDocument({
    required String documentId,
  }) => _api.deleteLegalDocument(documentId: documentId);

  // Convenience methods for common operations
  Future<NetworkResponse<ListResponse<LegalDocumentResponse>>>
  getDocumentsByOwner({
    required String refType,
    required String refId,
    int offset = 0,
    int limit = 100,
  }) => getLegalDocuments(
    refType: refType,
    refId: refId,
    offset: offset,
    limit: limit,
  );

  Future<NetworkResponse<ListResponse<LegalDocumentResponse>>>
  getDocumentsByType({
    required String documentType,
    int offset = 0,
    int limit = 100,
  }) => getLegalDocuments(
    documentType: documentType,
    offset: offset,
    limit: limit,
  );

  Future<NetworkResponse<ListResponse<LegalDocumentResponse>>>
  getDocumentsByStatus({
    required String status,
    int offset = 0,
    int limit = 100,
  }) => getLegalDocuments(status: status, offset: offset, limit: limit);
}
