import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/home_screen_cubit.dart';
import 'package:hikari_kage/cubits/home_screen_state.dart';
import 'package:hikari_kage/status.dart';
import 'package:hikari_kage/ui/widgets/general_widgets/hikari_kage_loader.dart';
import 'package:hikari_kage/ui/widgets/home_screen_widgets/list_item.dart';

class TopAnimeSection extends StatelessWidget {
  const TopAnimeSection(
      {required this.listTitle, required this.listKey, super.key});
  final String listTitle;
  final String listKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, bottom: 5),
            child: Text(
              listTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w300, fontFamily: 'Caveat'),
            ),
          ),
          BlocBuilder<HomeScreenCubit, HomeScreenState>(
              builder: (context, state) {
            if (state is AnimeScreenState) {
              if (state.status == Status.initial) {
                context.read<HomeScreenCubit>().loadData();
                return const SizedBox.shrink();
              } else if (state.status == Status.loading) {
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: HikariKageLoader(),
                  ),
                );
              } else if (state.status == Status.loaded) {
                final animeList = state.fetchList(listKey);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    height: 200,
                    child: (animeList.isEmpty)
                        ? const Center(
                            child: Text('Something went wrong'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: animeList.length,
                            itemExtent: 110,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ListItem(anime: animeList[index]);
                            }),
                  ),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}
