import 'package:equatable/equatable.dart';

import 'address_entity.dart';

class PostEntity extends Equatable {
  final String? id;
  final String? title;
  final String? imageUrl;
  final String? userId;
  final String? userName;
  final String? userImage;
  final int? rating;
  final int? price;
  final AddressEntity? address;
  final String? distance;
  final bool? userVerify;
  final String? createAt;
  final String? updatedAt;

  const PostEntity({
    this.id,
    this.title,
    this.imageUrl,
    this.userId,
    this.userName,
    this.userImage,
    this.rating,
    this.price,
    this.address,
    this.distance,
    this.userVerify,
    this.createAt,
    this.updatedAt,
  });

  factory PostEntity.fromJson(Map<String, dynamic> json) => PostEntity(
        id: json['id'] as String?,
        title: json['title'] as String?,
        imageUrl: json['imageUrl'] as String?,
        userId: json['userID'] as String?,
        userName: json['userName'] as String?,
        userImage: json['userImage'] as String?,
        rating: json['rating'] as int?,
        price: json['price'] as int?,
        address: json['address'] == null
            ? null
            : AddressEntity.fromJson(json['address'] as Map<String, dynamic>),
        distance: json['distance'] as String?,
        userVerify: json['userVerify'] as bool?,
        createAt: json['createAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'imageUrl': imageUrl,
        'userID': userId,
        'userName': userName,
        'userImage': userImage,
        'rating': rating,
        'price': price,
        'address': address?.toJson(),
        'distance': distance,
        'userVerify': userVerify,
        'createAt': createAt,
        'updatedAt': updatedAt,
      };

  PostEntity copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? userId,
    String? userName,
    String? userImage,
    int? rating,
    int? price,
    AddressEntity? address,
    String? distance,
    bool? userVerify,
    String? createAt,
    String? updatedAt,
  }) {
    return PostEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      address: address ?? this.address,
      distance: distance ?? this.distance,
      userVerify: userVerify ?? this.userVerify,
      createAt: createAt ?? this.createAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      imageUrl,
      userId,
      userName,
      userImage,
      rating,
      price,
      address,
      distance,
      userVerify,
      createAt,
      updatedAt,
    ];
  }
}
