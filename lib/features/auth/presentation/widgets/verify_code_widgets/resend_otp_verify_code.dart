import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:e_commerce_m_flutter/common/widgets/m_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/utils/constants/colors.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/timer/timer_cubit.dart';

class ResendOtp extends StatelessWidget {
  final String email;

  const ResendOtp({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final authState = context.watch<AuthBloc>().state;
      final timeState = context.watch<TimerCubit>().state;
      return TextButton(
        onPressed: timeState == 0
            ? () {
                context.read<AuthBloc>().add(AuthResendCodeEvent(email: email));
                context.read<TimerCubit>().startTimer();
              }
            : null,
        child: authState is AuthVerifyCodeLoading
            ? const MLoader()
            :  Text(
                "Didn'treceiveOTP?ResendOTP".tr(context),
                style: const TextStyle(
                  color: MColors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
      );
    });
  }
}
