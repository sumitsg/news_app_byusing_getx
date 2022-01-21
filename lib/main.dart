import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_byusing_getx/feature/news_headline/binding/news_headline_binding.dart';
import 'package:news_app_byusing_getx/feature/news_headline/view/news_headline_view.dart';
import 'package:news_app_byusing_getx/feature/search_news/binding/search_news_binding.dart';
import 'package:news_app_byusing_getx/feature/search_news/view/search_news_view.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      getPages: [
        GetPage(
            name: "/news_headline",
            page: () => const NewsHeadlineView(),
            binding: NewsHeadlineBinding()),
        GetPage(
            name: "/search_news",
            page: () => const SearchNewsView(),
            binding: SearchNewsBindings())
      ],
      initialRoute: "/news_headline",
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
