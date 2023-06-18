import 'package:freezed_annotation/freezed_annotation.dart';

import '../credit//credit_model.dart';
part 'order_detail_model.freezed.dart';
part 'order_detail_model.g.dart';

typedef OrderDetailPulsaList = List<OrderDetailPulsa>;

@freezed
class OrderDetailPulsa with _$OrderDetailPulsa {
  factory OrderDetailPulsa({
    required Credit credit,
    required String number_phone,
  }) = _OrderDetailPulsa;

  factory OrderDetailPulsa.fromJson(Map<String, Object?> json) =>
      _$OrderDetailPulsaFromJson(json);
}
