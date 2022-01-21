import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_byusing_getx/core/widget/drawer.dart';
import 'package:news_app_byusing_getx/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {
  const NewsHeadlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dependancy Injection
    final controller = Get.find<NewsHeadlineController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News Headlines',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      drawer: getAppDrawer(),
      body: Obx(
        () {
          return controller.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: const EdgeInsets.all(10),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.article[index].imageUrl == null
                              ? const SizedBox(
                                  height: 40,
                                )
                              : Image.network(
                                  controller.article[index].imageUrl!),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            controller.article[index].title!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          controller.article[index].desc == null
                              ? Container()
                              : Text(
                                  controller.article[index].desc!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 2,
                    ),
                    itemCount: controller.article.length,
                  ),
                );
        },
      ),
    );
  }
}
