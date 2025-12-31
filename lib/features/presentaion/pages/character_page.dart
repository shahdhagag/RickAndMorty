import 'package:cubit_practice/features/presentaion/widgets/skeleton_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/app_routes.dart';
import '../cubit/character_cubit.dart';
import '../widgets/no_internet_widget.dart';
import '../widgets/search_bar.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        title: 'Rick & Morty Characters',
        isSearching: isSearching,
        controller: searchController,
        onSearchPressed: () {
          setState(() => isSearching = true);
        },
        onClosePressed: () {
          setState(() => isSearching = false);
          searchController.clear();
          context.read<CharacterCubit>().clearSearch();
        },
        onChanged: (value) {
          context.read<CharacterCubit>().searchCharacters(value);
        },
      ),
      body: OfflineBuilder(
        connectivityBuilder:
            (
              BuildContext context,
              List<ConnectivityResult> connectivity,
              Widget child,
            ) {
              final bool connected = !connectivity.contains(
                ConnectivityResult.none,
              );

              return connected ? child : const NoInternetWidget();
            },
        child: BlocBuilder<CharacterCubit, CharacterState>(
          builder: (context, state) {
            /// 🟡 LOADING → Skeleton
            if (state is CharacterLoading) {
              return GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Skeletonizer(
                    enabled: true,
                    effect: const ShimmerEffect(),
                    child: const CharacterSkeletonCard(),
                  );
                },
              );
            }

            /// 🟢 SUCCESS
            if (state is CharacterLoaded) {
              final characters = state.characters;

              if (characters.isEmpty) {
                return const Center(
                  child: Text(
                    'No characters found 😕',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: characters.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final character = characters[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.characterDetailsPage,
                        arguments: character,
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.network(
                                character.image,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              character.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            character.status,
                            style: TextStyle(
                              color: character.status == 'Alive'
                                  ? Colors.green
                                  : character.status == 'Dead'
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            /// 🔴 ERROR
            if (state is CharacterError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
