import 'package:get/get.dart';
import 'package:e_commerce_disinfectant/controller/base_controller.dart';
import 'package:e_commerce_disinfectant/controller/home_controller.dart';
import 'package:e_commerce_disinfectant/controller/login_controller.dart';
import 'package:e_commerce_disinfectant/data/repo/base_repo.dart';
import 'package:e_commerce_disinfectant/data/repo/home_repo.dart';
import 'package:e_commerce_disinfectant/data/repo/login_repo.dart';
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController(BaseRepo()), fenix: true);
    Get.lazyPut(() => LoginController(LoginRepo()), fenix: true);
    Get.lazyPut(() => HomeController(HomeRepo()), fenix: true);

  }
}
