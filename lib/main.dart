import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_routes.dart';
import 'core/constants/api_sevices.dart';
import 'core/constants/dio_client.dart';
import 'features/data/data_sources/remote_data_source.dart';
import 'features/data/repository/characters_repository_impl.dart';
import 'features/presentaion/cubit/character_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDioLogging();

  final apiService = ApiService(dio: dio);
  final remoteDataSource = CharactersRemoteDataSourceImpl(apiService);
  final repository = CharactersRepositoryImpl(remoteDataSource);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final CharactersRepositoryImpl repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CharacterCubit(repository)..getCharacters(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick & Morty',
        onGenerateRoute: AppRoutes().generateRoutes,
      ),
    );
  }
}
