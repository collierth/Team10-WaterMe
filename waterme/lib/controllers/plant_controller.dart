import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:waterme/db/db_helper.dart';
import 'package:waterme/models/selected_plant.dart';

class PlantController extends GetxController {

  @override
  void onReady(){
    getPlants();
    super.onReady();
  }

  var plantList = <SelectedPlant>[].obs;

  Future<int> addSelectedPlant({SelectedPlant? selectedPlant}) async {
    return await DBHelper.insert(selectedPlant);
  }

  void getPlants() async {
    List<Map<String, dynamic>> plants = await DBHelper.query();
    plantList.assignAll(plants.map((data) => new SelectedPlant.fromJson(data)).toList());
  }

  void delete(SelectedPlant selectedPlant) {
    DBHelper.delete(selectedPlant);
    getPlants();
  }

  void markPlantCompleted(int id) async {
    await DBHelper.update(id);
    getPlants();
  }

  void updateEndTime(String newEndTime, int id) async {
    await DBHelper.updateEndTime(newEndTime, id);
    getPlants();
  }

  void updateName(String newName, int id) async {
    await DBHelper.updateName(newName, id);
    getPlants();
  }
}