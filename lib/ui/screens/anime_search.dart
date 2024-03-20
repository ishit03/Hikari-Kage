import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/anime_search_cubit.dart';
import 'package:hikari_kage/cubits/anime_search_state.dart';
import 'package:hikari_kage/status.dart';
import 'package:hikari_kage/ui/widgets/anime_search_widgets/search_list_view.dart';

class AnimeSearch extends StatefulWidget {
  const AnimeSearch({super.key});

  @override
  State<AnimeSearch> createState() => _AnimeSearchState();
}

class _AnimeSearchState extends State<AnimeSearch> {
  final TextEditingController _searchController = TextEditingController();
  final _animeSearchCubit = AnimeSearchCubit();
  Timer? _debounceTimer;

  @override
  void dispose() {
    _animeSearchCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          textInputAction: TextInputAction.search,
          autofocus: true,
          decoration: const InputDecoration(
              isDense: true,
              hintText: 'Search Anime',
              filled: false,
              border: InputBorder.none,
              focusedBorder: InputBorder.none),
          onChanged: (query) => debounceTimer(query, searchQuery),
          onSubmitted: (query) {
            if (query.isNotEmpty) {
              searchQuery(query);
            }
          },
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                _searchController.text = '';
                _animeSearchCubit.clearState();
              },
              icon: const Icon(
                Icons.clear,
                size: 20,
              ))
        ],
      ),
      body: BlocProvider(
        create: (_) => _animeSearchCubit,
        child: BlocBuilder<AnimeSearchCubit, AnimeSearchState>(
          builder: (context, state) {
            switch (state.state) {
              case Status.initial:
                return Container();
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              ///Search List To Be Implemented
              case Status.loaded:
                return SearchListView(animeList: state.searchList ?? []);
              case Status.error:
                return const Center(
                  child: Text('No such anime exists :)'),
                );
            }
          },
        ),
      ),
    );
  }

  void searchQuery(String query) => _animeSearchCubit.fetchSearchQuery(query);

  void debounceTimer(String? query, Function callback) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(seconds: 1), () {
      if (query != null && query.isNotEmpty) {
        callback(query);
      } else {
        _animeSearchCubit.clearState();
      }
    });
  }
}
