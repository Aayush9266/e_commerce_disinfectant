import 'package:get/get.dart';
import 'package:e_commerce_disinfectant/data/repo/base_repo.dart';
import 'package:e_commerce_disinfectant/utils/sp/sp_manager.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();
  BaseRepo _baseRepo;

  BaseController(this._baseRepo);

  String employeeId = '';

  // final allCityRespo = (ApiResponse<UpdateProfileReq>()).obs;

  @override
  onInit() {
    super.onInit();
  }

  Future<String> getCustomerId() async {
    if (employeeId.isEmpty) employeeId = await SPManager.getCustomerId();
    return employeeId;
  }
}
