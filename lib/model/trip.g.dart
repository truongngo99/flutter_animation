// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Trips _$$_TripsFromJson(Map<String, dynamic> json) => _$_Trips(
      id: json['id'] as String?,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      nights: json['nights'] as int,
      image: json['image'] as String?,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_TripsToJson(_$_Trips instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'nights': instance.nights,
      'image': instance.image,
      'description': instance.description,
    };
