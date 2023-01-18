import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:campus/compunents/image_view.dart';

class NewsView extends HookConsumerWidget {
  final String title;
  final String description;
  NewsView({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Scrollbar(
          child: HtmlWidget(
            description,

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
      ),
    );
  }
}
