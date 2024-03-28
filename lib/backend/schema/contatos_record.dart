import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ContatosRecord extends FirestoreRecord {
  ContatosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _telefone = snapshotData['telefone'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contatos');

  static Stream<ContatosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContatosRecord.fromSnapshot(s));

  static Future<ContatosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContatosRecord.fromSnapshot(s));

  static ContatosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContatosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContatosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContatosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContatosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContatosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContatosRecordData({
  String? nome,
  String? descricao,
  String? telefone,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
      'telefone': telefone,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContatosRecordDocumentEquality implements Equality<ContatosRecord> {
  const ContatosRecordDocumentEquality();

  @override
  bool equals(ContatosRecord? e1, ContatosRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.descricao == e2?.descricao &&
        e1?.telefone == e2?.telefone &&
        e1?.email == e2?.email;
  }

  @override
  int hash(ContatosRecord? e) =>
      const ListEquality().hash([e?.nome, e?.descricao, e?.telefone, e?.email]);

  @override
  bool isValidKey(Object? o) => o is ContatosRecord;
}
