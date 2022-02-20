part of 'dog_bloc.dart';

abstract class DogEvent extends Equatable {
  const DogEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends DogEvent {}

class SearchEvent extends DogEvent {
  final String? query;
  const SearchEvent({
    this.query,
  });
}
