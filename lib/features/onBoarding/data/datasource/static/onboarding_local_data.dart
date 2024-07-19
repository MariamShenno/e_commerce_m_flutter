import 'package:e_commerce_m_flutter/features/onBoarding/data/model/onboarding_model.dart';
import '../../../../../common/utils/constants/image_strings.dart';


abstract interface class OnBoardingLocalData {
  List<OnBoardingModel> getOnboardingList();
}

class OnBoardingLocalDataImp implements OnBoardingLocalData {
  const OnBoardingLocalDataImp();

  @override
  List<OnBoardingModel> getOnboardingList() {
    final List<OnBoardingModel> onBoardingList = [
      const OnBoardingModel(
        title: "onBoardingTitle1",
        description: "onBoardingSubTitle1",
        images: MImages.onBoardingImage1,
      ),
      const OnBoardingModel(
        title: "onBoardingTitle2",
        description: "onBoardingSubTitle2",
        images: MImages.onBoardingImage2,
      ),
      const OnBoardingModel(
        title: "onBoardingTitle3",
        description: "onBoardingSubTitle3",
        images: MImages.onBoardingImage3,
      ),
    ];
    return onBoardingList;
  }
}
