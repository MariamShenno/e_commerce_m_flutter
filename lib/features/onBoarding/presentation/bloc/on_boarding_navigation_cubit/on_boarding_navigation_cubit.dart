import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_navigation_state.dart';

class OnBoardingNavigationCubit extends Cubit<OnBoardingNavigationState> {
  OnBoardingNavigationCubit() : super(const OnBoardingNavigationInitial(0));

  void onPageChanged(int currentPage) {
    emit(OnBoardingNavigationInitial(currentPage));
  }
}
