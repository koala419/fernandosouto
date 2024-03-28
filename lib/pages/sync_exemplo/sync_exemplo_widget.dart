import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'sync_exemplo_model.dart';
export 'sync_exemplo_model.dart';

class SyncExemploWidget extends StatefulWidget {
  const SyncExemploWidget({super.key});

  @override
  State<SyncExemploWidget> createState() => _SyncExemploWidgetState();
}

class _SyncExemploWidgetState extends State<SyncExemploWidget> {
  late SyncExemploModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SyncExemploModel());

    _model.textFieldQtdOnController ??= TextEditingController();
    _model.textFieldQtdOnFocusNode ??= FocusNode();

    _model.textFieldQtdOffController ??= TextEditingController();
    _model.textFieldQtdOffFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 32.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 28.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder<List<PedidosRecord>>(
                    stream: queryPedidosRecord(
                      queryBuilder: (pedidosRecord) =>
                          pedidosRecord.orderBy('data', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<PedidosRecord> containerPedidosRecordList =
                          snapshot.data!;
                      return Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: StreamBuilder<List<ClientesRecord>>(
                          stream: queryClientesRecord(
                            queryBuilder: (clientesRecord) =>
                                clientesRecord.orderBy('nome'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ClientesRecord>
                                containerClientesClientesRecordList =
                                snapshot.data!;
                            return Container(
                              decoration: const BoxDecoration(),
                              child: StreamBuilder<List<ProdutoRecord>>(
                                stream: queryProdutoRecord(
                                  queryBuilder: (produtoRecord) =>
                                      produtoRecord.orderBy('nomeProduto'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ProdutoRecord>
                                      containerProdutosProdutoRecordList =
                                      snapshot.data!;
                                  return Container(
                                    decoration: const BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 26.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .network_wifi_1_bar_outlined,
                                                        color:
                                                            Color(0xFFBC1623),
                                                        size: 24.0,
                                                      ),
                                                      Text(
                                                        '  Você está Offine',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: const Color(
                                                                      0xFFBC1623),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const FaIcon(
                                                          FontAwesomeIcons
                                                              .exclamationTriangle,
                                                          color:
                                                              Color(0xFFBC1623),
                                                          size: 24.0,
                                                        ),
                                                        Text(
                                                          '  Você tem ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Text(
                                                          'Você tem ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: const Color(
                                                                    0xFFBC1623),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Text(
                                                          ' registros pendentes',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Text(
                                                          ' de sincronização',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  12.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              while (FFAppState()
                                                                      .pedidos.isNotEmpty) {
                                                                await PedidosRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createPedidosRecordData(
                                                                      cliente: FFAppState()
                                                                          .pedidos
                                                                          .first
                                                                          .idCliente,
                                                                      qtd: FFAppState()
                                                                          .pedidos
                                                                          .first
                                                                          .qtd,
                                                                      produto: FFAppState()
                                                                          .pedidos
                                                                          .first
                                                                          .idProduto,
                                                                      data: FFAppState()
                                                                          .pedidos
                                                                          .first
                                                                          .data,
                                                                    ));
                                                                setState(() {
                                                                  FFAppState().removeFromPedidos(
                                                                      FFAppState()
                                                                          .pedidos
                                                                          .first);
                                                                });
                                                              }
                                                            },
                                                            text:
                                                                ' Sincronizar',
                                                            icon: const Icon(
                                                              Icons.sync,
                                                              size: 25.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              setState(() {
                                                                FFAppState()
                                                                    .pedidos = [];
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .login_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                    ))
                                                      Padding(
                                                        padding: const EdgeInsets.all(
                                                            12.0),
                                                        child: Container(
                                                          width: 360.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    18.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              20.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Pedidos Online',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).success,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        controller: _model
                                                                            .dropClienteOnValueController ??= FormFieldController<
                                                                                String>(
                                                                            null),
                                                                        options: containerClientesClientesRecordList
                                                                            .map((e) =>
                                                                                e.nome)
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.dropClienteOnValue = val),
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            50.0,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).bodyMedium,
                                                                        hintText:
                                                                            'Cliente',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            const Color(0xB37742E6),
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            true,
                                                                        isSearchable:
                                                                            false,
                                                                        isMultiSelect:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        controller: _model
                                                                            .dropProdutoOnValueController ??= FormFieldController<
                                                                                String>(
                                                                            null),
                                                                        options: containerProdutosProdutoRecordList
                                                                            .map((e) =>
                                                                                e.nomeProduto)
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.dropProdutoOnValue = val),
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            50.0,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).bodyMedium,
                                                                        hintText:
                                                                            'Produto',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            const Color(0xB37742E6),
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            true,
                                                                        isSearchable:
                                                                            false,
                                                                        isMultiSelect:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              12.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textFieldQtdOnController,
                                                                        focusNode:
                                                                            _model.textFieldQtdOnFocusNode,
                                                                        autofocus:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              'Quantidade',
                                                                          labelStyle:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0xB37742E6),
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        validator: _model
                                                                            .textFieldQtdOnControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          if (FFAppState().pedidos.isNotEmpty) {
                                                                            while (FFAppState().pedidos.isNotEmpty) {
                                                                              await PedidosRecord.collection.doc().set(createPedidosRecordData(
                                                                                    produto: FFAppState().pedidos.first.idProduto,
                                                                                    cliente: FFAppState().pedidos.first.idCliente,
                                                                                    qtd: FFAppState().pedidos.first.qtd,
                                                                                    data: FFAppState().pedidos.first.data,
                                                                                  ));
                                                                              setState(() {
                                                                                FFAppState().removeFromPedidos(FFAppState().pedidos.first);
                                                                              });
                                                                            }
                                                                          }

                                                                          await PedidosRecord
                                                                              .collection
                                                                              .doc()
                                                                              .set(createPedidosRecordData(
                                                                                produto: containerProdutosProdutoRecordList.where((e) => e.nomeProduto == _model.dropClienteOnValue).toList().first.reference,
                                                                                cliente: containerClientesClientesRecordList.where((e) => e.nome == _model.dropClienteOnValue).toList().first.reference,
                                                                                qtd: int.tryParse(_model.textFieldQtdOnController.text),
                                                                                data: getCurrentTimestamp,
                                                                              ));
                                                                        },
                                                                        text:
                                                                            ' Enviar',
                                                                        icon:
                                                                            const FaIcon(
                                                                          FontAwesomeIcons
                                                                              .paperPlane,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              180.0,
                                                                          height:
                                                                              40.0,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              24.0,
                                                                              0.0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: Colors.white,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                    ))
                                                      Padding(
                                                        padding: const EdgeInsets.all(
                                                            12.0),
                                                        child: Container(
                                                          width: 360.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    18.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              20.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Pedidos Offline',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        controller: _model
                                                                            .dropClienteOffValueController ??= FormFieldController<
                                                                                String>(
                                                                            null),
                                                                        options: FFAppState()
                                                                            .clientes
                                                                            .map((e) =>
                                                                                e.nome)
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.dropClienteOffValue = val),
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            50.0,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).bodyMedium,
                                                                        hintText:
                                                                            'Cliente',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            const Color(0xB37742E6),
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            true,
                                                                        isSearchable:
                                                                            false,
                                                                        isMultiSelect:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        controller: _model
                                                                            .dropProdutoOffValueController ??= FormFieldController<
                                                                                String>(
                                                                            null),
                                                                        options: FFAppState()
                                                                            .produtos
                                                                            .map((e) =>
                                                                                e.descricao)
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.dropProdutoOffValue = val),
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            50.0,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).bodyMedium,
                                                                        hintText:
                                                                            'Produto',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            const Color(0xB37742E6),
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            true,
                                                                        isSearchable:
                                                                            false,
                                                                        isMultiSelect:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              12.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textFieldQtdOffController,
                                                                        focusNode:
                                                                            _model.textFieldQtdOffFocusNode,
                                                                        autofocus:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              'Quantidade',
                                                                          labelStyle:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0xB37742E6),
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        validator: _model
                                                                            .textFieldQtdOffControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        FFAppState()
                                                                            .addToPedidos(PedidosStruct(
                                                                          idCliente: FFAppState()
                                                                              .clientes
                                                                              .where((e) => e.nome == _model.dropClienteOffValue)
                                                                              .toList()
                                                                              .first
                                                                              .idCliente,
                                                                          cliente: FFAppState()
                                                                              .clientes
                                                                              .where((e) => e.nome == _model.dropClienteOffValue)
                                                                              .toList()
                                                                              .first
                                                                              .nome,
                                                                          data:
                                                                              getCurrentTimestamp,
                                                                          idProduto: FFAppState()
                                                                              .produtos
                                                                              .where((e) => e.descricao == _model.dropProdutoOffValue)
                                                                              .toList()
                                                                              .first
                                                                              .idProduto,
                                                                          produto: FFAppState()
                                                                              .produtos
                                                                              .where((e) => e.descricao == _model.dropProdutoOffValue)
                                                                              .toList()
                                                                              .first
                                                                              .descricao,
                                                                          qtd: int.tryParse(_model
                                                                              .textFieldQtdOffController
                                                                              .text),
                                                                        ));
                                                                      });
                                                                    },
                                                                    text:
                                                                        ' Enviar',
                                                                    icon:
                                                                        const FaIcon(
                                                                      FontAwesomeIcons
                                                                          .paperPlane,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          180.0,
                                                                      height:
                                                                          40.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                    ))
                                                      Padding(
                                                        padding: const EdgeInsets.all(
                                                            12.0),
                                                        child: Container(
                                                          width: 360.0,
                                                          height: 350.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    12.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  const Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .database,
                                                                          color:
                                                                              Color(0x807742E6),
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          'Backend',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              80.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Cliente',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              80.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Produto',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Qtd',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Valor',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final pedidosOnline = containerPedidosRecordList
                                                                          .map((e) =>
                                                                              e)
                                                                          .toList()
                                                                          .take(
                                                                              5)
                                                                          .toList();
                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            pedidosOnline.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                pedidosOnlineIndex) {
                                                                          final pedidosOnlineItem =
                                                                              pedidosOnline[pedidosOnlineIndex];
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 80.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Text(
                                                                                    containerClientesClientesRecordList.where((e) => e.reference.id == pedidosOnlineItem.cliente?.id).toList().first.nome,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 80.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      containerProdutosProdutoRecordList.where((e) => e.reference.id == pedidosOnlineItem.produto?.id).toList().first.nomeProduto,
                                                                                      'vazio',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Text(
                                                                                    containerPedidosRecordList.where((e) => e.reference.id == pedidosOnlineItem.reference.id).toList().first.qtd.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      containerProdutosProdutoRecordList.where((e) => e.reference.id == pedidosOnlineItem.produto?.id).toList().first.valor.toString(),
                                                                                      'vazio',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(12.0),
                                                      child: Container(
                                                        width: 360.0,
                                                        height: 350.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 2.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  12.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              12.0),
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .mobileAlt,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        'AppState',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              fontSize: 16.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            80.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Cliente',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            80.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Produto',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Qtd',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Valor',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final listOff = FFAppState()
                                                                        .pedidos
                                                                        .map((e) =>
                                                                            e)
                                                                        .toList();
                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          listOff
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              listOffIndex) {
                                                                        final listOffItem =
                                                                            listOff[listOffIndex];
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 80.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Text(
                                                                                  FFAppState().clientes.where((e) => e.idCliente?.id == listOffItem.idCliente?.id).toList().first.nome,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 80.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Text(
                                                                                  FFAppState().produtos.where((e) => e.idProduto?.id == listOffItem.idProduto?.id).toList().first.descricao,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Text(
                                                                                  listOffItem.qtd.toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 50.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Text(
                                                                                  FFAppState().produtos.where((e) => e.idProduto?.id == listOffItem.idProduto?.id).toList().first.valor.toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await PedidosRecord.collection.doc().set(createPedidosRecordData(
                                                                                        produto: listOffItem.idProduto,
                                                                                        cliente: listOffItem.idCliente,
                                                                                        qtd: listOffItem.qtd,
                                                                                        data: listOffItem.data,
                                                                                      ));
                                                                                  setState(() {
                                                                                    FFAppState().removeAtIndexFromPedidos(listOffIndex);
                                                                                  });
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.upload_file,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
