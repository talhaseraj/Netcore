part of 'language_bloc.dart';

@immutable
abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object?> get props => [];
}

class LanguageInitial extends LanguageState {}

class LanguageLoading extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final ApiResponseModel apiResponseModel;
  const LanguageLoaded(this.apiResponseModel);
}

class LanguageError extends LanguageState {
  final String? message;
  const LanguageError(this.message);
}