import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musafr/app/application/splash/view_model/splash_screen_cubit.dart';
import 'package:musafr/app/application/splash/view_model/splash_screen_state.dart';
import 'package:musafr/feature/user/domain/use_case/get_current_user_use_case.dart';

import '../../../core/view/color/color.dart';
import '../../../feature/authentication/view/signIn/sign_in_screen.dart';
import '../../../feature/home/framework/main/landing_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context.read<GetCurrentUserUseCase>()),
      child: const SplashScreenView(),
    );
  }
}

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<SplashCubit>();
      cubit.setHeight(MediaQuery.of(context).size.height);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashCubit, SplashState>(
          listenWhen:
              (previous, current) =>
                  current.shouldShowSignIn && !previous.shouldShowSignIn,
          listener: (context, state) {
            if (state.shouldShowSignIn) {
              showSignInSheet(context);
              context.read<SplashCubit>().resetSignInTrigger();
            }
          },
        ),
        BlocListener<SplashCubit, SplashState>(
          listenWhen:
              (previous, current) =>
                  current.shouldMoveToHome && !previous.shouldMoveToHome,
          listener: (context, state) {
            if (state.shouldMoveToHome) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LandingScreen()),
                    (destination) => false,
              );
              context.read<SplashCubit>().resetMoveToHome();
            }
          },
        ),
      ],
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: primaryColor,
            body: Container(
              color: primaryColor,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                    top:
                        MediaQuery.of(context).size.height / 2 +
                        state.topPosition,
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.passthrough,
                      children: [
                        SvgPicture.asset(
                          state.opacity < 1
                              ? 'assets/icons/app_icon.svg'
                              : 'assets/icons/app_icon_dark.svg',
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 120, 16, 16),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: state.opacity,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        // child: SignInPhoneNumberScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
