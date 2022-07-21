import 'package:get/get.dart';
import 'package:waterme/db/db_helper.dart';
import 'package:waterme/models/selected_plant.dart';

class PlantController extends GetxController {

  @override
  void onReady(){
    super.onReady();
  }

  Future<int> addSelectedPlant({SelectedPlant? selectedPlant}) async {
    return await DBHelper.insert(selectedPlant);
  }


}