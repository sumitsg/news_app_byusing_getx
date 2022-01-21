import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app_byusing_getx/core/model/article.dart';
import 'package:news_app_byusing_getx/core/repository/news_repo.dart';
import 'package:news_app_byusing_getx/core/repository/news_repo_impl.dart';

class SearchNewsController extends GetxController {
  late NewsRepo _newsRepo;

  final searchTextController = TextEditingController();

  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImpl>();

    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNewsHeadline();
      }
    });
  }

  RxBool isLoading = false.obs;
  RxList<Article> articles = RxList();

  searchNewsHeadline() async {
    showLoading();

    final result = await _newsRepo.getSearchedNews(searchTextController.text);
    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print("No data receive");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
