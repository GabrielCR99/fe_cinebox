import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/resource.dart';

class SignInGoogleButton extends StatelessWidget {
  const SignInGoogleButton({
    required this.onPressed,
    required this.isLoading,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
              visible: !isLoading,
              replacement: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 1,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.black,
                    ),
                  ),
                ),
              ),
              child: Image.asset(
                R.ASSETS_IMAGES_GOOGLE_LOGO_PNG,
              ),
            ),
          ),
          Text(
            !isLoading ? 'Entrar com Google' : 'Carregando',
            style: const TextStyle(fontSize: 14, color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
