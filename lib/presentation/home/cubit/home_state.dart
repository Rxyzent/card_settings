import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeBuildable with _$HomeBuildable {
  const factory HomeBuildable() = _HomeBuildable;
}

@freezed
class HomeListenable with _$HomeListenable {
  const factory HomeListenable() = _HomeListenable;
}