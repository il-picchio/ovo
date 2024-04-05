import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/core/theme/elements/colors.dart';

class OvoNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int newIndex) onTap;

  const OvoNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BrandColors>()!;

    return SafeArea(
      minimum: const EdgeInsets.only(bottom: 20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 30,
              ),
            ],
            color: Colors.white,
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            unselectedIconTheme: const IconThemeData(
                color: Color.fromRGBO(100, 107, 99, 0.4), size: 18),
            items: [
              FontAwesomeIcons.moneyBillTransfer,
              FontAwesomeIcons.solidCreditCard,
              FontAwesomeIcons.buildingColumns,
              FontAwesomeIcons.chartLine,
              Icons.account_circle_rounded
            ].mapIndexed((idx, e) {
              return BottomNavigationBarItem(
                label: '',
                icon: Icon(e),
                activeIcon: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => theme.gradient.createShader(bounds),
                  child: SizedBox(
                    child: Icon(e),
                  ),
                ),
              );
            }).toList(growable: false),
          ),
        ),
      ),
    );
  }
}
