import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/user_watch_list_cubit.dart';
import 'package:hikari_kage/ui/widgets/user_watch_list_widgets/custom_dot_indicator.dart';

class UserWatchListScreen extends StatefulWidget {
  const UserWatchListScreen({super.key});

  @override
  State<UserWatchListScreen> createState() => _UserWatchListScreenState();
}

class _UserWatchListScreenState extends State<UserWatchListScreen> {
  @override
  Widget build(BuildContext context) {
    var isSwiped = false;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BlocProvider(
          create: (_) => UserWatchListCubit(),
          child: BlocBuilder<UserWatchListCubit, ListTitle>(
              builder: (context, state) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onHorizontalDragStart: (details) {
                isSwiped = false;
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 10 && !isSwiped) {
                  isSwiped = true;
                  context.read<UserWatchListCubit>().decrementIndex();
                } else if (details.delta.dx < -10 && !isSwiped) {
                  isSwiped = true;
                  context.read<UserWatchListCubit>().incrementIndex();
                }
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    CustomDotIndicator(currentIndex: state.index),
                    const Expanded(
                      child: Center(
                          child: Text('Watchlists are \n Coming Soon....')),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
