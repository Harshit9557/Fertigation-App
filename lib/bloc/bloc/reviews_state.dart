part of 'reviews_bloc.dart';

class ReviewsState extends Equatable {
  const ReviewsState({
    this.sequentialList = const [],
    this.simultaneousList = const [],
    this.listStatus = Status.loading,
  });
  final List<ReviewItemModel> sequentialList;
  final List<ReviewItemModel> simultaneousList;
  final Status listStatus;

  ReviewsState copyWith({
    List<ReviewItemModel>? sequentialList,
    List<ReviewItemModel>? simultaneousList,
    Status? listStatus,
  }) {
    return ReviewsState(
      sequentialList: sequentialList ?? this.sequentialList,
      simultaneousList: simultaneousList ?? this.simultaneousList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object> get props => [sequentialList, simultaneousList, listStatus];
}
