import 'package:e_commerce_disinfectant/data/repo/base_repo.dart';

class HomeRepo extends BaseRepo{

  allCity(String employeeId) async {
    var map = <String, String>{};
    map['employee_id'] = employeeId;
    map['device_id'] = 'await deviceId()';
    // final response =
    //     await apiHelper.post(url: "${ApiConstant.ABOUT_US}", params: map);

    // return ApiResponse.returnResponse(
    //     response,
    //     response.data == null
    //         ? null
    //         : UpdateProfileReq.fromJson(jsonDecode(response.toString())));
  }
}
