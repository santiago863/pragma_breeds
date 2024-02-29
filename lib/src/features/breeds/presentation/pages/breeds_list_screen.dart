import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_breeds/src/features/breeds/presentation/widgets/loading_widget.dart';

import '../../../../core/colors.dart';
import '../providers/breeds_provider.dart';
import '../widgets/breed_card_widget.dart';
import '../widgets/search_widget.dart';

@RoutePage()
class BreedsListScreen extends ConsumerWidget {
  const BreedsListScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final notifier = ref.read(breedsProvider.notifier);
    final state = ref.watch(breedsProvider);

    notifier.getBreeds(context);

    return Stack(
      children: [
        Scaffold(
          appBar: SearchWidget(
            query: state.query,
            onChanged: notifier.searchBreeds,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (state.filterBreeds.isEmpty)
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const Text(
                            'No breeds found...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: notifier.restarSearch,
                            child: const Text(
                              'Restart Search,',
                            ),
                          ),
                        ],
                      ),
                    ),
                  for (var breed in state.filterBreeds)
                    BreedCardWidget(
                      breed: breed,
                    ),
                ],
              ),
            ),
          ),
        ),
        if (state.loading) const LoadingWidget(),
      ],
    );
  }
}
