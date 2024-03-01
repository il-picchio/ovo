import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/theme/elements/colors.dart';
import 'package:ovo/ui/common/widgets/gradient_button.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/steps/2/investment_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PortfolioOpenStep2 extends StatefulWidget {
  final void Function() onProceed;

  const PortfolioOpenStep2({super.key, required this.onProceed});

  @override
  State<PortfolioOpenStep2> createState() => _PortfolioOpenStep2State();
}

class _PortfolioOpenStep2State extends State<PortfolioOpenStep2> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        6,
        (index) => InvestmentCard(
            title: 'Wild bird',
            description: 'The maximum for the maximum',
            data: []));

    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Our portfolios',
          style: theme.textTheme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 30),
          child: Text(
            'All our portfolio are built by a skilled portfolio manager, you can anyway customize yours',
            style: theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
        AspectRatio(
          aspectRatio: 1.2,
          child: PageView.builder(
            clipBehavior: Clip.none,
            controller: controller,
            itemCount: pages.length,
            itemBuilder: (_, index) {
              return pages[index % pages.length];
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SmoothPageIndicator(
          controller: controller,
          count: pages.length,
          effect: WormEffect(
            activeDotColor: theme.extension<BrandColors>()!.secondary,
            dotColor: Colors.grey.shade200,
            dotHeight: 16,
            dotWidth: 16,
            type: WormType.normal,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        GradientButton(
          onTap: () => widget.onProceed(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                FontAwesomeIcons.check,
                size: 15,
              )
            ],
          ),
        )
      ],
    );
  }
}
