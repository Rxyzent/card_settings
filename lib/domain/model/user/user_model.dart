// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  @HiveType(typeId: 0)
  const factory UserModel({
    @HiveField(0) int? id,
    @HiveField(1) String? image,
    @HiveField(2) String? phoneNumber,
    @HiveField(3) String? fullName,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
