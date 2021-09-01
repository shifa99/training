import 'package:e_school/layout/home_layout.dart';
import 'package:e_school/models/cache_helper.dart';
import 'package:e_school/modules/auth_screens/choose_auth_screen/choose_auth_screen.dart';
import 'package:e_school/modules/auth_screens/login_screen/login_screen.dart';
import 'package:e_school/modules/auth_screens/register_screen/register_screen.dart';
import 'package:e_school/modules/choose_language_screen/choose_language_screen.dart';
import 'package:e_school/modules/group_screens/group_screen/group_screen.dart';
import 'package:e_school/modules/introduce_screen/introduce_screen.dart';
import 'package:e_school/modules/onboarding_screen/onboarding_screen.dart';
import 'package:e_school/modules/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'modules/group_screens/create_group_screen/create_group_screen.dart';
import 'shared/bloc/app_cubit/app_cubit.dart';
import 'shared/bloc/app_cubit/app_cubit_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.initlize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: BlocConsumer<AppCubit, AppCubitStates>(
          builder: (context, state) {
            print(state.toString());
            print(AppCubit.get(context).localeApp);
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: AppCubit.get(context).localeApp,
                supportedLocales: [
                  Locale('en', ''), // English, no country code
                  Locale('ar', ''), // Arabic, no country code
                ],
                routes: 
                {
                  OnboardingScreen.routeName: (context) => OnboardingScreen(),
                  IntroduceScreen.routeName: (context) => IntroduceScreen(),
                  LoginScreen.routeName: (context) => LoginScreen(),
                  RegisterScreen.routeName:(context)=>RegisterScreen(),
                  ChooseAuthScreen.routeName: (context) => ChooseAuthScreen(),
                  HomeScreen.routeName:(context)=>HomeScreen(),
                  CreateGroupScreen.routeName:(context)=>CreateGroupScreen(),
                  GroupScreen.routeName:(context)=>GroupScreen(),
                  SettingsScreen.routeName:(context)=>SettingsScreen(),
                },
                title: 'E-School',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: Builder(
                  builder: (context) {
                    AppLocalizations.of(context)!.helloworld;
                    Localizations.localeOf(context); //get locale device,
                    return ChooseLanguageScreen();
                  },
                ));
          },
          listener: (context, state) {}),
    );
  }
}
