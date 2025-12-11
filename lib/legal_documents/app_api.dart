import 'package:internal_core/internal_core.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:internal_core/network/network.dart';

import 'package:internal_core/network/network_resources/resources.dart';
import 'package:dio/dio.dart';

import '../models/models.dart';
import 'models/models.dart';

class _LegalDocumentsEndpoint {
  _LegalDocumentsEndpoint._();

  static String getDocs() => "/api/v1/admin/legal_documents/get_docs";
  static String createUpload() => "/api/v1/admin/legal_documents/create_upload";
  static String documentDetail(String documentId) =>
      "/api/v1/admin/legal_documents/$documentId";
}

abstract class LegalDocumentsApi {
  // Get legal documents with filtering and pagination
  Future<NetworkResponse<ListResponse<LegalDocumentResponse>>>
  getLegalDocuments({
    String? refType,
    String? refId,
    String? documentType,
    String? status,
    int offset = 0,
    int limit = 100,
  });

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
  });

  // Update legal document
  Future<NetworkResponse<LegalDocumentResponse>> updateLegalDocument({
    required String documentId,
    String? title,
    String? description,
    String? documentType,
    String? status,
  });

  // Delete legal document
  Future<NetworkResponse<void>> deleteLegalDocument({
    required String documentId,
  });
}

class LegalDocumentsApiImpl extends LegalDocumentsApi {
  @override
  Future<NetworkResponse<ListResponse<LegalDocumentResponse>>>
  getLegalDocuments({
    String? refType,
    String? refId,
    String? documentType,
    String? status,
    int offset = 0,
    int limit = 100,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{'offset': offset, 'limit': limit};

        if (refType != null) queryParams['ref_type'] = refType;
        if (refId != null) queryParams['ref_id'] = refId;
        if (documentType != null) queryParams['document_type'] = documentType;
        if (status != null) queryParams['status'] = status;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_LegalDocumentsEndpoint.getDocs(), queryParameters: queryParams);

        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse<LegalDocumentResponse>.fromJson(
                json,
                (itemJson) => LegalDocumentResponse.fromJson(
                  itemJson as Map<String, dynamic>,
                ),
              ),
        );
      },
    );
  }

  @override
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
    return await handleNetworkError(
      proccess: () async {
        final formData = FormData.fromMap({
          'ref_type': refType,
          'ref_id': refId,
          'document_type': documentType,
          'title': title,
          if (description != null) 'description': description,
          if (status != null) 'status': status,
          'file': MultipartFile.fromBytes(fileBytes, filename: fileName),
        });

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_LegalDocumentsEndpoint.createUpload(), data: formData);

        return NetworkResponse.fromResponse(
          response,
          converter: (json) => LegalDocumentResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<LegalDocumentResponse>> updateLegalDocument({
    required String documentId,
    String? title,
    String? description,
    String? documentType,
    String? status,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final updateData = LegalDocumentUpdate(
          title: title,
          description: description,
          documentType: documentType,
          status: status,
        );

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _LegalDocumentsEndpoint.documentDetail(documentId),
          data: updateData.toJson(),
        );

        return NetworkResponse.fromResponse(
          response,
          converter: (json) => LegalDocumentResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteLegalDocument({
    required String documentId,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_LegalDocumentsEndpoint.documentDetail(documentId));

        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }
}
