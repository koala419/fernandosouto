import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comp_criar_novo_user_widget.dart' show CompCriarNovoUserWidget;
import 'package:flutter/material.dart';

class CompCriarNovoUserModel extends FlutterFlowModel<CompCriarNovoUserWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  // State field(s) for sobrenome widget.
  FocusNode? sobrenomeFocusNode;
  TextEditingController? sobrenomeController;
  String? Function(BuildContext, String?)? sobrenomeControllerValidator;
  // State field(s) for whatsapp widget.
  FocusNode? whatsappFocusNode;
  TextEditingController? whatsappController;
  String? Function(BuildContext, String?)? whatsappControllerValidator;
  // State field(s) for clonableURL widget.
  FocusNode? clonableURLFocusNode;
  TextEditingController? clonableURLController;
  String? Function(BuildContext, String?)? clonableURLControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ClientesRecord? novoCliente;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeController?.dispose();

    sobrenomeFocusNode?.dispose();
    sobrenomeController?.dispose();

    whatsappFocusNode?.dispose();
    whatsappController?.dispose();

    clonableURLFocusNode?.dispose();
    clonableURLController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
