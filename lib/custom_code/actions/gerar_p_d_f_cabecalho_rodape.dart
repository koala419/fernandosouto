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

// ** Função assíncrona que gera um PDF com um Cabeçalho.
Future gerarPDFCabecalhoRodape(
  String header, // Parametro (Variável do conetúdo do Cabeçalho)
  String rodape, // Parametro (Variável do conetúdo do Rodapé)
  String imagem, // Parametro (Caminho/URL da imagem)
) async {
  final pdf = pw
      .Document(); // Declara a Variável "pdf" que representa o Documento gerado

  // Declara a Variável "http" e e obtem os bytes da "imagem" a partir da URL fornecida
  final http.Response response = await http.get(Uri.parse(imagem));

  // Declara a variável "imageBytes" e converte a resposta da requisição HTTP em uma lista de bytes (Uint8List)
  final Uint8List imageBytes = response.bodyBytes;

  // Adiciona uma nova página ao documento PDF, usando o formato de página A4
  pdf.addPage(pw.MultiPage(
    pageFormat: PdfPageFormat.a4,

    // Inicia a construção das páginas
    build: (context) => [
      //Cabeçalho
      pw.Column(
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              // Texto do Cabeçalho
              pw.Text(
                header, //Variável dinâmica
                style: pw.TextStyle(
                  fontSize: 30,
                  font: pw.Font.helvetica(),
                ), // Estilização da Fonte
              ),

              // Imagem do Cabeçalho
              pw.Image(pw.MemoryImage(imageBytes), width: 150, height: 100),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Divider(thickness: 1),
        ],
      ),
    ],

    // Rodapé
    footer: (pw.Context context) => pw.Container(
      alignment: pw.Alignment.center,
      margin: const pw.EdgeInsets.only(top: 10),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            rodape, // Conteúdo da variável "rodape"
            style: pw.TextStyle(
              fontSize: 12,
            ),
          ),
          pw.Text(
            'Página ${context.pageNumber} de ${context.pagesCount}', // Texto no lado direito (Página atual e numero de páginas)
            style: pw.TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  ));

  //abre o PDF no Navegador
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
