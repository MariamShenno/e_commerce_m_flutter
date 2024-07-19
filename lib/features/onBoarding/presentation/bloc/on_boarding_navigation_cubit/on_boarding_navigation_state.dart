part of 'on_boarding_navigation_cubit.dart';

sealed class OnBoardingNavigationState extends Equatable {
  const OnBoardingNavigationState({this.currentPage});
  final int? currentPage;
  @override
  List<Object> get props => [currentPage!];
}

final class OnBoardingNavigationInitial extends OnBoardingNavigationState {
  const  OnBoardingNavigationInitial (int currentPage) : super(currentPage: currentPage);
}
