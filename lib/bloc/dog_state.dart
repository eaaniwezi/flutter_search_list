part of 'dog_bloc.dart';

abstract class DogState extends Equatable {
  const DogState();

  @override
  List<Object> get props => [];
}

class DogInitialState extends DogState {}

class DogLoadingState extends DogState {}

class DogLoadedState extends DogState {
  final List<DogModel> dogList;
  const DogLoadedState({
    required this.dogList,
  });
}

class DogErrorState extends DogState {
  final String error;

  const DogErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
