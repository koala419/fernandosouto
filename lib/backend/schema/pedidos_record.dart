import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosRecord extends FirestoreRecord {
  PedidosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id_pedido" field.
  String? _idPedido;
  String get idPedido => _idPedido ?? '';
  bool hasIdPedido() => _idPedido != null;

  // "produto" field.
  DocumentReference? _produto;
  DocumentReference? get produto => _produto;
  bool hasProduto() => _produto != null;

  // "cliente" field.
  DocumentReference? _cliente;
  DocumentReference? get cliente => _cliente;
  bool hasCliente() => _cliente != null;

  // "qtd" field.
  int? _qtd;
  int get qtd => _qtd ?? 0;
  bool hasQtd() => _qtd != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _idPedido = snapshotData['id_pedido'] as String?;
    _produto = snapshotData['produto'] as DocumentReference?;
    _cliente = snapshotData['cliente'] as DocumentReference?;
    _qtd = castToType<int>(snapshotData['qtd']);
    _data = snapshotData['data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pedidos');

  static Stream<PedidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidosRecord.fromSnapshot(s));

  static Future<PedidosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidosRecord.fromSnapshot(s));

  static PedidosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PedidosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidosRecordData({
  String? idPedido,
  DocumentReference? produto,
  DocumentReference? cliente,
  int? qtd,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_pedido': idPedido,
      'produto': produto,
      'cliente': cliente,
      'qtd': qtd,
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidosRecordDocumentEquality implements Equality<PedidosRecord> {
  const PedidosRecordDocumentEquality();

  @override
  bool equals(PedidosRecord? e1, PedidosRecord? e2) {
    return e1?.idPedido == e2?.idPedido &&
        e1?.produto == e2?.produto &&
        e1?.cliente == e2?.cliente &&
        e1?.qtd == e2?.qtd &&
        e1?.data == e2?.data;
  }

  @override
  int hash(PedidosRecord? e) => const ListEquality()
      .hash([e?.idPedido, e?.produto, e?.cliente, e?.qtd, e?.data]);

  @override
  bool isValidKey(Object? o) => o is PedidosRecord;
}
