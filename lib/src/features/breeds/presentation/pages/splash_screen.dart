import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_breeds/src/core/colors.dart';
import 'package:pragma_breeds/src/features/breeds/presentation/providers/breeds_provider.dart';

import '../../../../core/images.dart';

@RoutePage()
class SplashScreen extends ConsumerWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    ref.read(breedsProvider.notifier).init(context);
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.logo,
          ),
        ],
      ),
    );
  }
}
