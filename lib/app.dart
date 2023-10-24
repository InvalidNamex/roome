import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '/src/config/routes/app_routes.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/utils/app_strings.dart';
import '/src/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'src/core/utils/service_locator.dart';
import 'src/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'src/features/home/presentation/cubits/hotels/hotels_cubit.dart';
import 'src/features/home/presentation/cubits/near_me/near_me_cubit.dart';
import 'src/features/home/presentation/cubits/recommended/recommended_cubit.dart';
import 'src/features/roome/presentation/cubit/roome_cubit.dart';

class RoomeApp extends StatelessWidget {
  const RoomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                serviceLocator.get<RoomeCubit>()..getUserData(),
          ),
          BlocProvider(
            create: (context) => serviceLocator.get<HotelsCubit>()..getHotels(),
          ),
          BlocProvider(
            create: (context) =>
                serviceLocator.get<NearMeCubit>()..getNearMeHotels(),
          ),
          BlocProvider(
            create: (context) =>
                serviceLocator.get<RecommendedCubit>()..getRecommendedHotels(),
          ),
          BlocProvider(
            create: (context) =>
                serviceLocator.get<FavoriteCubit>()..getFavorites(),
          ),
          BlocProvider(create: (context) => serviceLocator.get<ThemesCubit>()),
          BlocProvider(
            create: (context) => serviceLocator.get<NotificationsCubit>(),
          ),
        ],
        child: BlocBuilder<ThemesCubit, ThemeData>(
          builder: (context, themeState) {
            return MaterialApp(
              title: AppStrings.appTitle,
              debugShowCheckedModeBanner: false,
              theme: themeState,
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
