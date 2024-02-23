import 'package:get/get.dart';
import '../controller/new_controller.dart';
import '../data/provider.dart';
import '../repository/repository.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () =>
          HomeController(ShowRepository(ApiProvider())),
    );
  }
}
