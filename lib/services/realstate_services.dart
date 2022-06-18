import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:realstate/models/realstate_model.dart';

class RealStateServices {
  var client = Dio();
  String apiKey = 'https://mocki.io/v1/528a4275-8eb6-4d7f-82d8-9ad5184a7c4b';

  Future<RealState?> getMyHouses() async {
    var response = await client.get(apiKey);
    try {
      if (response.statusCode == 200) {
        var jsonString = response.data;
        return RealState.fromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      GetSnackBar(
        title: e.toString(),
      );
    }
  }
}
