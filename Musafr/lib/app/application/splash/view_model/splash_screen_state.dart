

class SplashState {
  final double topPosition;
  final double opacity;
  final double height;
  final bool shouldShowSignIn;
  final bool shouldMoveToHome;

  const SplashState({
    this.topPosition = 0,
    this.opacity = 0,
    this.height = 0,
    this.shouldShowSignIn = false,
    this.shouldMoveToHome = false,
  });

  SplashState copyWith({
    double? topPosition,
    double? opacity,
    double? height,
    bool? shouldShowSignIn,
    bool? shouldMoveToHome,
  }) {
    return SplashState(
      topPosition: topPosition ?? this.topPosition,
      opacity: opacity ?? this.opacity,
      height: height ?? this.height,
      shouldShowSignIn: shouldShowSignIn ?? this.shouldShowSignIn,
      shouldMoveToHome: shouldMoveToHome ?? this.shouldMoveToHome,
    );
  }
}
