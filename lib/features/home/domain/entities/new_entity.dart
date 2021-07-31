import 'package:equatable/equatable.dart';

class NewEntity extends Equatable {
  final String? url;
  final String? imageUrl;

  const NewEntity({this.url, this.imageUrl});

  factory NewEntity.fromJson(Map<String, dynamic> json) => NewEntity(
        url: json['url'] as String?,
        imageUrl: json['imageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'imageUrl': imageUrl,
      };

  NewEntity copyWith({
    String? url,
    String? imageUrl,
  }) {
    return NewEntity(
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, imageUrl];
}
