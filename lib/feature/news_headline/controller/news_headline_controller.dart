import 'package:get/get.dart';
import 'package:news_app_byusing_getx/core/model/article.dart';
import 'package:news_app_byusing_getx/core/repository/news_repo.dart';
import 'package:news_app_byusing_getx/core/repository/news_repo_impl.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepo _newsRepo;

  NewsHeadlineController() {
    // ? we get the referrance of NewsRepo implementation
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsHeadline();
  }

  // ! it is observable list which we can observe the list
  // ! and update the UI accordingly
  late RxList<Article> article;
  RxBool isLoading = false.obs;

  // ? load the news headline

  loadNewsHeadline() async {
    showLoading();
    final result = await _newsRepo.getNewsHeadline();
    hideLoading();

    if (result != null) {
      article = result.obs;
    } else {
      print('No Data');
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
