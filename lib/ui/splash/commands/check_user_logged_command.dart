import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/repositories_providers.dart';

part 'check_user_logged_command.g.dart';

@riverpod
final class CheckUserLoggedCommand extends _$CheckUserLoggedCommand {
  @override
  Future<bool?> build() async => null;

  Future<void> execute() async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);

    final isLoggedResult = await authRepository.isLogged();

    state = isLoggedResult.when(
      success: AsyncData.new,
      error: (value) => AsyncError(value, StackTrace.current),
    );
  }
}
