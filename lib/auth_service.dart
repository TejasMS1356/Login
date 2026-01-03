import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabse = Supabase.instance.client;

  //sig in with email and password
  Future<AuthResponse> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabse.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  //signup with email and paswordd
  Future<AuthResponse> signupWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabse.auth.signUp(email: email, password: password);
  }

  //signout
  Future<void> signOut() async {
    await _supabse.auth.signOut();
  }

  String? getCurrentemail() {
    final session = _supabse.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
