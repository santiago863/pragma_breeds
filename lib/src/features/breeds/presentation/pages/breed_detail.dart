import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_breeds/src/core/colors.dart';
import 'package:pragma_breeds/src/features/breeds/presentation/widgets/breed_image_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../domain/models/breed.dart';

@RoutePage()
class BreedDetailScreen extends ConsumerWidget {
  final Breed breed;

  const BreedDetailScreen({
    super.key,
    required this.breed,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          breed.name,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.white,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BreedImageWidget(
                      reference: breed.referenceImageId,
                      size: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          breed.name,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.white,
                                  ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          breed.description,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.white,
                                  ),
                        ),
                        _buildText(
                          context: context,
                          title: 'Temperament',
                          value: breed.temperament,
                        ),
                        _buildText(
                          context: context,
                          title: 'Life Span',
                          value: breed.lifeSpan,
                        ),
                        _buildText(
                          context: context,
                          title: 'Origin',
                          value: breed.origin,
                        ),
                        _buildText(
                          context: context,
                          title: 'Weight',
                          value: breed.weight,
                        ),
                        _buildText(
                          context: context,
                          title: 'Adaptability',
                          value: breed.adaptability.toString(),
                        ),
                        _buildText(
                          context: context,
                          title: 'Affection Level',
                          value: breed.affectionLevel.toString(),
                        ),
                        _buildText(
                          context: context,
                          title: 'Child Friendly',
                          value: breed.childFriendly.toString(),
                        ),
                        _buildText(
                          context: context,
                          title: 'Dog Friendly',
                          value: breed.dogFriendly.toString(),
                        ),
                        _buildText(
                          context: context,
                          title: 'Energy Level',
                          value: breed.energyLevel.toString(),
                        ),
                        _buildText(
                          context: context,
                          title: 'Grooming',
                          value: breed.grooming.toString(),
                        ),
                        _buildText(
                          context: context,
                          title: 'Health Issues',
                          value: breed.healthIssues.toString(),
                        ),
                        _buildText(
                          context: context,
                          title: 'Intelligence',
                          value: breed.intelligence.toString(),
                        ),
                        _buildText(
                          context: context,
                          title: 'Shedding Level',
                          value: breed.sheddingLevel.toString(),
                        ),
                        _buildText(
                          context: context,
                          title: 'Social Needs',
                          value: breed.socialNeeds.toString(),
                        ),
                        _buildText(
                          context: context,
                          title: 'Stranger Friendly',
                          value: breed.strangerFriendly.toString(),
                        ),
                        _buildText(
                          context: context,
                          title: 'Vocalisation',
                          value: breed.vocalisation.toString(),
                        ),
                        TextButton(
                          onPressed: goToWikipedia,
                          child: Text(
                            'Go to Wikipedia',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 10,
                                  color: AppColors.white,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.white,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildText({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          '$title: $value',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.white,
              ),
        ),
      ],
    );
  }

  Future<void> goToWikipedia() async {
    await launchUrlString(
      breed.wikipediaUrl,
    );
  }
}
