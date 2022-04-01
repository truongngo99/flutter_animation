// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Trips _$TripsFromJson(Map<String, dynamic> json) {
  return _Trips.fromJson(json);
}

/// @nodoc
class _$TripsTearOff {
  const _$TripsTearOff();

  _Trips call(
      {String? id,
      required String name,
      required double price,
      required int nights,
      String? image,
      required String description}) {
    return _Trips(
      id: id,
      name: name,
      price: price,
      nights: nights,
      image: image,
      description: description,
    );
  }

  Trips fromJson(Map<String, Object?> json) {
    return Trips.fromJson(json);
  }
}

/// @nodoc
const $Trips = _$TripsTearOff();

/// @nodoc
mixin _$Trips {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get nights => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripsCopyWith<Trips> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripsCopyWith<$Res> {
  factory $TripsCopyWith(Trips value, $Res Function(Trips) then) =
      _$TripsCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      double price,
      int nights,
      String? image,
      String description});
}

/// @nodoc
class _$TripsCopyWithImpl<$Res> implements $TripsCopyWith<$Res> {
  _$TripsCopyWithImpl(this._value, this._then);

  final Trips _value;
  // ignore: unused_field
  final $Res Function(Trips) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? nights = freezed,
    Object? image = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      nights: nights == freezed
          ? _value.nights
          : nights // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TripsCopyWith<$Res> implements $TripsCopyWith<$Res> {
  factory _$TripsCopyWith(_Trips value, $Res Function(_Trips) then) =
      __$TripsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      double price,
      int nights,
      String? image,
      String description});
}

/// @nodoc
class __$TripsCopyWithImpl<$Res> extends _$TripsCopyWithImpl<$Res>
    implements _$TripsCopyWith<$Res> {
  __$TripsCopyWithImpl(_Trips _value, $Res Function(_Trips) _then)
      : super(_value, (v) => _then(v as _Trips));

  @override
  _Trips get _value => super._value as _Trips;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? nights = freezed,
    Object? image = freezed,
    Object? description = freezed,
  }) {
    return _then(_Trips(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      nights: nights == freezed
          ? _value.nights
          : nights // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Trips implements _Trips {
  const _$_Trips(
      {this.id,
      required this.name,
      required this.price,
      required this.nights,
      this.image,
      required this.description});

  factory _$_Trips.fromJson(Map<String, dynamic> json) =>
      _$$_TripsFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final double price;
  @override
  final int nights;
  @override
  final String? image;
  @override
  final String description;

  @override
  String toString() {
    return 'Trips(id: $id, name: $name, price: $price, nights: $nights, image: $image, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Trips &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.nights, nights) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(nights),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$TripsCopyWith<_Trips> get copyWith =>
      __$TripsCopyWithImpl<_Trips>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripsToJson(this);
  }
}

abstract class _Trips implements Trips {
  const factory _Trips(
      {String? id,
      required String name,
      required double price,
      required int nights,
      String? image,
      required String description}) = _$_Trips;

  factory _Trips.fromJson(Map<String, dynamic> json) = _$_Trips.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  double get price;
  @override
  int get nights;
  @override
  String? get image;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$TripsCopyWith<_Trips> get copyWith => throw _privateConstructorUsedError;
}
