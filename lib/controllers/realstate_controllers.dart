import 'package:get/get.dart';
import 'package:realstate/models/realstate_model.dart';
import 'package:realstate/services/realstate_services.dart';

class RealStateControllers extends GetxController {
  Rx<RealState> data = RealState(data: []).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchHouses();
    super.onInit();
  }

  Future<void> fetchHouses() async {
    try {
      isLoading(true);
      var houses = await RealStateServices().getMyHouses();
      if (houses != null) {
        data.value = houses;
      }
    } finally {
      isLoading(false);
    }
  }
}
