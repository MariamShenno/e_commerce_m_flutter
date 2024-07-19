part of 'password_visibility_cubit.dart';

sealed class PasswordVisibilityState extends Equatable {
  const PasswordVisibilityState({ required this.isHidden});
  final bool isHidden;

  @override
  List<Object> get props => [isHidden];
}

final class PasswordVisibilityInitial extends PasswordVisibilityState {
  const PasswordVisibilityInitial(bool isHidden) : super(isHidden: isHidden);
}

