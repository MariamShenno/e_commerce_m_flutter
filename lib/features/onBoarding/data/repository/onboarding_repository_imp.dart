import '../../domain/repository/onboarding_repository.dart';
import '../datasource/static/onboarding_local_data.dart';
import '../model/onboarding_model.dart';

class OnBoardingRepositoryImp implements OnBoardingRepository {
  final OnBoardingLocalData _onBoardingLocalData;

  OnBoardingRepositoryImp({required OnBoardingLocalData onBoardingLocalData})
      : _onBoardingLocalData = onBoardingLocalData;

  @override
  List<OnBoardingModel> getOnboarding() {
    return _onBoardingLocalData.getOnboardingList();
  }
}
