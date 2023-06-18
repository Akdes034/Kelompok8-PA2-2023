// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      id: json['id'] as int,
      code: json['code'] as String,
      total: (json['total'] as num).toDouble(),
      description: json['description'] as String? ?? '-',
      paymentMethod: json['paymentMethod'] as String,
      orderDetails: (json['orderDetails'] as List<dynamic>)
          .map((e) => OrderDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
          orderDetailsPulsa: (json['orderDetailsPulsa'] as List<dynamic>)
              .map((e) => OrderDetailPulsa.fromJson(e as Map<String, dynamic>))
              .toList(),
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      bukti_pembayaran: json['bukti_pembayaran'] as String,
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'total': instance.total,
      'description': instance.description,
      'paymentMethod': instance.paymentMethod,
      'orderDetails': instance.orderDetails,
          'orderDetailsPulsa': instance.orderDetailsPulsa,
          'status': instance.status,
      'createdAt': instance.createdAt,
      'bukti_pembayaran': instance.bukti_pembayaran,
    };
