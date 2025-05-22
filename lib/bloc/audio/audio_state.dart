part of 'audio_bloc.dart';

@freezed
class AudioState with _$AudioState {
  const factory AudioState.initial() = _Initial;
  const factory AudioState.loading() = _Loading;
  const factory AudioState.loaded(List<AudioResponseModel> model) = _Loaded;
  const factory AudioState.error(String message) = _Error;
}
