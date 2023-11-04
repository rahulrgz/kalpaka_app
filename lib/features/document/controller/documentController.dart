import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/model/orderModel.dart';
import 'package:kalpaka_app/model/staffModel.dart';
import 'package:kalpaka_app/model/usermodel.dart';

import '../../../core/commons/utils.dart';
import '../../../model/documentmodel.dart';
import '../repository/documentrepository.dart';

final getDocumentsProvider = StreamProvider(
    (ref) => ref.watch(documentControllerProvider.notifier).getDocuments());
final documentControllerProvider = StateNotifierProvider((ref) {
  return DocumentController(
      documentRepository: ref.read(documentRepositoryProvider), ref: ref);
});

class DocumentController extends StateNotifier<bool> {
  final DocumentRepository _documentRepository;
  final Ref _ref;

  DocumentController(
      {required DocumentRepository documentRepository, required Ref ref})
      : _documentRepository = documentRepository,
        _ref = ref,
        super(false);

  Stream<List<DocumentModel>> getDocuments() {
    return _documentRepository.getDocuments();
  }

  void uploadDocument(
      {required String url,
      required String description,
      required BuildContext context}) async {
    var copy = DocumentModel(
        description: description,
        uid: "",
        uploadDate: DateTime.now(),
        uploadedUser: userModel!.uid.toString(),
        doc: url);

    final res = await _documentRepository.uploadDocument(doc: copy);
    res.fold(
        (l) => showSnackBar(
            context: context, content: "Documnet Added Successfully"), (r) {
      showSnackBar(context: context, content: "Documnet Added Successfully");
      Navigator.pop(context);
    });
  }
}
