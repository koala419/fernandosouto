// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListaPDFStruct extends FFFirebaseStruct {
  ListaPDFStruct({
    String? produto,
    double? valor,
    int? qtd,
    double? subtotal,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _produto = produto,
        _valor = valor,
        _qtd = qtd,
        _subtotal = subtotal,
        super(firestoreUtilData);

  // "produto" field.
  String? _produto;
  String get produto => _produto ?? '';
  set produto(String? val) => _produto = val;
  bool hasProduto() => _produto != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;
  void incrementValor(double amount) => _valor = valor + amount;
  bool hasValor() => _valor != null;

  // "qtd" field.
  int? _qtd;
  int get qtd => _qtd ?? 0;
  set qtd(int? val) => _qtd = val;
  void incrementQtd(int amount) => _qtd = qtd + amount;
  bool hasQtd() => _qtd != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  set subtotal(double? val) => _subtotal = val;
  void incrementSubtotal(double amount) => _subtotal = subtotal + amount;
  bool hasSubtotal() => _subtotal != null;

  static ListaPDFStruct fromMap(Map<String, dynamic> data) => ListaPDFStruct(
        produto: data['produto'] as String?,
        valor: castToType<double>(data['valor']),
        qtd: castToType<int>(data['qtd']),
        subtotal: castToType<double>(data['subtotal']),
      );

  static ListaPDFStruct? maybeFromMap(dynamic data) =>
      data is Map ? ListaPDFStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'produto': _produto,
        'valor': _valor,
        'qtd': _qtd,
        'subtotal': _subtotal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'produto': serializeParam(
          _produto,
          ParamType.String,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
        'qtd': serializeParam(
          _qtd,
          ParamType.int,
        ),
        'subtotal': serializeParam(
          _subtotal,
          ParamType.double,
        ),
      }.withoutNulls;

  static ListaPDFStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListaPDFStruct(
        produto: deserializeParam(
          data['produto'],
          ParamType.String,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
        qtd: deserializeParam(
          data['qtd'],
          ParamType.int,
          false,
        ),
        subtotal: deserializeParam(
          data['subtotal'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ListaPDFStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ListaPDFStruct &&
        produto == other.produto &&
        valor == other.valor &&
        qtd == other.qtd &&
        subtotal == other.subtotal;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([produto, valor, qtd, subtotal]);
}

ListaPDFStruct createListaPDFStruct({
  String? produto,
  double? valor,
  int? qtd,
  double? subtotal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ListaPDFStruct(
      produto: produto,
      valor: valor,
      qtd: qtd,
      subtotal: subtotal,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ListaPDFStruct? updateListaPDFStruct(
  ListaPDFStruct? listaPDF, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    listaPDF
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addListaPDFStructData(
  Map<String, dynamic> firestoreData,
  ListaPDFStruct? listaPDF,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (listaPDF == null) {
    return;
  }
  if (listaPDF.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && listaPDF.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final listaPDFData = getListaPDFFirestoreData(listaPDF, forFieldValue);
  final nestedData = listaPDFData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = listaPDF.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getListaPDFFirestoreData(
  ListaPDFStruct? listaPDF, [
  bool forFieldValue = false,
]) {
  if (listaPDF == null) {
    return {};
  }
  final firestoreData = mapToFirestore(listaPDF.toMap());

  // Add any Firestore field values
  listaPDF.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getListaPDFListFirestoreData(
  List<ListaPDFStruct>? listaPDFs,
) =>
    listaPDFs?.map((e) => getListaPDFFirestoreData(e, true)).toList() ?? [];
