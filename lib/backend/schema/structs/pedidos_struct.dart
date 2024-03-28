// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosStruct extends FFFirebaseStruct {
  PedidosStruct({
    DocumentReference? idCliente,
    String? cliente,
    DateTime? data,
    DocumentReference? idProduto,
    String? produto,
    int? qtd,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idCliente = idCliente,
        _cliente = cliente,
        _data = data,
        _idProduto = idProduto,
        _produto = produto,
        _qtd = qtd,
        super(firestoreUtilData);

  // "id_cliente" field.
  DocumentReference? _idCliente;
  DocumentReference? get idCliente => _idCliente;
  set idCliente(DocumentReference? val) => _idCliente = val;
  bool hasIdCliente() => _idCliente != null;

  // "cliente" field.
  String? _cliente;
  String get cliente => _cliente ?? '';
  set cliente(String? val) => _cliente = val;
  bool hasCliente() => _cliente != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;
  bool hasData() => _data != null;

  // "id_produto" field.
  DocumentReference? _idProduto;
  DocumentReference? get idProduto => _idProduto;
  set idProduto(DocumentReference? val) => _idProduto = val;
  bool hasIdProduto() => _idProduto != null;

  // "produto" field.
  String? _produto;
  String get produto => _produto ?? '';
  set produto(String? val) => _produto = val;
  bool hasProduto() => _produto != null;

  // "qtd" field.
  int? _qtd;
  int get qtd => _qtd ?? 0;
  set qtd(int? val) => _qtd = val;
  void incrementQtd(int amount) => _qtd = qtd + amount;
  bool hasQtd() => _qtd != null;

  static PedidosStruct fromMap(Map<String, dynamic> data) => PedidosStruct(
        idCliente: data['id_cliente'] as DocumentReference?,
        cliente: data['cliente'] as String?,
        data: data['data'] as DateTime?,
        idProduto: data['id_produto'] as DocumentReference?,
        produto: data['produto'] as String?,
        qtd: castToType<int>(data['qtd']),
      );

  static PedidosStruct? maybeFromMap(dynamic data) =>
      data is Map ? PedidosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id_cliente': _idCliente,
        'cliente': _cliente,
        'data': _data,
        'id_produto': _idProduto,
        'produto': _produto,
        'qtd': _qtd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_cliente': serializeParam(
          _idCliente,
          ParamType.DocumentReference,
        ),
        'cliente': serializeParam(
          _cliente,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
        'id_produto': serializeParam(
          _idProduto,
          ParamType.DocumentReference,
        ),
        'produto': serializeParam(
          _produto,
          ParamType.String,
        ),
        'qtd': serializeParam(
          _qtd,
          ParamType.int,
        ),
      }.withoutNulls;

  static PedidosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PedidosStruct(
        idCliente: deserializeParam(
          data['id_cliente'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['clientes'],
        ),
        cliente: deserializeParam(
          data['cliente'],
          ParamType.String,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
        idProduto: deserializeParam(
          data['id_produto'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['produto'],
        ),
        produto: deserializeParam(
          data['produto'],
          ParamType.String,
          false,
        ),
        qtd: deserializeParam(
          data['qtd'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PedidosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PedidosStruct &&
        idCliente == other.idCliente &&
        cliente == other.cliente &&
        data == other.data &&
        idProduto == other.idProduto &&
        produto == other.produto &&
        qtd == other.qtd;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([idCliente, cliente, data, idProduto, produto, qtd]);
}

PedidosStruct createPedidosStruct({
  DocumentReference? idCliente,
  String? cliente,
  DateTime? data,
  DocumentReference? idProduto,
  String? produto,
  int? qtd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PedidosStruct(
      idCliente: idCliente,
      cliente: cliente,
      data: data,
      idProduto: idProduto,
      produto: produto,
      qtd: qtd,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PedidosStruct? updatePedidosStruct(
  PedidosStruct? pedidos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pedidos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPedidosStructData(
  Map<String, dynamic> firestoreData,
  PedidosStruct? pedidos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pedidos == null) {
    return;
  }
  if (pedidos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pedidos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pedidosData = getPedidosFirestoreData(pedidos, forFieldValue);
  final nestedData = pedidosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pedidos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPedidosFirestoreData(
  PedidosStruct? pedidos, [
  bool forFieldValue = false,
]) {
  if (pedidos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pedidos.toMap());

  // Add any Firestore field values
  pedidos.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPedidosListFirestoreData(
  List<PedidosStruct>? pedidoss,
) =>
    pedidoss?.map((e) => getPedidosFirestoreData(e, true)).toList() ?? [];
