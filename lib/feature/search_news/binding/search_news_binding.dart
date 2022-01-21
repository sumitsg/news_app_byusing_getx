import 'package:get/get.dart';
import 'package:news_app_byusing_getx/feature/search_news/controller/search_news_controller.dart';

class SearchNewsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }
}
