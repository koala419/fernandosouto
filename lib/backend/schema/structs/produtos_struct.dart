// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutosStruct extends FFFirebaseStruct {
  ProdutosStruct({
    DocumentReference? idProduto,
    String? descricao,
    double? valor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idProduto = idProduto,
        _descricao = descricao,
        _valor = valor,
        super(firestoreUtilData);

  // "id_produto" field.
  DocumentReference? _idProduto;
  DocumentReference? get idProduto => _idProduto;
  set idProduto(DocumentReference? val) => _idProduto = val;
  bool hasIdProduto() => _idProduto != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;
  bool hasDescricao() => _descricao != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;
  void incrementValor(double amount) => _valor = valor + amount;
  bool hasValor() => _valor != null;

  static ProdutosStruct fromMap(Map<String, dynamic> data) => ProdutosStruct(
        idProduto: data['id_produto'] as DocumentReference?,
        descricao: data['descricao'] as String?,
        valor: castToType<double>(data['valor']),
      );

  static ProdutosStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProdutosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id_produto': _idProduto,
        'descricao': _descricao,
        'valor': _valor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_produto': serializeParam(
          _idProduto,
          ParamType.DocumentReference,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
      }.withoutNulls;

  static ProdutosStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProdutosStruct(
        idProduto: deserializeParam(
          data['id_produto'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['produto'],
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ProdutosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProdutosStruct &&
        idProduto == other.idProduto &&
        descricao == other.descricao &&
        valor == other.valor;
  }

  @override
  int get hashCode => const ListEquality().hash([idProduto, descricao, valor]);
}

ProdutosStruct createProdutosStruct({
  DocumentReference? idProduto,
  String? descricao,
  double? valor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProdutosStruct(
      idProduto: idProduto,
      descricao: descricao,
      valor: valor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProdutosStruct? updateProdutosStruct(
  ProdutosStruct? produtos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    produtos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProdutosStructData(
  Map<String, dynamic> firestoreData,
  ProdutosStruct? produtos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (produtos == null) {
    return;
  }
  if (produtos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && produtos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final produtosData = getProdutosFirestoreData(produtos, forFieldValue);
  final nestedData = produtosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = produtos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProdutosFirestoreData(
  ProdutosStruct? produtos, [
  bool forFieldValue = false,
]) {
  if (produtos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(produtos.toMap());

  // Add any Firestore field values
  produtos.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProdutosListFirestoreData(
  List<ProdutosStruct>? produtoss,
) =>
    produtoss?.map((e) => getProdutosFirestoreData(e, true)).toList() ?? [];
