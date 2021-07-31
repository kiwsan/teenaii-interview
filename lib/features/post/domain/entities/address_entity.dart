import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String? province;
  final String? district;

  const AddressEntity({this.province, this.district});

  factory AddressEntity.fromJson(Map<String, dynamic> json) => AddressEntity(
        province: json['province'] as String?,
        district: json['district'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'province': province,
        'district': district,
      };

  AddressEntity copyWith({
    String? province,
    String? district,
  }) {
    return AddressEntity(
      province: province ?? this.province,
      district: district ?? this.district,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [province, district];
}
