import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_event.freezed.dart';

@freezed
abstract class HomeGuestEvent with _$HomeGuestEvent {
  const factory HomeGuestEvent.getData(String search) = GetDataEvent;
}
