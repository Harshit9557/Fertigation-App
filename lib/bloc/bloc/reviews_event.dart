part of 'reviews_bloc.dart';

sealed class ReviewsEvent extends Equatable {
  const ReviewsEvent();

  @override
  List<Object> get props => [];
}

class FetchSimultaneousListEvent extends ReviewsEvent {}

class FetchSequentialListEvent extends ReviewsEvent {}
