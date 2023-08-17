import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    //Temporal Colors
    const Color background = Color(0xff1A1F24);
    const Color primary = Color(0xff00968A);
    const Color secondary = Color(0xff111417);
    const List<Map<String, String>> onboardingData = [
      {
        'image': 'assets/images/onboarding_categories.png',
        'title': 'Ingresa tus categorias',
        'description':
            'Comienza por tus categorias que detallen tus ingresos y tus gastos'
      },
      {
        'image': 'assets/images/onboarding_categories.png',
        'title': 'Ingresa tus categorias',
        'description':
            'Comienza por tus categorias que detallen tus ingresos y tus gastos'
      },
      {
        'image': 'assets/images/onboarding_categories.png',
        'title': 'Ingresa tus categorias',
        'description':
            'Comienza por tus categorias que detallen tus ingresos y tus gastos'
      }
    ];

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/logo.png',
              width: (size.width * 0.4),
            ),
            const Spacer(),
            Expanded(
              child: PageView.builder(
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: (size.width * 0.80),
                      height: (size.height * 0.30),
                      child: _OnboardingContent(
                        assetImage: onboardingData[index]['image']!,
                        title: onboardingData[index]['title']!,
                        description: onboardingData[index]['description']!,
                      ),
                    );
                  }),
            ),
            const Spacer(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
                backgroundColor: secondary,
              ),
              onPressed: () {},
              child: Text(
                'Categorias',
                style: TextStyle(
                  color: primary,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _OnboardingContent extends StatelessWidget {
  final String assetImage;
  final String title;
  final String description;

  const _OnboardingContent({
    required this.assetImage,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(assetImage),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 32,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
