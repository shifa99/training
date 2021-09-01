class Onboarding {
   String title;
  final String imageName;
  Onboarding({required this.imageName, required this.title});
}

List<Onboarding> onboardings = [
  Onboarding(imageName: 'images/onboarding_0.png', title: 'تمتع بتجربة تعليم متميزة'),
  Onboarding(imageName: 'images/onboarding_1.png', title: 'اختبار معلوماتك وادع اصدقائك لبدء المنافسة'),
  Onboarding(imageName: 'images/onboarding_2.png', title: 'اسأل واتعلم'),
];
