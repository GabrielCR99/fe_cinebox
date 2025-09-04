import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/repositories_providers.dart';

part 'login_with_google_command.g.dart';

@riverpod
final class LoginWithGoogleCommand extends _$LoginWithGoogleCommand {
  @override
  AsyncValue<void> build() {
    return const AsyncData(null);
  }

  Future<void> execute() async {
    state = const AsyncLoading();

    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.signIn();

    return result.when<void>(
      success: (value) => state = const AsyncData(null),
      error: (value) =>
          state = AsyncError('Erro ao realizar o login.', StackTrace.current),
    );
  }
}
