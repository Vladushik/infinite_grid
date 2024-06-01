import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_grid/src/core/injection_container.dart';
import 'package:infinite_grid/src/core/widgets/logo_widget.dart';
import 'package:infinite_grid/src/core/widgets/ui_kit/default_padding_widget.dart';
import 'package:infinite_grid/src/features/home/bloc/home_bloc.dart';
import 'package:infinite_grid/src/features/home/presentation/widgets/grid_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Markup Test'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<HomeBloc>().add(const HomeRemovedEvent());
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              context.read<HomeBloc>().add(const HomeAddedEvent());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const _Body2(),
    );
  }
}

/// Not the right design, but optimized
///
/// All widgets are located from top to bottom
class _Body1 extends StatelessWidget {
  const _Body1();

  @override
  Widget build(BuildContext context) {
    return DefaultPaddingWidget(
      child: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.all(12),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: LogoWithBorderWidget(),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return SliverGrid.builder(
                itemCount: state.list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 4,
                ),
                itemBuilder: (context, index) {
                  final item = state.list[index];
                  return GridItemWidget(title: '$item $index');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Correct design but not optimized
///
/// Looks like in the video but used shrinkWrap
class _Body2 extends StatelessWidget {
  const _Body2();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      reverse: true,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(12),
          sliver: SliverToBoxAdapter(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return GridView.builder(
                  itemCount: state.list.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                  ),
                  itemBuilder: (context, index) {
                    final item = state.list[index];
                    return GridItemWidget(title: '$item $index');
                  },
                );
              },
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.all(12),
          sliver: SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: LogoWithBorderWidget(),
            ),
          ),
        ),
      ],
    );
  }
}

/// Not the right design, but optimized
///
/// Logo at center. List appears below the screen
class _Body3 extends StatelessWidget {
  const _Body3();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverFillRemaining(
          child: Center(child: LogoWithBorderWidget()),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          sliver: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return SliverGrid.builder(
                itemCount: state.list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 4,
                ),
                itemBuilder: (context, index) {
                  final item = state.list[index];
                  final title = '$item $index';
                  return GridItemWidget(title: title);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
