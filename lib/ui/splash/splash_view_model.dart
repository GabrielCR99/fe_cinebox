import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'commands/check_user_logged_command.dart';

part 'splash_view_model.g.dart';

@riverpod
SplashViewModel splashViewModel(Ref ref) => SplashViewModel(
  checkUserLoggedCommand: ref.read(checkUserLoggedCommandProvider.notifier),
);

final class SplashViewModel {
  final CheckUserLoggedCommand _checkUserLoggedCommand;

  SplashViewModel({required CheckUserLoggedCommand checkUserLoggedCommand})
    : _checkUserLoggedCommand = checkUserLoggedCommand;

  void checkLoginAndRedirect() => _checkUserLoggedCommand.execute();
}
