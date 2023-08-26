import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:repo_list/style/app_colors.dart';

class CustomList extends StatelessWidget {
  final double? height;
  final double? width;
  final Axis scrollDirection;
  final Function(int index) onBuildItem;
  final bool isLoading;
  final bool firstLoadingScreen;
  final int count;
  final Widget? header;
  final Widget? footer;
  final double bottomSpace;
  final void Function()? onEndOfPage;
  final void Function()? onPullToRefresh;
  final Widget? emptyListMessage;
  final ScrollPhysics? physics;
  final bool primary;
  final bool useFade;
  final bool bottomUseFade;
  final EdgeInsetsGeometry? padding;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const CustomList({
    this.height,
    this.scrollDirection = Axis.vertical,
    required this.count,
    required this.onBuildItem,
    Key? key,
    this.isLoading = false,
    this.header,
    this.footer,
    this.bottomSpace = 130,
    this.width,
    this.onEndOfPage,
    this.onPullToRefresh,
    this.firstLoadingScreen = false,
    this.emptyListMessage,
    this.physics,
    this.primary = true,
    this.useFade = false,
    this.bottomUseFade = false,
    this.padding,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: body(),
    );
  }

  Widget body() {
    if (firstLoadingScreen && isLoading) {
      return loadingPanel();
    } else {
      return useFade ? shader() : content();
    }
  }

  Widget loadingPanel() {
    return const Center(
      child: CupertinoActivityIndicator(
        color: AppColors.divider,
      ),
    );
  }

  Widget shader() {
    return ShaderMask(
      blendMode: BlendMode.dstOut,
      shaderCallback: (Rect rect) {
        return LinearGradient(
          begin: bottomUseFade ? Alignment.topCenter : Alignment.centerLeft,
          end: bottomUseFade ? Alignment.bottomCenter : Alignment.centerRight,
          colors: [
            Colors.transparent,
            Colors.white.withOpacity(.9),
          ],
          stops: const [.7, 1],
        ).createShader(rect);
      },
      child: content(),
    );
  }

  Widget content() {
    return LazyLoadScrollView(
      onEndOfPage: onEndOfPage == null ? () {} : onEndOfPage!,
      isLoading: isLoading,
      scrollDirection: scrollDirection,
      child: RefreshIndicator(
        onRefresh: () async =>
            onPullToRefresh == null ? () {} : onPullToRefresh!(),
        child: ListView.builder(
          keyboardDismissBehavior: keyboardDismissBehavior,
          padding: padding,
          scrollDirection: scrollDirection,
          itemCount: itemCount,
          shrinkWrap: true,
          physics: physics,
          primary: primary,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0 && header != null) {
              return header!;
            }
            if (showEmpty) {
              return emptyListMessage!;
            }
            if (index == itemCount - 1 && footer != null) {
              return footer!;
            }

            return onBuildItem(index);
          },
        ),
      ),
    );
  }

  bool get showEmpty => emptyListMessage != null && !isLoading && count == 0;

  int get itemCount =>
      count +
      (header == null || showEmpty ? 0 : 1) +
      (footer == null || showEmpty ? 0 : 1) +
      (showEmpty ? 1 : 0);
}
