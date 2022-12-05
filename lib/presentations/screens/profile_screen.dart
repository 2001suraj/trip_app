import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tourist_guide/business_logic/auth/auth_bloc.dart';
import 'package:smart_tourist_guide/presentations/pages/login_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthsuccessState) {
          LoginPage();
        }
      },
      child: Center(
        child: TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(LogoutEvent());
          },
          child: Text('logout'),
        ),
      ),
    ));
  }
}
