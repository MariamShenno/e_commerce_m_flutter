import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageIndicatorCubit extends Cubit<int> {
  HomePageIndicatorCubit() : super(0);

  void updatePageIndicator(int index) {
    emit(index);
  }
}
