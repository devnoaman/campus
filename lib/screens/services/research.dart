import 'package:campus/compunents/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
// final Uri _url = Uri.parse('https://flutter.dev');

class ResearchScreen extends HookConsumerWidget {
  const ResearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المواقع البحثية'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: HtmlWidget(
          '''
       <p class="mb-15 font-15 pt-20 pb-20 " style="line-height: 30px; direction: rtl ; text-align:right; " id="article_content"><h1 style="text-align: center;">
	<strong>الروابط البحثية الخاصة بالتدريسي&nbsp;</strong></h1>
<p style="direction: rtl; text-align: right;">
	<span style="font-size:14px;">ادناه طريقة فتح الحسابات الخاصة بنشر البحوث في المواقع البحثية العالمية للتدريسيين والباحثين حيث تحتوي الروابط التالية الخطوات الواجب اتباعها لاستكمال عملية التسجيل بشكل اساسي ، علماً ان هذه الخطوات قد تتغير وحسب السياسات الخاصة بادارة هذه المواقع ، يرجى الاطلاع عليها واتباعها لمساعدتكم في فتح حساباتكم البحثية .</span></p>
<p style="text-align: right;">
	<a href="http://uomustansiriyah.edu.iq/media/attachments/221/221_2019_05_21!11_26_30_AM.pdf"><img alt="" src="/userfiles/221,2020_01_15!10_07_09.png" style="width: 225px; height: 225px;"><br>
	</a></p>
<p style="direction: rtl; text-align: right;">
	<span style="font-size:16px;">&nbsp;لتحميل دليل المواقع البحثية research gate</span></p>
<p style="text-align: right;">
	<a href="https://uomustansiriyah.edu.iq/media/attachments/221/221_2019_05_21!11_26_30_AM.pdf" style="font-size: 16px;">اضغط هنا</a></p>
<p style="direction: rtl; text-align: right;">
	رابط الدخول على الموقع&nbsp; :&nbsp;<a href="https://www.researchgate.net/">https://www.researchgate.net/</a></p>
<p style="text-align: right;">
	-----------------------------------------------------------------------------------------</p>
<p style="text-align: right;">
	<span style="font-size:16px;"><br>
	</span></p>
<p style="text-align: right;">
	<a href="media/attachments/221/221_2019_04_04!10_08_17_AM.pdf"><img alt="" src="/userfiles/221,2020_01_15!10_08_14.png" style="width: 411px; height: 122px;"><br>
	</a></p>
<p style="direction: rtl; text-align: right;">
	<span style="font-size:16px;">لتحميل دليل موقع Orcid&nbsp;</span></p>
<p style="text-align: right;">
	<a href="media/attachments/221/221_2019_04_04!10_08_17_AM.pdf" style="font-size: 16px;">اضغط هنا&nbsp;</a></p>
<p style="direction: rtl; text-align: right;">
	رابط الدخول للموقع&nbsp; :&nbsp;<a href="https://orcid.org/">https://orcid.org/</a></p>
<p style="text-align: right;">
	-----------------------------------------------------------------------------------------</p>
<p style="text-align: right;">
	&nbsp;</p>
<p style="text-align: right;">
	<a href="https://youtu.be/BgHp6gzHYZo"><img alt="" src="/userfiles/221,2020_01_15!10_10_35.jpg" style="width: 438px; height: 115px;"><br>
	</a></p>
<p style="text-align: right;">
	<span style="font-size: 16px;">طريقة التسجيل على كوكل سكولر</span></p>
<p style="text-align: right;">
	<a href="https://youtu.be/BgHp6gzHYZo">اضغط هنا</a></p>
<p style="direction: rtl; text-align: right;">
	<span style="font-size:16px;">رابط الدخول للموقع :&nbsp;</span><a href="https://scholar.google.com/schhp?hl=ar">https://scholar.google.com/schhp?hl=ar</a></p>
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
          onLoadingBuilder: (context, element, loadingProgress) => Center(
              child: Container(
                  width: 100,
                  height: 100,
                  child: const CircularProgressIndicator())),

          // this callback will be triggered when user taps a link
          onTapUrl: (url) async {
            print(url);
            var uri = Uri.parse(url);
            if (!await launchUrl(uri)) print('Could not launch $uri');

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
