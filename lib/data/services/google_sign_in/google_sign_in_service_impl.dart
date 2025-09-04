import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/result/result.dart';
import 'google_sign_in_service.dart';

final class GoogleSignInServiceImpl implements GoogleSignInService {
  @override
  Future<Result<void, String>> isSignedIn() async {
    try {
      final logged = await GoogleSignIn.instance
          .attemptLightweightAuthentication();

      if (logged case GoogleSignInAccount(
        authentication: GoogleSignInAuthentication(:final idToken?),
      )) {
        return Success(idToken);
      }

      return Failure(Exception('No user is currently signed in'));
    } catch (e, s) {
      log(
        'Error checking Google Sign-In status',
        error: e,
        stackTrace: s,
      );

      return Failure(Exception('Failed to check sign-in status: $e'));
    }
  }

  @override
  Future<Result<Exception, String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: const [
          'email',
          'profile',
          'openid',
        ],
      );

      if (auth.authentication case GoogleSignInAuthentication(
        :final idToken?,
      )) {
        return Success(idToken);
      }

      return Failure(
        Exception('Failed to retrieve idToken from Google Sign-In'),
      );
    } catch (e, s) {
      log(
        'Error during Google Sign-In',
        error: e,
        stackTrace: s,
      );

      return Failure(Exception('Google Sign-In failed: $e'));
    }
  }

  @override
  Future<Result<Exception, Unit>> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();

      return const Success(unit);
    } catch (e, s) {
      log(
        'Error during Google Sign-Out',
        error: e,
        stackTrace: s,
      );

      return Failure(Exception('Google Sign-Out failed: $e'));
    }
  }
}
