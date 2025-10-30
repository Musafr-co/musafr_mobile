import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musafr/core/view/color/color.dart';
import 'package:musafr/feature/chat/framework/chat_list/chat_list_screen.dart';
import 'package:musafr/feature/home/framework/main/viewModel/landing_screen_cubit.dart';
import 'package:musafr/feature/home/framework/main/viewModel/main_screen_state.dart';
import 'package:musafr/feature/user/view/user_top_bar/view_modal/logged_in_user_cubit.dart';

import '../../../../core/view/ui_state/ui_state.dart';
import '../../../../core/view/widgets/dialogs/loading/loading_dialog.dart';
import '../../../user/domain/use_case/get_current_user_use_case.dart';
import '../../../user/view/user_top_bar/view_modal/logged_in_user_state.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoggedInUserCubit>(
          create:
              (BuildContext context) =>
                  LoggedInUserCubit(context.read<GetCurrentUserUseCase>()),
        ),
        BlocProvider<LandingScreenCubit>(
          create: (BuildContext context) => LandingScreenCubit(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          LoadingDialogListener<LoggedInUserCubit, LoggedInUserState>(
            isLoading: (s) {
              return s.currentUser is UiLoading;
            },
            loadingBuilder:
                (_) => const Center(child: CircularProgressIndicator()),
          ),
        ],
        child: BlocSelector<LandingScreenCubit, LandingScreenState, int>(
          selector: (state) => state.currentSelectedTab,
          builder: (context, currentIndex) {
            return LandingScreenView(currentIndex);
          },
        ),
      ),
    );
  }
}

class LandingScreenView extends StatefulWidget {
  final int currentIndex;

  const LandingScreenView(this.currentIndex, {super.key});

  @override
  State<LandingScreenView> createState() => _LandingScreenViewState();
}

class _LandingScreenViewState extends State<LandingScreenView> {
  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  Widget _buildNavigator(int index, Widget child) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) => child);
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoggedInUserCubit>().getUserInformation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          _navigatorKeys[widget.currentIndex].currentState?.pop();
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: whiteColor,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Bag',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/ticket-expired.svg",
                semanticsLabel: 'Referral Text',
                colorFilter:
                    widget.currentIndex == 2
                        ? ColorFilter.mode(
                          primaryColor, // your desired color
                          BlendMode
                              .srcIn, // ensures it only paints where the svg has non-transparent pixels
                        )
                        : null,
              ),
              label: 'Bookings',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.contact_support_outlined),
              label: 'Support',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Account',
            ),
          ],
          currentIndex: widget.currentIndex,
          onTap: (index) {
            if (index == widget.currentIndex) {
              // Pop to first route if the user taps the tab again
              _navigatorKeys[index].currentState?.popUntil((r) => r.isFirst);
            } else {
              context.read<LandingScreenCubit>().updateCurrentSelectedTab(
                index,
              );
            }
          },
          type: BottomNavigationBarType.fixed,
        ),
        body: IndexedStack(
          index: widget.currentIndex,
          children: [
            _buildNavigator(0, const ChatListScreen()),
            _buildNavigator(1, const Placeholder()),
            _buildNavigator(2, const Placeholder()),
            _buildNavigator(3, const Placeholder()),
            _buildNavigator(4, const Placeholder()),
          ],
        ),
      ),
    );
  }
}
