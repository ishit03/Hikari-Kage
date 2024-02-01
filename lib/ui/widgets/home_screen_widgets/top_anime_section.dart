import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/home_screen_cubit.dart';

import '../../../cubits/home_screen_state.dart';
import '../../../status.dart';
import 'list_item.dart';

class TopAnimeSection extends StatelessWidget {
  final String title;
  final String listKey;
  const TopAnimeSection(
      {super.key, required this.title, required this.listKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, bottom: 5),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
          if (state.status == Status.initial) {
            context.read<HomeScreenCubit>().loadData();
            return const SizedBox.shrink();
          } else if (state.status == Status.loading) {
            return const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state.status == Status.loaded) {
            final animeList = state.fetchList(listKey);
            return SizedBox(
              height: 200,
              child: (animeList.isEmpty)
                  ? const Center(
                      child: Text('Something went wrong'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: animeList.length,
                      itemExtent: 110,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ListItem(anime: animeList[index]);
                      }),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        }),
      ],
    );
  }
}
