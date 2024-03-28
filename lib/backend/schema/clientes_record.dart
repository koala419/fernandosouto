import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClientesRecord extends FirestoreRecord {
  ClientesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "criadoNoComponente" field.
  bool? _criadoNoComponente;
  bool get criadoNoComponente => _criadoNoComponente ?? false;
  bool hasCriadoNoComponente() => _criadoNoComponente != null;

  // "dataCriado" field.
  DateTime? _dataCriado;
  DateTime? get dataCriado => _dataCriado;
  bool hasDataCriado() => _dataCriado != null;

  // "sincronizado" field.
  bool? _sincronizado;
  bool get sincronizado => _sincronizado ?? false;
  bool hasSincronizado() => _sincronizado != null;

  // "modulo" field.
  String? _modulo;
  String get modulo => _modulo ?? '';
  bool hasModulo() => _modulo != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _email = snapshotData['email'] as String?;
    _criadoNoComponente = snapshotData['criadoNoComponente'] as bool?;
    _dataCriado = snapshotData['dataCriado'] as DateTime?;
    _sincronizado = snapshotData['sincronizado'] as bool?;
    _modulo = snapshotData['modulo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clientes');

  static Stream<ClientesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientesRecord.fromSnapshot(s));

  static Future<ClientesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientesRecord.fromSnapshot(s));

  static ClientesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientesRecordData({
  String? nome,
  String? email,
  bool? criadoNoComponente,
  DateTime? dataCriado,
  bool? sincronizado,
  String? modulo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'email': email,
      'criadoNoComponente': criadoNoComponente,
      'dataCriado': dataCriado,
      'sincronizado': sincronizado,
      'modulo': modulo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientesRecordDocumentEquality implements Equality<ClientesRecord> {
  const ClientesRecordDocumentEquality();

  @override
  bool equals(ClientesRecord? e1, ClientesRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.email == e2?.email &&
        e1?.criadoNoComponente == e2?.criadoNoComponente &&
        e1?.dataCriado == e2?.dataCriado &&
        e1?.sincronizado == e2?.sincronizado &&
        e1?.modulo == e2?.modulo;
  }

  @override
  int hash(ClientesRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.email,
        e?.criadoNoComponente,
        e?.dataCriado,
        e?.sincronizado,
        e?.modulo
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientesRecord;
}
