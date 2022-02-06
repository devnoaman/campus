import 'package:campus/compunents/search_bar.dart';
import 'package:campus/data/constants.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:campus/screens/home_screen/widgets/section.dart';
import 'package:campus/screens/news/top_news_slider.dart';
import 'package:campus/screens/news/widgets/post_card.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        const SearchBar(),
        Section(
          title: 'Top News',
          child: const TopNews(),
        ),
        PostCard()
      ],
    );
  }
}
