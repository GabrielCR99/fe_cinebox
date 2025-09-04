import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_user_logged_command.g.dart';

@riverpod
final class CheckUserLoggedCommand extends _$CheckUserLoggedCommand {
  @override
  Future<bool?> build() async => null;

  void execute() {
    state = const AsyncLoading();
    Future.delayed(
      const Duration(seconds: 1),
      () => state = const AsyncData(false),
    );
  }
}
