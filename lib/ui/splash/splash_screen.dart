import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/themes/resource.dart';
import '../core/widgets/loader_messages.dart';
import 'commands/check_user_logged_command.dart';
import 'splash_view_model.dart';

final class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

final class _SplashScreenState extends ConsumerState<SplashScreen>
    with LoaderAndMessages<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(splashViewModelProvider).checkLoginAndRedirect(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(checkUserLoggedCommandProvider, (_, next) {
      next.whenOrNull(
        loading: showLoader,
        data: (data) {
          final path = switch (data) {
            true => '/home',
            false => '/login',
            _ => '',
          };

          if (path.isNotEmpty && context.mounted) {
            hideLoader();

            return Navigator.of(
              context,
            ).pushNamedAndRemoveUntil<void>(path, (_) => false);
          }
        },
        error: (_, _) {
          if (context.mounted) {
            hideLoader();
            showErrorSnackBar('Erro ao verificar login do usuário');

            return Navigator.of(
              context,
            ).pushNamedAndRemoveUntil<void>('/login', (_) => false);
          }
        },
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            color: Colors.black.withAlpha(170),
          ),
          Center(
            child: Image.asset(R.ASSETS_IMAGES_LOGO_PNG),
          ),
        ],
      ),
    );
  }
}
