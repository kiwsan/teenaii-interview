import 'package:equatable/equatable.dart';

import 'image_url_entityt.dart';
import 'sub_categories_entity.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final ImageUrlEntity? imageUrl;
  final String? icon;
  final String? thumbnail;
  final List<SubCategoriesEntity>? subCategories;

  const CategoryEntity({
    required this.id,
    required this.name,
    this.imageUrl,
    this.icon,
    this.thumbnail,
    this.subCategories,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => CategoryEntity(
        id: json['id'] as String,
        name: json['name'] as String,
        imageUrl: json['imageUrl'] == null
            ? null
            : ImageUrlEntity.fromJson(json['imageUrl'] as Map<String, dynamic>),
        icon: json['icon'] as String?,
        thumbnail: json['thumbnail'] as String?,
        subCategories: (json['subCategories'] as List<dynamic>?)
            ?.map(
                (e) => SubCategoriesEntity.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl?.toJson(),
        'icon': icon,
        'thumbnail': thumbnail,
        'subCategories': subCategories?.map((e) => e.toJson()).toList(),
      };

  CategoryEntity copyWith({
    String? id,
    String? name,
    ImageUrlEntity? imageUrl,
    String? icon,
    String? thumbnail,
    List<SubCategoriesEntity>? subCategories,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      icon: icon ?? this.icon,
      thumbnail: thumbnail ?? this.thumbnail,
      subCategories: subCategories ?? this.subCategories,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      imageUrl,
      icon,
      thumbnail,
      subCategories,
    ];
  }
}
