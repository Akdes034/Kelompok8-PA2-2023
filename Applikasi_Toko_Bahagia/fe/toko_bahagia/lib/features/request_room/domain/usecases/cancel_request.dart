import 'package:dartz/dartz.dart';
import 'package:delshop/core/failure.dart';
import 'package:delshop/core/service_locator.dart';
import 'package:delshop/features/request_room/data/models/request_room/request_room_model.dart';

import '../repository/request_room_repository.dart';

class CancelRequestUseCase {
  Future<Either<Failure, String>> cancelRequest(RequestRoom requestRoom) {
    return serviceLocator<RequestRoomRepository>().cancelRequest(requestRoom);
  }
}
