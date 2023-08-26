// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirestoreUser _$$_FirestoreUserFromJson(Map<String, dynamic> json) =>
    _$_FirestoreUser(
      createsAt: json['createsAt'],
      updateAt: json['updateAt'],
      email: json['email'] as String,
      uid: json['uid'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$$_FirestoreUserToJson(_$_FirestoreUser instance) =>
    <String, dynamic>{
      'createsAt': instance.createsAt,
      'updateAt': instance.updateAt,
      'email': instance.email,
      'uid': instance.uid,
      'userName': instance.userName,
    };
