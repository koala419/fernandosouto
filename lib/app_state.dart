import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _logotipo = prefs.getString('ff_logotipo') ?? _logotipo;
    });
    _safeInit(() {
      _pedidos = prefs
              .getStringList('ff_pedidos')
              ?.map((x) {
                try {
                  return PedidosStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _pedidos;
    });
    _safeInit(() {
      _produtos = prefs
              .getStringList('ff_produtos')
              ?.map((x) {
                try {
                  return ProdutosStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _produtos;
    });
    _safeInit(() {
      _clientes = prefs
              .getStringList('ff_clientes')
              ?.map((x) {
                try {
                  return ClientesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _clientes;
    });
    _safeInit(() {
      _backgroundImg = prefs.getString('ff_backgroundImg') ?? _backgroundImg;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _logotipo =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/fernando-souto-v7hvfe/assets/h2xse5fn9mrz/logoPassaro.png';
  String get logotipo => _logotipo;
  set logotipo(String value) {
    _logotipo = value;
    prefs.setString('ff_logotipo', value);
  }

  String _nomeEmpresa = 'BlueBird Tech';
  String get nomeEmpresa => _nomeEmpresa;
  set nomeEmpresa(String value) {
    _nomeEmpresa = value;
  }

  List<PedidosStruct> _pedidos = [];
  List<PedidosStruct> get pedidos => _pedidos;
  set pedidos(List<PedidosStruct> value) {
    _pedidos = value;
    prefs.setStringList(
        'ff_pedidos', value.map((x) => x.serialize()).toList());
  }

  void addToPedidos(PedidosStruct value) {
    _pedidos.add(value);
    prefs.setStringList(
        'ff_pedidos', _pedidos.map((x) => x.serialize()).toList());
  }

  void removeFromPedidos(PedidosStruct value) {
    _pedidos.remove(value);
    prefs.setStringList(
        'ff_pedidos', _pedidos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPedidos(int index) {
    _pedidos.removeAt(index);
    prefs.setStringList(
        'ff_pedidos', _pedidos.map((x) => x.serialize()).toList());
  }

  void updatePedidosAtIndex(
    int index,
    PedidosStruct Function(PedidosStruct) updateFn,
  ) {
    _pedidos[index] = updateFn(_pedidos[index]);
    prefs.setStringList(
        'ff_pedidos', _pedidos.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPedidos(int index, PedidosStruct value) {
    _pedidos.insert(index, value);
    prefs.setStringList(
        'ff_pedidos', _pedidos.map((x) => x.serialize()).toList());
  }

  List<ProdutosStruct> _produtos = [];
  List<ProdutosStruct> get produtos => _produtos;
  set produtos(List<ProdutosStruct> value) {
    _produtos = value;
    prefs.setStringList(
        'ff_produtos', value.map((x) => x.serialize()).toList());
  }

  void addToProdutos(ProdutosStruct value) {
    _produtos.add(value);
    prefs.setStringList(
        'ff_produtos', _produtos.map((x) => x.serialize()).toList());
  }

  void removeFromProdutos(ProdutosStruct value) {
    _produtos.remove(value);
    prefs.setStringList(
        'ff_produtos', _produtos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProdutos(int index) {
    _produtos.removeAt(index);
    prefs.setStringList(
        'ff_produtos', _produtos.map((x) => x.serialize()).toList());
  }

  void updateProdutosAtIndex(
    int index,
    ProdutosStruct Function(ProdutosStruct) updateFn,
  ) {
    _produtos[index] = updateFn(_produtos[index]);
    prefs.setStringList(
        'ff_produtos', _produtos.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProdutos(int index, ProdutosStruct value) {
    _produtos.insert(index, value);
    prefs.setStringList(
        'ff_produtos', _produtos.map((x) => x.serialize()).toList());
  }

  List<ClientesStruct> _clientes = [];
  List<ClientesStruct> get clientes => _clientes;
  set clientes(List<ClientesStruct> value) {
    _clientes = value;
    prefs.setStringList(
        'ff_clientes', value.map((x) => x.serialize()).toList());
  }

  void addToClientes(ClientesStruct value) {
    _clientes.add(value);
    prefs.setStringList(
        'ff_clientes', _clientes.map((x) => x.serialize()).toList());
  }

  void removeFromClientes(ClientesStruct value) {
    _clientes.remove(value);
    prefs.setStringList(
        'ff_clientes', _clientes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromClientes(int index) {
    _clientes.removeAt(index);
    prefs.setStringList(
        'ff_clientes', _clientes.map((x) => x.serialize()).toList());
  }

  void updateClientesAtIndex(
    int index,
    ClientesStruct Function(ClientesStruct) updateFn,
  ) {
    _clientes[index] = updateFn(_clientes[index]);
    prefs.setStringList(
        'ff_clientes', _clientes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInClientes(int index, ClientesStruct value) {
    _clientes.insert(index, value);
    prefs.setStringList(
        'ff_clientes', _clientes.map((x) => x.serialize()).toList());
  }

  int _atualContagemSync = 0;
  int get atualContagemSync => _atualContagemSync;
  set atualContagemSync(int value) {
    _atualContagemSync = value;
  }

  String _backgroundImg =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/fernando-souto-v7hvfe/assets/8oty40gnc1fb/pexels-darius-krause-2931915.jpg';
  String get backgroundImg => _backgroundImg;
  set backgroundImg(String value) {
    _backgroundImg = value;
    prefs.setString('ff_backgroundImg', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
