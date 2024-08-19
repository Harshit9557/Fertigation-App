// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ReviewItemModel extends Equatable {
  ReviewItemModel({
    this.device,
    this.volume,
    this.mode,
    this.preMix,
    this.postMix,
    this.fertigation,
  });

  String? device;
  int? volume;
  String? mode;
  int? preMix;
  int? postMix;
  int? fertigation;

  ReviewItemModel copyWith({
    String? device,
    int? volume,
    String? mode,
    int? preMix,
    int? postMix,
    int? fertigation,
  }) {
    return ReviewItemModel(
      device: device ?? this.device,
      volume: volume ?? this.volume,
      mode: mode ?? this.mode,
      preMix: preMix ?? this.preMix,
      postMix: postMix ?? this.postMix,
      fertigation: fertigation ?? this.fertigation,
    );
  }

  ReviewItemModel.fromJson(Map<String, dynamic> json) {
    device = json['device'] ?? '';
    volume = json['volume'] ?? 0;
    mode = json['mode'] ?? '';
    preMix = json['pre_mix'] ?? 0;
    postMix = json['post_mix'] ?? 0;
    fertigation = json['fertigation'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device'] = device;
    data['volume'] = volume;
    data['mode'] = mode;
    data['pre_mix'] = preMix;
    data['post_mix'] = postMix;
    data['fertigation'] = fertigation;
    return data;
  }

  @override
  List<Object?> get props =>
      [device, volume, mode, preMix, postMix, fertigation];
}
