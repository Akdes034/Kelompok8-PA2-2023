import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/products/product_model.dart';
part 'home_state.freezed.dart';

@freezed
abstract class HomeGuestState with _$HomeGuestState {
  const factory HomeGuestState.initial() = HomeInitialState;
  const factory HomeGuestState.loading() = HomeLoadingState;
  const factory HomeGuestState.error(String message) = HomeErrorState;
  const factory HomeGuestState.loadedState({
    required ProductList productList,
  }) = HomeLoadedState;
}
