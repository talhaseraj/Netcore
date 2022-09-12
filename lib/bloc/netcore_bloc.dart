import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'netcore_event.dart';
part 'netcore_state.dart';

class NetcoreBloc extends Bloc<NetcoreEvent, NetcoreState> {
  NetcoreBloc() : super(NetcoreInitial()) {
    on<NetcoreEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
