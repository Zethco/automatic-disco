import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 50),
              child: Image.asset(
                'assets/images/logo.png',
                width: (size.width * 0.4),
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return _OnboardingContent(
                    assetImage: onboardingData[index]['image']!,
                    title: onboardingData[index]['title']!,
                    description: onboardingData[index]['description']!,
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                thickness: 20,
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
                backgroundColor: secondary,
              ),
              onPressed: () {},
              child: const Text(
                'Categorias',
                style: TextStyle(
                  color: primary,
                ),
              ),
            ),
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
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
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
