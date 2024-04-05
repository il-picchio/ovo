import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/home/__mock_data/movements.dart';
import 'package:ovo/ui/pages/home/app_bar/app_bar.dart';
import 'package:ovo/ui/pages/home/movements/movement.dart';
import 'package:ovo/ui/pages/home/search_movement/search_movement.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late ScrollController _controller;
  late AnimationController _animationController;
  late TextEditingController _textController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _animationController.value = 1;
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() => _animationController.value =
          (1 - _controller.offset / 60).clamp(0, 1));
    });
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    _textController.dispose();
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
          collapsedHeight: 170,
          flexibleSpace: HomeAppBar(
            animationControllerValue: _animationController.value,
            child: SearchMovement(
              controller: _textController,
              onTap: () => _controller.animateTo(
                280, // 450 - 170
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 100),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ...movements.map((e) => MovementContainer(
                    movement: e,
                  ))
            ]),
          ),
        ),
      ],
    );
  }
}
