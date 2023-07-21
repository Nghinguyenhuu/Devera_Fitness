import 'package:equatable/equatable.dart';

import '../../extensions/extensions.dart';

class ActivityModel extends Equatable {
  int? id;
  String? image;
  String? title;
  DateTime? date;

  ActivityModel({this.id, this.image, this.title, this.date});

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['date'] = this.date.toString();
    return data;
  }

  ActivityModel.fromJson(Map<String, dynamic>? json) {
    this.id = json?['id'];
    this.image = json?['image'];
    this.title = json?['title'];
    this.date = json?['date'].toString().convertToDateTime();
  }

  @override
  List<Object?> get props => [id, image, title, date];
}
