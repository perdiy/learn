part of 'audio_bloc.dart';

@freezed
class AudioEvent with _$AudioEvent {
  const factory AudioEvent.started() = _Started;
  const factory AudioEvent.get() = _Get;
}
