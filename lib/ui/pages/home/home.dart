import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/home/__mock_data/movements.dart';
import 'package:ovo/ui/pages/home/app_bar/app_bar.dart';
import 'package:ovo/ui/pages/home/movements/movement.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late ScrollController _controller;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _animationController.value = 1;
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() => _animationController.value =
          (-(0.009 * _controller.offset) + 2).clamp(0, 1));
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          expandedHeight: 450,
          collapsedHeight: 140,
          flexibleSpace: HomeAppBar(
            animationControllerValue: _animationController.value,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 100),
          sliver: SliverList(
            delegate: SliverChildListDelegate(movements
                .map((e) => MovementContainer(
                      movement: e,
                    ))
                .toList()),
          ),
        ),
      ],
    );
  }
}
