import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fertigation/models/review_item_model.dart';
import 'package:fertigation/repository/review_repository.dart';
import 'package:fertigation/utils/enums.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  List<ReviewItemModel> simultaneousList = [];
  List<ReviewItemModel> sequentialList = [];

  ReviewRepository reviewRepository;
  ReviewsBloc(this.reviewRepository) : super(const ReviewsState()) {
    on<FetchSequentialListEvent>(_fetchSequentialList);
    on<FetchSimultaneousListEvent>(_fetchSimultaneousList);
  }
  void _fetchSequentialList(
      FetchSequentialListEvent event, Emitter<ReviewsState> emit) async {
    emit(
      state.copyWith(
        listStatus: Status.loading,
      ),
    );
    sequentialList = await reviewRepository.fetchSequentialItems();
    emit(
      state.copyWith(
        sequentialList: List.from(sequentialList),
        listStatus: Status.completed,
      ),
    );
  }

  void _fetchSimultaneousList(
      FetchSimultaneousListEvent event, Emitter<ReviewsState> emit) async {
    emit(
      state.copyWith(
        listStatus: Status.loading,
      ),
    );
    simultaneousList = await reviewRepository.fetchSimultaneousItems();
    emit(
      state.copyWith(
        simultaneousList: List.from(simultaneousList),
        listStatus: Status.completed,
      ),
    );
  }
}
