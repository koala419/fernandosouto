import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutoRecord extends FirestoreRecord {
  ProdutoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nomeProduto" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  bool hasNomeProduto() => _nomeProduto != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "sincronizado" field.
  bool? _sincronizado;
  bool get sincronizado => _sincronizado ?? false;
  bool hasSincronizado() => _sincronizado != null;

  void _initializeFields() {
    _nomeProduto = snapshotData['nomeProduto'] as String?;
    _valor = castToType<double>(snapshotData['valor']);
    _sincronizado = snapshotData['sincronizado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produto');

  static Stream<ProdutoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutoRecord.fromSnapshot(s));

  static Future<ProdutoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutoRecord.fromSnapshot(s));

  static ProdutoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutoRecordData({
  String? nomeProduto,
  double? valor,
  bool? sincronizado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeProduto': nomeProduto,
      'valor': valor,
      'sincronizado': sincronizado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProdutoRecordDocumentEquality implements Equality<ProdutoRecord> {
  const ProdutoRecordDocumentEquality();

  @override
  bool equals(ProdutoRecord? e1, ProdutoRecord? e2) {
    return e1?.nomeProduto == e2?.nomeProduto &&
        e1?.valor == e2?.valor &&
        e1?.sincronizado == e2?.sincronizado;
  }

  @override
  int hash(ProdutoRecord? e) =>
      const ListEquality().hash([e?.nomeProduto, e?.valor, e?.sincronizado]);

  @override
  bool isValidKey(Object? o) => o is ProdutoRecord;
}
