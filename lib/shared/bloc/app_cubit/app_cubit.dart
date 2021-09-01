import 'package:e_school/layout/groups_screen.dart';
import 'package:e_school/layout/main_screen.dart';
import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cubit_states.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(IdleLanguageState());
  static AppCubit get(context) => BlocProvider.of(context);
  //language
  Locale localeApp = Locale('ar');
  void changeLocaleApp(String languageCode) {
    if (localeApp.countryCode != languageCode) {
      localeApp = Locale(languageCode);
      emit(ChangeLanguageState());
    }
  }

  //bottomNavigationBar
  int currentIndex = 0;
  Widget selectedScreen(DeviceInformation deviceInfo,BuildContext context) {
    if (currentIndex == 0)
      return buildMainScreen(deviceInfo: deviceInfo);
    else if (currentIndex == 1)
      return buildGroupsScreen(deviceInfo: deviceInfo,context: context);
    else if (currentIndex == 2)
      return Text('data');
    else
      return Text('data');
  }
  String selectedTitle()
  {
    if (currentIndex == 0)
      return 'الرئيسية';
    else if (currentIndex == 1)
      return 'مجموعاتي';
    else if (currentIndex == 2)
      return'جدولي';
    else
      return 'بياناتي';
  }

  void chnageIndex(int index) {
    if (index != currentIndex) {
      currentIndex = index;
      emit(ChangeBottonNavIndex());
    }
  }
}
