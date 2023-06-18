// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDetailPulsa _$$_OrderDetailPulsaFromJson(Map<String, dynamic> json) =>
    _$_OrderDetailPulsa(
      credit: Credit.fromJson(json['credit'] as Map<String, dynamic>),
      number_phone: json['number_phone'] as String,
    );

Map<String, dynamic> _$$_OrderDetailPulsaToJson(_$_OrderDetailPulsa instance) =>
    <String, dynamic>{
      'credit': instance.credit,
      'number_phone': instance.number_phone,
    };
