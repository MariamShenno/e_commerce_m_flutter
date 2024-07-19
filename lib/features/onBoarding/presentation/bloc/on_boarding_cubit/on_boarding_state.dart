part of 'on_boarding_cubit.dart';

sealed class OnBoardingState extends Equatable {
  
  final List<OnBoardingEntity>? onBoardingList;
  const  OnBoardingState({this.onBoardingList});

  @override
  List<Object> get props => [onBoardingList!];
}

final class OnBoardingInitial extends OnBoardingState {}

final class OnBoardingListState extends OnBoardingState{
  const OnBoardingListState(List <OnBoardingEntity> ? onBoardingList)
  :super (onBoardingList: onBoardingList);
}
