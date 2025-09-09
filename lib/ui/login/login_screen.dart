import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/themes/resource.dart';
import '../core/widgets/loader_messages.dart';
import 'commands/login_with_google_command.dart';
import 'login_view_model.dart';
import 'widgets/sign_in_google_button.dart';

final class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

final class _LoginScreenState extends ConsumerState<LoginScreen>
    with LoaderAndMessages<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      loginWithGoogleCommandProvider,
      (_, state) {
        state.whenOrNull(
          data: (_) =>
              Navigator.of(context).pushReplacementNamed<void, void>('/home'),
          error: (_, _) => showErrorSnackBar('Erro ao realizar login'),
        );
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            color: Colors.black.withAlpha(170),
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.only(top: 108),
            child: Column(
              spacing: 40,
              children: [
                Image.asset(
                  R.ASSETS_IMAGES_LOGO_PNG,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Consumer(
                    builder: (_, ref, _) {
                      final state = ref.watch(loginWithGoogleCommandProvider);

                      return SignInGoogleButton(
                        isLoading: state.isLoading,
                        onPressed: ref.read(loginViewModelProvider).googleLogin,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
