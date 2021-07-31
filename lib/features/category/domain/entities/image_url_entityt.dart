import 'package:equatable/equatable.dart';

class ImageUrlEntity extends Equatable {
  final String? imageUrlDefault;
  final String? thumbnail;

  const ImageUrlEntity({this.imageUrlDefault, this.thumbnail});

  factory ImageUrlEntity.fromJson(Map<String, dynamic> json) => ImageUrlEntity(
        imageUrlDefault: json['default'] as String?,
        thumbnail: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'default': imageUrlDefault,
        'thumbnail': thumbnail,
      };

  ImageUrlEntity copyWith({
    String? imageUrlDefault,
    String? thumbnail,
  }) {
    return ImageUrlEntity(
      imageUrlDefault: imageUrlDefault ?? this.imageUrlDefault,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [imageUrlDefault, thumbnail];
}
