import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pragma_breeds/src/core/colors.dart';
import 'package:pragma_breeds/src/core/router/router.dart';
import 'package:pragma_breeds/src/features/breeds/presentation/widgets/breed_image_widget.dart';

import '../../domain/models/breed.dart';

class BreedCardWidget extends StatelessWidget {
  final Breed breed;

  const BreedCardWidget({
    super.key,
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    breed.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    'More...',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BreedImageWidget(
                reference: breed.referenceImageId,
                size: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    breed.origin,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    'Intelligence: ${breed.intelligence}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(
    BuildContext context,
  ) {
    context.router.push(
      BreedDetailRoute(
        breed: breed,
      ),
    );
  }
}
