import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/entity_onboarding.dart';
import '../../../domain/usecases/onboarding_use_case.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final OnboardingUseCase _onboardingUseCase;
  OnBoardingCubit({required OnboardingUseCase onboardingUseCase})
      : _onboardingUseCase = onboardingUseCase,
        super(OnBoardingInitial());

  void getOnBoardingList() {
    final response = _onboardingUseCase();
    emit(OnBoardingListState(response));
  }
}
