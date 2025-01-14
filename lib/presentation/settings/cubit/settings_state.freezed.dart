// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsBuildable {
  BackgroundSettings? get settings => throw _privateConstructorUsedError;
  SettingType get settingType => throw _privateConstructorUsedError;
  bool get gradientState => throw _privateConstructorUsedError;
  Map<String, Alignment>? get beginAlignments =>
      throw _privateConstructorUsedError;
  Map<String, Alignment>? get endAlignments =>
      throw _privateConstructorUsedError;

  /// Create a copy of SettingsBuildable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsBuildableCopyWith<SettingsBuildable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsBuildableCopyWith<$Res> {
  factory $SettingsBuildableCopyWith(
          SettingsBuildable value, $Res Function(SettingsBuildable) then) =
      _$SettingsBuildableCopyWithImpl<$Res, SettingsBuildable>;
  @useResult
  $Res call(
      {BackgroundSettings? settings,
      SettingType settingType,
      bool gradientState,
      Map<String, Alignment>? beginAlignments,
      Map<String, Alignment>? endAlignments});

  $BackgroundSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class _$SettingsBuildableCopyWithImpl<$Res, $Val extends SettingsBuildable>
    implements $SettingsBuildableCopyWith<$Res> {
  _$SettingsBuildableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsBuildable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = freezed,
    Object? settingType = null,
    Object? gradientState = null,
    Object? beginAlignments = freezed,
    Object? endAlignments = freezed,
  }) {
    return _then(_value.copyWith(
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as BackgroundSettings?,
      settingType: null == settingType
          ? _value.settingType
          : settingType // ignore: cast_nullable_to_non_nullable
              as SettingType,
      gradientState: null == gradientState
          ? _value.gradientState
          : gradientState // ignore: cast_nullable_to_non_nullable
              as bool,
      beginAlignments: freezed == beginAlignments
          ? _value.beginAlignments
          : beginAlignments // ignore: cast_nullable_to_non_nullable
              as Map<String, Alignment>?,
      endAlignments: freezed == endAlignments
          ? _value.endAlignments
          : endAlignments // ignore: cast_nullable_to_non_nullable
              as Map<String, Alignment>?,
    ) as $Val);
  }

  /// Create a copy of SettingsBuildable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BackgroundSettingsCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $BackgroundSettingsCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingsBuildableImplCopyWith<$Res>
    implements $SettingsBuildableCopyWith<$Res> {
  factory _$$SettingsBuildableImplCopyWith(_$SettingsBuildableImpl value,
          $Res Function(_$SettingsBuildableImpl) then) =
      __$$SettingsBuildableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BackgroundSettings? settings,
      SettingType settingType,
      bool gradientState,
      Map<String, Alignment>? beginAlignments,
      Map<String, Alignment>? endAlignments});

  @override
  $BackgroundSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$SettingsBuildableImplCopyWithImpl<$Res>
    extends _$SettingsBuildableCopyWithImpl<$Res, _$SettingsBuildableImpl>
    implements _$$SettingsBuildableImplCopyWith<$Res> {
  __$$SettingsBuildableImplCopyWithImpl(_$SettingsBuildableImpl _value,
      $Res Function(_$SettingsBuildableImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsBuildable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = freezed,
    Object? settingType = null,
    Object? gradientState = null,
    Object? beginAlignments = freezed,
    Object? endAlignments = freezed,
  }) {
    return _then(_$SettingsBuildableImpl(
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as BackgroundSettings?,
      settingType: null == settingType
          ? _value.settingType
          : settingType // ignore: cast_nullable_to_non_nullable
              as SettingType,
      gradientState: null == gradientState
          ? _value.gradientState
          : gradientState // ignore: cast_nullable_to_non_nullable
              as bool,
      beginAlignments: freezed == beginAlignments
          ? _value._beginAlignments
          : beginAlignments // ignore: cast_nullable_to_non_nullable
              as Map<String, Alignment>?,
      endAlignments: freezed == endAlignments
          ? _value._endAlignments
          : endAlignments // ignore: cast_nullable_to_non_nullable
              as Map<String, Alignment>?,
    ));
  }
}

/// @nodoc

class _$SettingsBuildableImpl implements _SettingsBuildable {
  const _$SettingsBuildableImpl(
      {this.settings,
      this.settingType = SettingType.none,
      this.gradientState = false,
      final Map<String, Alignment>? beginAlignments,
      final Map<String, Alignment>? endAlignments})
      : _beginAlignments = beginAlignments,
        _endAlignments = endAlignments;

  @override
  final BackgroundSettings? settings;
  @override
  @JsonKey()
  final SettingType settingType;
  @override
  @JsonKey()
  final bool gradientState;
  final Map<String, Alignment>? _beginAlignments;
  @override
  Map<String, Alignment>? get beginAlignments {
    final value = _beginAlignments;
    if (value == null) return null;
    if (_beginAlignments is EqualUnmodifiableMapView) return _beginAlignments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, Alignment>? _endAlignments;
  @override
  Map<String, Alignment>? get endAlignments {
    final value = _endAlignments;
    if (value == null) return null;
    if (_endAlignments is EqualUnmodifiableMapView) return _endAlignments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SettingsBuildable(settings: $settings, settingType: $settingType, gradientState: $gradientState, beginAlignments: $beginAlignments, endAlignments: $endAlignments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsBuildableImpl &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.settingType, settingType) ||
                other.settingType == settingType) &&
            (identical(other.gradientState, gradientState) ||
                other.gradientState == gradientState) &&
            const DeepCollectionEquality()
                .equals(other._beginAlignments, _beginAlignments) &&
            const DeepCollectionEquality()
                .equals(other._endAlignments, _endAlignments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      settings,
      settingType,
      gradientState,
      const DeepCollectionEquality().hash(_beginAlignments),
      const DeepCollectionEquality().hash(_endAlignments));

  /// Create a copy of SettingsBuildable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsBuildableImplCopyWith<_$SettingsBuildableImpl> get copyWith =>
      __$$SettingsBuildableImplCopyWithImpl<_$SettingsBuildableImpl>(
          this, _$identity);
}

abstract class _SettingsBuildable implements SettingsBuildable {
  const factory _SettingsBuildable(
      {final BackgroundSettings? settings,
      final SettingType settingType,
      final bool gradientState,
      final Map<String, Alignment>? beginAlignments,
      final Map<String, Alignment>? endAlignments}) = _$SettingsBuildableImpl;

  @override
  BackgroundSettings? get settings;
  @override
  SettingType get settingType;
  @override
  bool get gradientState;
  @override
  Map<String, Alignment>? get beginAlignments;
  @override
  Map<String, Alignment>? get endAlignments;

  /// Create a copy of SettingsBuildable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsBuildableImplCopyWith<_$SettingsBuildableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsListenable {}

/// @nodoc
abstract class $SettingsListenableCopyWith<$Res> {
  factory $SettingsListenableCopyWith(
          SettingsListenable value, $Res Function(SettingsListenable) then) =
      _$SettingsListenableCopyWithImpl<$Res, SettingsListenable>;
}

/// @nodoc
class _$SettingsListenableCopyWithImpl<$Res, $Val extends SettingsListenable>
    implements $SettingsListenableCopyWith<$Res> {
  _$SettingsListenableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsListenable
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SettingsListenableImplCopyWith<$Res> {
  factory _$$SettingsListenableImplCopyWith(_$SettingsListenableImpl value,
          $Res Function(_$SettingsListenableImpl) then) =
      __$$SettingsListenableImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsListenableImplCopyWithImpl<$Res>
    extends _$SettingsListenableCopyWithImpl<$Res, _$SettingsListenableImpl>
    implements _$$SettingsListenableImplCopyWith<$Res> {
  __$$SettingsListenableImplCopyWithImpl(_$SettingsListenableImpl _value,
      $Res Function(_$SettingsListenableImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsListenable
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SettingsListenableImpl implements _SettingsListenable {
  const _$SettingsListenableImpl();

  @override
  String toString() {
    return 'SettingsListenable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsListenableImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _SettingsListenable implements SettingsListenable {
  const factory _SettingsListenable() = _$SettingsListenableImpl;
}
