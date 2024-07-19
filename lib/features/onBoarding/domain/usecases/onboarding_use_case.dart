import 'package:e_commerce_m_flutter/features/onBoarding/domain/entities/entity_onboarding.dart';
import 'package:e_commerce_m_flutter/features/onBoarding/domain/repository/onboarding_repository.dart';

class OnboardingUseCase {
  final OnBoardingRepository _onBoardingRepository;

  OnboardingUseCase({
    required OnBoardingRepository onBoardingRepository,
  }) : _onBoardingRepository = onBoardingRepository;

  List<OnBoardingEntity> call() {
    return _onBoardingRepository.getOnboarding();
  }
}
