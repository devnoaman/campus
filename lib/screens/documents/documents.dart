import 'package:campus/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Documents extends StatelessWidget {
  var name = 'Noaman Monther';
  var r = 'الدكتوراة';

  Documents({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاستمارات'),
      ),
      body: Container(
        width: getSize(context).width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/folder.svg',
                        color: Colors.orange,
                        width: getSize(context).width * 0.4,
                      ),
                      Text('الطلبات')
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/folder.svg',
                        width: getSize(context).width * 0.4,
                      ),
                      Text('الترقيات')
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/folder.svg',
                        color: Colors.orange,
                        width: getSize(context).width * 0.4,
                      ),
                      Text('الطلبات')
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/folder.svg',
                        width: getSize(context).width * 0.4,
                      ),
                      Text('الترقيات')
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text('الاستمارات الخاصة باعضاء الهيئة التدريسية'),
              TextButton(
                  onPressed: () async {
                    final doc = pw.Document();

                    final font =
                        await rootBundle.load("assets/Cairo/Cairo-Regular.ttf");
                    final ttf = pw.Font.ttf(font);
                    doc.addPage(pw.Page(
                        pageFormat: PdfPageFormat.a4,
                        textDirection: pw.TextDirection.rtl,
                        // clip: true,
                        theme: pw.ThemeData.withFont(
                          base: ttf,
                        ),
                        build: (pw.Context context) {
                          return pw.Column(
                            children: [
                              pw.Row(children: [
                                pw.Text('الجامعة المستنصرية / الترقيات العلمية',
                                    textAlign: pw.TextAlign.left),
                              ]),
                              pw.SizedBox(
                                height: 60,
                                child: pw.Divider(
                                    color: PdfColors.grey, thickness: 1.5),
                              ),
                              pw.Center(child: pw.Text('م/تعهد')),
                              pw.SizedBox(
                                height: 60,
                                // child: pw.Divider(
                                //     color: PdfColors.grey, thickness: 1.5),
                              ),
                              pw.Container(
                                  width: 600,
                                  child: pw.Text(
                                      'اني ${name} اتعهد بالبحوث الموسومة',
                                      style: pw.TextStyle(fontSize: 16))),
                              pw.Container(
                                width: 600,
                                child: pw.Text(
                                  'والذي تقدمّت به لنيل الترقية العلمية إلى مرتبة ${r} غير مستّلّه أو مسروقة جزئياّ أو كليّاّ بًشكل ينافي أصول كتابة البحث العلمي والأمانة العلمية والقوانين والقرارات النافذة من المجلات العلمية والرسائل والاطاريح أو الكتب العلمية وشبكة المعلومات الدولية (الانترنيت)، وكلّ ما يتعّلق بحقوق الملكية الفكرية للآخرين، وسوف اتحمل كافة التبعات القانونية والإٍدارية إذا ثبت عكس ذلك، سواء أثناء أو بعد نيل المرتبة العلمية.',
                                  style: pw.TextStyle(fontSize: 16),
                                  textDirection: pw.TextDirection.rtl,
                                  // textAlign: pw.TextAlign.justify,
                                ),
                              )
                            ],
                          ); // Center
                        })); // Page

                    await Printing.layoutPdf(
                        onLayout: (PdfPageFormat format) async => doc.save());
                  },
                  child: Text('طباعة'))
            ],
          ),
        ),
      ),
    );
  }

  pw.PageTheme _buildTheme(pw.Font base, pw.Font bold, pw.Font italic) {
    return pw.PageTheme(
      // pageFormat: pageFormat,
      theme: pw.ThemeData.withFont(
        base: base,
        bold: bold,
        italic: italic,
      ),
      buildBackground: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.Text('Hello pdf'),
      ),
    );
  }
}
