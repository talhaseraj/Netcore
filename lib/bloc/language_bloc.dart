import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netcore/models/api_model.dart';

import '../repository/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetLanguageList>((event, emit) async {
      try {
        emit(LanguageLoading());
        final mList = await _apiRepository.fetchLanguagesList();
        emit(LanguageLoaded(mList[0]));
        if (mList[0]==null) {
          emit(const LanguageError("Error"));
        }
      } on NetworkError {
        emit(const LanguageError("Failed to fetch data. is your device online?"));
      }
    });
  }
}