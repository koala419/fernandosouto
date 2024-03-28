// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientesStruct extends FFFirebaseStruct {
  ClientesStruct({
    DocumentReference? idCliente,
    String? nome,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idCliente = idCliente,
        _nome = nome,
        super(firestoreUtilData);

  // "id_cliente" field.
  DocumentReference? _idCliente;
  DocumentReference? get idCliente => _idCliente;
  set idCliente(DocumentReference? val) => _idCliente = val;
  bool hasIdCliente() => _idCliente != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;
  bool hasNome() => _nome != null;

  static ClientesStruct fromMap(Map<String, dynamic> data) => ClientesStruct(
        idCliente: data['id_cliente'] as DocumentReference?,
        nome: data['nome'] as String?,
      );

  static ClientesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ClientesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id_cliente': _idCliente,
        'nome': _nome,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_cliente': serializeParam(
          _idCliente,
          ParamType.DocumentReference,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
      }.withoutNulls;

  static ClientesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClientesStruct(
        idCliente: deserializeParam(
          data['id_cliente'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['clientes'],
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ClientesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClientesStruct &&
        idCliente == other.idCliente &&
        nome == other.nome;
  }

  @override
  int get hashCode => const ListEquality().hash([idCliente, nome]);
}

ClientesStruct createClientesStruct({
  DocumentReference? idCliente,
  String? nome,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClientesStruct(
      idCliente: idCliente,
      nome: nome,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClientesStruct? updateClientesStruct(
  ClientesStruct? clientes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    clientes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addClientesStructData(
  Map<String, dynamic> firestoreData,
  ClientesStruct? clientes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (clientes == null) {
    return;
  }
  if (clientes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && clientes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final clientesData = getClientesFirestoreData(clientes, forFieldValue);
  final nestedData = clientesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = clientes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClientesFirestoreData(
  ClientesStruct? clientes, [
  bool forFieldValue = false,
]) {
  if (clientes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(clientes.toMap());

  // Add any Firestore field values
  clientes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClientesListFirestoreData(
  List<ClientesStruct>? clientess,
) =>
    clientess?.map((e) => getClientesFirestoreData(e, true)).toList() ?? [];
