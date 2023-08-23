import '../../extensions/extensions.dart';

class WorkoutModel {
  int? id;
  String? name;
  int? caloriesBurn;
  int? minutes;
  double? progress;
  String? image;
  DateTime? date;
  List<ToolModel>? tools;
  List<ExercisesModel>? sets;

  WorkoutModel({this.id, this.name, this.caloriesBurn, this.minutes, this.progress, this.image, this.date, this.tools, this.sets});

  WorkoutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    caloriesBurn = json['caloriesBurn'];
    minutes = json['minutes'];
    progress = json['progress'];
    image = json['image'];
    date = json['date'].toString().convertToDateTime();
    if (json['tools'] != null) {
      tools = <ToolModel>[];
      json['tools'].forEach((v) {
        tools!.add(ToolModel.fromJson(v));
      });
    }
    if (json['sets'] != null) {
      sets = <ExercisesModel>[];
      json['sets'].forEach((v) {
        sets!.add(ExercisesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['caloriesBurn'] = this.caloriesBurn;
    data['minutes'] = this.minutes;
    data['progress'] = this.progress;
    data['image'] = this.image;
    data['date'] = this.date.convertDateTimeToString();
    if (this.tools != null) {
      data['tools'] = this.tools!.map((v) => v.toJson()).toList();
    }
    if (this.sets != null) {
      data['sets'] = this.sets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ToolModel {
  String? name;
  String? image;

  ToolModel({this.name, this.image});

  ToolModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class ExercisesModel {
  String? name;
  String? image;
  DateTime? timer;
  bool? isTimer;
  int? quantity;
  List<ExercisesModel>? exercises;

  ExercisesModel({this.name, this.timer, this.image, this.exercises, this.isTimer, this.quantity});

  ExercisesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    timer = json['timer']?.toString().convertToDateTime();
    image = json['image'];
    quantity = json['quantity'];
    isTimer = json['isTimer'];
    image = json['image'];
    if (json['exercises'] != null) {
      exercises = <ExercisesModel>[];
      json['exercises'].forEach((v) {
        exercises!.add(ExercisesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['timer'] = this.timer.convertDateTimeToString();
    data['image'] = this.image;
    data['isTimer'] = this.isTimer;
    data['quantity'] = this.quantity;
    if (this.exercises != null) {
      data['exercises'] = this.exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
