import 'package:app/bloc/light_event.dart';
import 'package:app/bloc/light_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LightBloc extends Bloc<LightEvent, LightState> {
  LightBloc() : super(LightState(isOn: false)) {
    on<ToggleLightEvent>((event, emit) {
      emit(LightState(isOn: !state.isOn));
    });
  }
}
