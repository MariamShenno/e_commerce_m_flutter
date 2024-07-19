import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_visibility_state.dart';

class LogInPasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  LogInPasswordVisibilityCubit()
      : super(const PasswordVisibilityInitial(true));

  void togglePasswordVisibility() {
    emit(PasswordVisibilityInitial(!state.isHidden));
  }
}

class SigUpPasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  SigUpPasswordVisibilityCubit()
      : super(const PasswordVisibilityInitial(true));

  void togglePasswordVisibility() {
    emit(PasswordVisibilityInitial(!state.isHidden));
  }
}

class NewPassVisibilityCubit extends Cubit<PasswordVisibilityState> {
  NewPassVisibilityCubit() : super(const PasswordVisibilityInitial(false));

  void togglePasswordVisibility() {
    emit(PasswordVisibilityInitial(!state.isHidden));
  }
}

class ConfirmPassVisibilityCubit extends Cubit<PasswordVisibilityState> {
  ConfirmPassVisibilityCubit() : super(const PasswordVisibilityInitial(false));

  void togglePasswordVisibility() {
    emit(PasswordVisibilityInitial(!state.isHidden));
  }
}
