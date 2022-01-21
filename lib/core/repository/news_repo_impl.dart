import 'package:get/get.dart';
import 'package:news_app_byusing_getx/core/model/article.dart';
import 'package:news_app_byusing_getx/core/model/news_response_model.dart';
import 'package:news_app_byusing_getx/core/repository/news_repo.dart';
import 'package:news_app_byusing_getx/service/http_service.dart';
import 'package:news_app_byusing_getx/service/http_service_impl.dart';

class NewsRepoImpl implements NewsRepo {
  late HttpService _httpService;

  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>?> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest("/v2/top-headlines?country=in");

      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

// ! get the news by searching specific word....
  @override
  Future<List<Article>?> getSearchedNews(String query) async {
    try {
      final response = await _httpService.getRequest("/v2/everything?q=$query");

      final parsedresponse = NewsResponse.fromJson(response.data);
      return parsedresponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
