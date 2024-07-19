import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarCubit extends Cubit<int>{
  NavigationBarCubit() : super(0);

  void selectIndex(int index) => emit(index);

}