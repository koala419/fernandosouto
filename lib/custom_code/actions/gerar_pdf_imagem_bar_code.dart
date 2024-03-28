// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:printing/printing.dart'; // Impressão do PDF
import 'package:pdf/pdf.dart'; // Geração de PDF
import 'package:pdf/widgets.dart' as pw; // Geração de PDF
import 'package:http/http.dart' as http; // Realizar requisições HTTP
import 'dart:convert'; // Realizar requisições HTTP e manipular dados JSON
import 'package:qr_flutter/qr_flutter.dart' as qr; // Gerar QRCode
import 'package:barcode_widget/barcode_widget.dart'
    as barcode; // Gerar Código de Barras

// ** Função assíncrona que gera um PDF com um Cabeçalho, dados tabulares e um rodapé.
Future gerarPdfImagemBarCode(
  String barcodeData,
) async {
  final pdf = pw.Document();

  // Declara a variável "imagem", já com o caminho da URL como uma constante
  final imagem =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/flutterflow-advanced-ypdhp6/assets/zon4qr5bvuw1/img-carne-vem-pro-banqi.png';

  // Declara a Variável "http" e e obtem os bytes da "imagem" a partir da URL fornecida
  final http.Response response = await http.get(Uri.parse(imagem));
  // Declara a variável "imageBytes" e converte a resposta da requisição HTTP em uma lista de bytes (Uint8List)
  final Uint8List imageBytes = response.bodyBytes;

  // Adiciona uma única Página
  pdf.addPage(pw.Page(
    // Inicia a construção dos elementos da Página
    build: (pw.Context context) {
      // Cria uma imagem a partir de dados de bytes em memória. imageBytes
      return pw.Center(
        child: pw.Container(
          width: 500,
          height: 320,
          padding: pw.EdgeInsets.all(10.0),
          decoration: pw.BoxDecoration(
            borderRadius: pw.BorderRadius.circular(10), // Borda arredondada
            border: pw.Border.all(
              color: PdfColor.fromInt(0xFF808080),
              width: 1,
            ),
            boxShadow: [
              pw.BoxShadow(
                color: PdfColor.fromInt(0x4D7742E6),
                blurRadius: 3,
              ),
            ],
          ),
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Image(
                pw.MemoryImage(imageBytes),
                width: 100,
                height: 250,
              ),

              // Espaçamento
              pw.SizedBox(height: 30),

              // Código de Barras
              pw.Center(
                child: pw.BarcodeWidget(
                  barcode: barcode.Barcode.code128(),
                  data: barcodeData,
                  width: 300,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      );
    },
  ));

  //abre o PDF no Navegador usando as dependencias Printing
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
