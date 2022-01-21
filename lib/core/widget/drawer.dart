import 'package:flutter/material.dart';
import 'package:get/get.dart';

getAppDrawer() {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: Text('News Headline'),
          onTap: () {
            Get.toNamed('/news_headline');
          },
          leading: const Icon(Icons.contact_page_outlined),
        ),
        ListTile(
            title: Text('Search News'),
            onTap: () {
              Get.toNamed('/search_news');
            },
            leading: const Icon(Icons.search)),
      ],
    ),
  );
}
