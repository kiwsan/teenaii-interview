import 'package:equatable/equatable.dart';

class SubCategoriesEntity extends Equatable {
  final String? id;
  final String? name;

  const SubCategoriesEntity({this.id, this.name});

  factory SubCategoriesEntity.fromJson(Map<String, dynamic> json) =>
      SubCategoriesEntity(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  SubCategoriesEntity copyWith({
    String? id,
    String? name,
  }) {
    return SubCategoriesEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name];
}
