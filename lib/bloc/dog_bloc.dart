// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_search_list/models/dog_model.dart';
import 'package:flutter_search_list/repositories/dog_repository.dart';
import 'package:logger/logger.dart';

part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  DogRepository dogRepository;
  DogBloc({
    required this.dogRepository,
    required DogState initialState,
  }) : super(initialState) {
    add(InitialEvent());
  }
  @override
  Stream<DogState> mapEventToState(DogEvent event) async* {
    if (event is InitialEvent) {
      try {
        late final List<DogModel> _dogList;
        yield DogLoadingState();
        _dogList = await dogRepository.fetchDogs("");
        yield DogLoadedState(dogList: _dogList);
      } catch (e) {
        yield DogErrorState(error: "Error fetching dog List");
      }
    }
    if (event is SearchEvent) {
      try {
        late final List<DogModel> _dogList;
        yield DogLoadingState();
        _dogList = await dogRepository.fetchDogs(event.query.toString());
        yield DogLoadedState(dogList: _dogList);
      } catch (e) {
        yield DogErrorState(error: "Error searching for this dog ");
      }
    }
  }
}
