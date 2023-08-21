import 'package:equatable/equatable.dart';

class ExercisesModel extends Equatable {
  final String name;
  final int quantities;
  final int minutes;
  final String image;

  const ExercisesModel({
    required this.name,
    required this.quantities,
    required this.minutes,
    required this.image,
  });

  @override
  List<Object?> get props => [name, quantities, minutes, image];
}
