import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_byusing_getx/core/widget/drawer.dart';
import 'package:news_app_byusing_getx/feature/search_news/controller/search_news_controller.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'search News ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      drawer: getAppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller.searchTextController,
            decoration: const InputDecoration(prefixIcon: Icon(Icons.search)),
          ),
          Expanded(child: Obx(() {
            return controller.isLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.articles.isEmpty
                    ? const Center(
                        child: Text('NO NEWS FOUND...!'),
                      )
                    : Container(
                        margin: const EdgeInsets.all(10),
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.articles[index].imageUrl == null
                                    ? const SizedBox(
                                        height: 40,
                                      )
                                    : Image.network(
                                        controller.articles[index].imageUrl!),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  controller.articles[index].title!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                controller.articles[index].desc == null
                                    ? Container()
                                    : Text(
                                        controller.articles[index].desc!,
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
                          itemCount: controller.articles.length,
                        ),
                      );
          })),
        ],
      ),
    );
  }
}
