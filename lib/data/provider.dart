import 'package:get/get.dart';
import '../modal/model.dart';

class ApiProvider extends GetConnect {
  final String appBaseUrl = "https://www.episodate.com/api/most-popular";
  ApiProvider() {
    httpClient.baseUrl = appBaseUrl;
    httpClient.defaultContentType = 'application/json';
  }
  Future<TvShowModel> getTVShow(String page) async {
    try {
      final response = await get("?page=" + page);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return tvShowModelFromJson(response.bodyString!);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
