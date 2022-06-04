import 'package:campus/compunents/search_bar.dart';
import 'package:campus/data/constants.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:campus/screens/home_screen/widgets/section.dart';
import 'package:campus/screens/news/news_provider.dart';
import 'package:campus/screens/news/top_news_slider.dart';
import 'package:campus/screens/news/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class News extends ConsumerWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var news = ref.watch(newsProvider);

    return news.when(data: (data) {
      return SizedBox(
        width: getSize(context).width,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: (data!.length >= 5) ? 5 : data.length,
          itemBuilder: (context, index) {
            return PostCard(
              model: data[index],
            );
          },
        ),
      );
    }, error: (error, st) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });

    // ListView(
    //   physics:
    //       const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    //   children: [
    //     const SearchBar(),
    //     Section(
    //       title: 'Top News',
    //       child: const TopNews(),
    //     ),
    //     PostCard()
    //   ],
    // );
  }
}
