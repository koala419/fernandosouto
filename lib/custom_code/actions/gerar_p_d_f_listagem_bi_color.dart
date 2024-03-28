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

// ** Função assíncrona que gera um PDF com um Cabeçalho, dados tabulares e um rodapé.
Future gerarPDFListagemBiColor(
  String header, // Parametro (Variável do conetúdo do Cabeçalho)
  String imagem, // Parametro (Caminho/URL da imagem)
  String qrCodeData, // Parametro (Variável do conteúdo do QRCode)
  String barcodeData, // Parametro (Variável do conteúdo do Código de Barras)
  List<ListaPDFStruct>
      lista, // Parametro (Data Type da Lista que deseja carregar)
) async {
  final pdf = pw
      .Document(); // Declara a Variável "pdf" que representa o Documento gerado

  // Declara a Variável "http" e e obtem os bytes da "imagem" a partir da URL fornecida
  final http.Response response = await http.get(Uri.parse(imagem));

  // Declara a variável "imageBytes" e converte a resposta da requisição HTTP em uma lista de bytes (Uint8List)
  final Uint8List imageBytes = response.bodyBytes;

  // ** Função que calcula a soma total das colunas com valores
  double
      totalSubtotais = // Declara a Variável totalSubtotais que irá acumular a soma dos valores dos "subtotais" da lista
      lista.map((item) => item.subtotal).fold(0, (a, b) => a + b);
  int totalQtd = // Declara a Variável totalQtd que irá acumular a soma dos valores das "qtd" da lista
      lista.map((item) => item.qtd).fold(0, (a, b) => a + b);
  // **

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

      // Espaçamento após Cabeçalho
      pw.SizedBox(height: 30),

      //Tabela de Dados
      pw.Table(
        border: pw.TableBorder.all(), // Inseriu Bordas
        children: [
          // Cabeçalho da Tabela
          pw.TableRow(
            children: [
              _buildTableCell(
                'Produto',
                fontWeight: pw.FontWeight.bold,
                backgroundColor: PdfColor.fromInt(0x4D7742E6),
                textColor: PdfColor.fromInt(0xFFFFFFFF),
              ),
              _buildTableCell(
                'Valor Unt',
                fontWeight: pw.FontWeight.bold,
                backgroundColor: PdfColor.fromInt(0x4D7742E6),
                alignment: pw.Alignment.centerRight,
                textColor: PdfColor.fromInt(0xFFFFFFFF),
              ),
              _buildTableCell(
                'Qtd',
                fontWeight: pw.FontWeight.bold,
                backgroundColor: PdfColor.fromInt(0x4D7742E6),
                alignment: pw.Alignment.center,
                textColor: PdfColor.fromInt(0xFFFFFFFF),
              ),
              _buildTableCell(
                'Sub Total',
                fontWeight: pw.FontWeight.bold,
                backgroundColor: PdfColor.fromInt(0x4D7742E6),
                alignment: pw.Alignment.centerRight,
                textColor: PdfColor.fromInt(0xFFFFFFFF),
              ),
            ],
          ),

          for (var item
              in lista) // Loop sobre a lista para criar as linhas de dados na tabela
            pw.TableRow(
              children: [
                _buildTableCell(
                  item.produto,
                  backgroundColor: lista.indexOf(item) % 2 == 1
                      ? PdfColor.fromInt(0xD3D3D3)
                      : null,
                ),
                _buildTableCell(
                  formatarMoeda(item.valor),
                  alignment: pw.Alignment.centerRight,
                  backgroundColor: lista.indexOf(item) % 2 == 1
                      ? PdfColor.fromInt(0xD3D3D3)
                      : null,
                ),
                _buildTableCell(
                  item.qtd.toString(),
                  alignment: pw.Alignment.center,
                  backgroundColor: lista.indexOf(item) % 2 == 1
                      ? PdfColor.fromInt(0xD3D3D3)
                      : null,
                ),
                _buildTableCell(
                  formatarMoeda(item.subtotal),
                  alignment: pw.Alignment.centerRight,
                  backgroundColor: lista.indexOf(item) % 2 == 1
                      ? PdfColor.fromInt(0xD3D3D3)
                      : null,
                ),
              ],
            ),

          // Última Linha
          pw.TableRow(
            children: [
              _buildTableCell(
                'Total Geral',
                fontWeight: pw.FontWeight.bold,
                backgroundColor: PdfColor.fromInt(0xFF888888),
              ),
              _buildTableCell(
                '-',
                alignment: pw.Alignment.center,
                backgroundColor: PdfColor.fromInt(0xFF888888),
              ),
              _buildTableCell(
                totalQtd.toString(),
                fontWeight: pw.FontWeight.bold,
                alignment: pw.Alignment.center,
                backgroundColor: PdfColor.fromInt(0xFF888888),
              ),
              _buildTableCell(
                formatarMoeda(totalSubtotais),
                fontWeight: pw.FontWeight.bold,
                alignment: pw.Alignment.centerRight,
                backgroundColor: PdfColor.fromInt(0xFF888888),
              ),
            ],
          ),
        ],
      ),

      // Espaçamento após a tabela
      pw.SizedBox(height: 30),

      // QRCode
      pw.Center(
        child: pw.Container(
          child: pw.BarcodeWidget(
            barcode: pw.Barcode.qrCode(),
            data: qrCodeData,
            width: 100,
            height: 100,
          ),
        ),
      ),

      // Espaçamento após o QRCode
      pw.SizedBox(height: 30),

      // Código de Barras
      pw.Center(
        child: pw.BarcodeWidget(
          barcode: pw.Barcode.code128(),
          data: barcodeData,
          width: 200,
          height: 50,
        ),
      ),
      // Espaçamento antes do Rodapé
      pw.SizedBox(height: 30),
    ],

    // Rodapé
    footer: (pw.Context context) => pw.Container(
      alignment: pw.Alignment.center,
      margin: const pw.EdgeInsets.only(top: 10),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            'Comunidade Sem Codar', // Texto no lado esquerdo
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

// ===================================================================================
// ===================================================================================
// =============================== FUNÇÕES AUXILIARES ================================
// ===================================================================================
// ===================================================================================

// ** Função para transformar numero double em String para imprimir como texto de moeda R$
String formatarMoeda(double valor) {
  final formatoMoeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return formatoMoeda.format(valor);
}

// ** Função auxiliar para construir uma célula de tabela com estilos específicos
pw.Widget _buildTableCell(
  String text, {
  pw.FontWeight? fontWeight, // Peso da fonte (negrito, leve, normal, etc.)
  pw.Alignment alignment =
      pw.Alignment.centerLeft, // Alinhamento do texto dentro da célula
  PdfColor? backgroundColor, // Cor de fundo da célula
  PdfColor? textColor, // Cor do texto na célula
}) {
  return pw.Container(
    padding: pw.EdgeInsets.all(8), // Espaçamento interno da célula
    color: backgroundColor, // Cor de fundo da célula
    child: pw.Text(
      text,
      style: pw.TextStyle(
        fontSize: 14, // Tamanho da fonte
        color: textColor ??
            PdfColor.fromInt(
                0xFF000000), // Cor padrão preta se a Cor da fonte não for fornecida
        fontWeight: fontWeight, // Peso da fonte
      ),
    ),
    alignment: alignment, // Alinhamento do conteúdo da célula
  );
}
