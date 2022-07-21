class SelectedPlant {
  int? id;
  String? name;
  String? description;
  int? isCompleted;
  String? startTime;
  String? endTime;

  SelectedPlant({
    this.id,
    this.name,
    this.description,
    this.isCompleted,
    this.startTime,
    this.endTime,
  });

  SelectedPlant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isCompleted = json['isCompleted'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['isCompleted'] = this.isCompleted;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}