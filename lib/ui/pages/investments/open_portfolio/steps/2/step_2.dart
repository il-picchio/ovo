import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/core/theme/elements/colors.dart';
import 'package:ovo/ui/common/widgets/gradient_button.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/steps/2/investment_card.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/steps/2/suboptimal_warning_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '__mock/investments_portfolios.dart';

class PortfolioOpenStep2 extends StatefulWidget {
  final void Function(InvestmentCard) onProceed;

  const PortfolioOpenStep2({super.key, required this.onProceed});

  @override
  State<PortfolioOpenStep2> createState() => _PortfolioOpenStep2State();
}

class _PortfolioOpenStep2State extends State<PortfolioOpenStep2> {
  final _controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    const pages = portfolios;

    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Our portfolios',
          style: theme.textTheme.headlineSmall,
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 30),
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
            controller: _controller,
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
          controller: _controller,
          count: pages.length,
          effect: WormEffect(
            activeDotColor: theme.extension<BrandColors>()!.secondary,
            dotColor: Colors.grey.shade200,
            dotHeight: 16,
            dotWidth: 16,
            type: WormType.normal,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GradientButton(
          onTap: () async {
            final bottomSheetResult = await showModalBottomSheet(
                context: context,
                useSafeArea: true,
                builder: ((context) => const SuboptimalInvestmentPage()));
            if (bottomSheetResult == null || !bottomSheetResult) {
              return;
            }
            widget.onProceed(pages[_controller.page?.toInt() ?? 0]);
          },
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
