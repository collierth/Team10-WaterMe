class SelectedPlant {
  int? id;
  String? name;
  String? staticName;
  String? species;
  String? description;
  int? isCompleted;
  String? startTime;
  String? endTime;
  int? waterCycle;

  SelectedPlant({
    this.id,
    this.name,
    this.staticName,
    this.species,
    this.description,
    this.isCompleted,
    this.startTime,
    this.endTime,
    this.waterCycle,
  });

  SelectedPlant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    staticName = json['staticName'];
    species = json['species'];
    description = json['description'];
    isCompleted = json['isCompleted'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    waterCycle = json['waterCycle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['staticName'] = this.staticName;
    data['species'] = this.species;
    data['description'] = this.description;
    data['isCompleted'] = this.isCompleted;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['waterCycle'] = this.waterCycle;
    return data;
  }
}