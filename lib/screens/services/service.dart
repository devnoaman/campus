import 'package:campus/compunents/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ServiceScreen extends HookConsumerWidget {
  const ServiceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاستمارات'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: HtmlWidget(
          '''
        </p>
<p style="direction: rtl; text-align: right;">
	<span style="font-size: 20px;">1 - إستمارة تدقيق الرصانة العلمية للمجلات ودور النشر العالمية والعربية والمحلية </span><a href="media/attachments/221/221_2020_09_21!04_23_33_AM.doc" style="font-size: 20px;">إضغط هنا.</a></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">2 - إستمارة رقم (1) معلومات عامة <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_23_58_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">3 - إستمارة رقم (2) نموذج فحص الرصانة <a href=" https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_24_22_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">4 - إستمارة رقم (3) محضر لجنة الرصانة <a href=" https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_25_09_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">5 - إستمارة رقم (4) تقرير الإستلال الإلكتروني <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_25_30_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">6 - إستمارة رقم (5) تقرير الإستلال العلمي <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_25_57_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">7 - إستمارة رقم (6) خلاصة تقويم بحوث الترقية العلمية <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_26_33_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">8 - إستمارة سير معاملة الترقية العلمية <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_26_58_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">9 - أمر داخلي - تشكيل لجنة الإستلال العلمي <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_28_17_AM.doc ">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">10 - تأييد اللجنة العلمية - تخصص عام ودقيق <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_28_39_AM.doc ">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">11 - تعهد البحوث <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_29_41_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">12 - تقييم البحوث خارج العراق <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_30_02_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">13 - تقييم البحوث داخل العراق <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_30_29_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">14 - سيرة مقدم الترقية <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_30_56_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">15 - طلب الإستلال الإلكتروني <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_31_21_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">16 - طلب تدقيق معاملة الترقية&nbsp;<a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_31_51_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">17 - طلب ترويج معاملة الترقية <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_32_12_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">18 - طلب تقييم الأداء <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_32_55_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">19 - محضر اللجنة العلمية - أستاذ - إنسانية <a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_33_26_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">20 - محضر اللجنة العلمية - أستاذ - علمية&nbsp;<a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_33_52_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">21 - محضر اللجنة العلمية - أستاذ مساعد - إنسانية&nbsp;<a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_34_21_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">22 - محضر اللجنة العلمية - أستاذ مساعد - علمية&nbsp;<a href="https://uomustansiriyah.edu.iq/ media/attachments/221/221_2020_09_21!04_34_48_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">23 - محضر اللجنة العلمية - مدرس - إنسانية&nbsp;<a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_35_30_AM.doc">إضغط هنا.</a></span></p>
<p dir="RTL" style="text-align: right;">
	<span style="font-size:20px;">24 - محضر اللجنة العلمية - مدرس - علمية&nbsp;<a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2020_09_21!04_35_58_AM.doc">إضغط هنا.</a></span></p>
<p style="text-align: right;">
	<span style="font-size:20px;"><br>
	</span></p>
</p>
        ''',

          // all other parameters are optional, a few notable params:

          // specify custom styling for an element
          // see supported inline styling below
          customStylesBuilder: (element) {
            if (element.classes.contains('foo')) {
              return {'color': 'red'};
            }

            return null;
          },

          // render a custom widget
          customWidgetBuilder: (element) {
            if (element.attributes['foo'] == 'bar') {
              // return FooBarWidget();
            }

            return null;
          },

          // these callbacks are called when a complicated element is loading
          // or failed to render allowing the app to render progress indicator
          // and fallback widget
          onErrorBuilder: (context, element, error) =>
              Text('$element error: $error'),
          onLoadingBuilder: (context, element, loadingProgress) =>
              const CircularProgressIndicator(),

          // this callback will be triggered when user taps a link
          onTapUrl: (url) {
            print(url);
            return true;
          },
          onTapImage: (img) {
            print(img.sources.first.url);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ImageView(img: img.sources.first.url)));
          },

          // select the render mode for HTML body
          // by default, a simple `Column` is rendered
          // consider using `ListView` or `SliverList` for better performance
          renderMode: RenderMode.listView,

          // set the default styling for text
          textStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
    ;
  }
}
