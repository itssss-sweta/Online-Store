import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/config/routes/approute.dart';
import 'package:online_store/core/constants/key.dart';
import 'package:online_store/features/detailpage.dart/presentation/cubit/cubit/detail_cubit_cubit.dart';
import 'package:online_store/features/homepage.dart/presentation/cubit/home/home_cubit_cubit.dart';
import 'package:online_store/features/homepage.dart/presentation/cubit/search/cubit/search_cubit_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubitCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubitCubit(),
          ),
          BlocProvider(
            create: (context) => DetailCubitCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoute().ongenerateRoute,
          navigatorKey: navigationKey,
        ));
  }
}
