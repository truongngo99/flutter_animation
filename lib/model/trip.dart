import 'package:freezed_annotation/freezed_annotation.dart';
part 'trip.freezed.dart';
part 'trip.g.dart';

@freezed
class Trips with _$Trips {
  const factory Trips({
    String? id,
    required String name,
    required double price,
    required int nights,
    required String image,
    required String description,
  }) = _Trips;
  factory Trips.fromJson(Map<String, dynamic> json) => _$TripsFromJson(json);
}
