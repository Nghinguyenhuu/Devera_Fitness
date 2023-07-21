import 'package:equatable/equatable.dart';

class WorkoutModel extends Equatable {
  final int? id;
  final String? name;
  final int? caloriesBurn;
  final int? minutes;
  final double? progress;
  final String? img;

  const WorkoutModel({this.progress, this.id, this.name, this.caloriesBurn, this.minutes, this.img});

  @override
  List<Object?> get props => [id, name, progress, caloriesBurn, minutes, img];
}
