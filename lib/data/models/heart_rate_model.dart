import 'package:equatable/equatable.dart';

class HeartRateModel extends Equatable {
  String? id;
  String? deviceId;
  String? maxRate;
  String? minRate;
  String? averRate;
  List<int>? signal;
  String? time;

  HeartRateModel({this.id, this.deviceId, this.maxRate, this.minRate, this.signal, this.time, this.averRate});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['device_id'] = deviceId;
    data['heart_max'] = maxRate;
    data['heart_min'] = minRate;
    data['averRate'] = averRate;
    data['signal'] = signal?.map((e) => e).toList();
    data['time'] = time;
    return data;
  }

  HeartRateModel.fromJson(Map<String, dynamic>? data) {
    if (data != null) {
      this.id = data['id'].toString();
      this.deviceId = data['device_id'].toString();
      this.minRate = data['heart_min'].toString();
      this.averRate = data['heart_aver'].toString();
      this.maxRate = data['heart_max'].toString();
      if (data['signal'] != null) {
        this.signal = <int>[];
        data['signal'].forEach((e) {
          this.signal!.add(e);
        });
      }
      this.time = data['time'].toString();
    }
  }

  @override
  List<Object?> get props => [id, deviceId, maxRate, minRate, signal, time, averRate];
}
