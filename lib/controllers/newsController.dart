import 'package:get/state_manager.dart';
import 'package:ylabstutorial/models/newsmodel.dart';
import 'package:ylabstutorial/services/remote_services.dart';

class NewsController extends GetxController {
  // ignore: deprecated_member_use
  var newsArticle = List<Article>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      var news = await RemoteServices.fetchNews();
      if (news != null) {
        newsArticle.value = news.articles;
      }
    } finally {
      isLoading(false);
    }
  }
}
