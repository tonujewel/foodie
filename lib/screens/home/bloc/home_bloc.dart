import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodie/data/model/restaurant_dm.dart';
import 'package:foodie/data/repository/restaurant_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RestaurantRepository _repository;

  HomeBloc(this._repository) : super(HomeLoadingState()) {
    on<LoadRestaurantDataEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final restaurantData = await _repository.getJoke();
        emit(HomeLoadedState(restaurantData.result?.data ?? []));
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    });
  }
}
