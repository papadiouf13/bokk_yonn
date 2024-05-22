import 'package:get/get.dart';

import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/map/bindings/map_binding.dart';
import '../modules/map/views/map_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/reservation/bindings/reservation_binding.dart';
import '../modules/reservation/views/reservation_view.dart';
import '../modules/ride/bindings/ride_binding.dart';
import '../modules/ride/views/ride_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/trajet/bindings/trajet_binding.dart';
import '../modules/trajet/views/trajet_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAP,
      page: () => MapView(),
      binding: MapBinding(),
    ),
    GetPage(
      name: _Paths.TRAJET,
      page: () => const TrajetView(),
      binding: TrajetBinding(),
    ),
    GetPage(
      name: _Paths.RIDE,
      page: () => RideView(),
      binding: RideBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.RESERVATION,
      page: () =>  ReservationView(),
      binding: ReservationBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
  ];
}
