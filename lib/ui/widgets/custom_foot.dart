import 'package:app_videoplayerpitch/ui/widgets/custom_text.dart';
import 'package:app_videoplayerpitch/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomFoot extends StatelessWidget {
  const CustomFoot({super.key});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    //final titleStyle = Theme.of(context).textTheme.titleMedium;
    final Responsive responsive = Responsive.fromContext(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: '¿Te parece útil hasta ahora?',
              fontSize: 1.8,
              textColor: Colors.black,
              textAlign: TextAlign.center,
              isBold: true,
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                        label: const Text('Si')),
                    const SizedBox(),
                    FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                        label: const Text('No')),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: responsive.hp(2),
            ),
            CustomText(
              text:
                  'Logra que te descubran, tu talento es unico.',
              fontSize: 1.9,
              textColor: const Color(0xff767676),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: responsive.hp(3),
            ),
          ],
        ),
      ),
    );
  }
}
