import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service_locator.dart';
import '../../domain/usercases/get_products.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeGuestBloc extends Bloc<HomeGuestEvent, HomeGuestState> {
  HomeGuestBloc() : super(const HomeInitialState()) {
    on<GetDataEvent>(
      (event, emit) async {

        var result = await serviceLocator<GetProductsGuestFromServer>()
            .getProductsFromServer(event.search);
        result.fold(
          (failure) {
            emit(HomeGuestState.error(failure.message));
          },
          (data) {
            emit(
              HomeGuestState.loadedState(
                productList: data,
              ),
            );
          },
        );
      },
    );
  }
}
