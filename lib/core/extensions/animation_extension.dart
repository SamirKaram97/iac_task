import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';

extension AnimationExtension on Widget {
  Widget animateFadeIn({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) => FadeIn(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );
  Widget animateFadeInUp({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) => FadeInUp(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateBounce({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      Bounce(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateFadeOut({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      FadeOut(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateSlideInUp({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      SlideInUp(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateSlideInDown({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      SlideInDown(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateSlideInLeft({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      SlideInLeft(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateSlideInRight({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      SlideInRight(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateZoomIn({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      ZoomIn(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateZoomOut({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      ZoomOut(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateBounceInUP({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
    double from = 75,
  }) =>
      BounceInUp(
        from: from,
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateBounceInDown({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      BounceInDown(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateBounceInLeft({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      BounceInLeft(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateBounceInRight({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      BounceInRight(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateFlipInX({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      FlipInX(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateFlipInY({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      FlipInY(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animateJelloIn({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      JelloIn(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );

  Widget animatePulse({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      Pulse(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );


  Widget animateShakeX({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      ShakeX(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );
  Widget animateShakeY({
    int? milliseconds,
    dynamic Function(AnimateDoDirection)? onFinish,
    bool? animate,
    AnimationController? controller,
  }) =>
      ShakeY(
        duration: Duration(milliseconds: milliseconds ?? 500),
        controller: (ctrl) => controller = ctrl,
        animate: animate ?? true,
        onFinish: onFinish,
        child: this,
      );
}
