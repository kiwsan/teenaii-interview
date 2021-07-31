import 'package:equatable/equatable.dart';

class BaseEntity<T> extends Equatable {
  final List? data;
  final bool? success;

  const BaseEntity({this.data, this.success});

  factory BaseEntity.fromJson(Map<String, dynamic> json) {
    return BaseEntity(
      data: json['data'] as List?,
      success: json['success'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data,
        'success': success,
      };

  BaseEntity copyWith({
    List? data,
    bool? success,
  }) {
    return BaseEntity(
      data: data ?? this.data,
      success: success ?? this.success,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [data, success];
  }
}
