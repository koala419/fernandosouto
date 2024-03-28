import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sync_exemplo_widget.dart' show SyncExemploWidget;
import 'package:flutter/material.dart';

class SyncExemploModel extends FlutterFlowModel<SyncExemploWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Drop-ClienteOn widget.
  String? dropClienteOnValue;
  FormFieldController<String>? dropClienteOnValueController;
  // State field(s) for Drop-ProdutoOn widget.
  String? dropProdutoOnValue;
  FormFieldController<String>? dropProdutoOnValueController;
  // State field(s) for TextField-QtdOn widget.
  FocusNode? textFieldQtdOnFocusNode;
  TextEditingController? textFieldQtdOnController;
  String? Function(BuildContext, String?)? textFieldQtdOnControllerValidator;
  // State field(s) for Drop-ClienteOff widget.
  String? dropClienteOffValue;
  FormFieldController<String>? dropClienteOffValueController;
  // State field(s) for Drop-ProdutoOff widget.
  String? dropProdutoOffValue;
  FormFieldController<String>? dropProdutoOffValueController;
  // State field(s) for TextField-QtdOff widget.
  FocusNode? textFieldQtdOffFocusNode;
  TextEditingController? textFieldQtdOffController;
  String? Function(BuildContext, String?)? textFieldQtdOffControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldQtdOnFocusNode?.dispose();
    textFieldQtdOnController?.dispose();

    textFieldQtdOffFocusNode?.dispose();
    textFieldQtdOffController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
