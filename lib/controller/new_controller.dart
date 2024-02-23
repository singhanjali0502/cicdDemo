import 'dart:async';
import 'package:get/get.dart';
import '../modal/model.dart';
import '../repository/repository.dart';
class HomeController extends GetxController with StateMixin<List<TvShow>> {
  ShowRepository showRepository;
  HomeController(this.showRepository);
  List<TvShow> lstTvShows = [];
  var connectionStatus = 0.obs;
  @override void onInit() {
    super.onInit();
    getTvShow();
     }
    getTvShow() async {
      try {
        change(null, status: RxStatus.loading());
        showRepository.getTvShow("1").then((value) {
          lstTvShows.clear();
          lstTvShows.addAll(value.tvShows!);
          change(lstTvShows, status: RxStatus.success());
        },
            onError: (err) {
              change(null, status: RxStatus.error(err.toString()));
            });
      }
      catch (exception) {
        change(null, status: RxStatus.error(exception.toString()));
      }
    }
  }
