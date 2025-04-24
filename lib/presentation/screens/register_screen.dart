import 'package:flutter/material.dart';
import 'package:flutter_application_formsapp/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/register/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('New user'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
    final colors = Theme.of(context).colorScheme;
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            onChanged: registerCubit.username,
            errorMessage: username.errorMessage,
            icon: Icon(
              Icons.supervised_user_circle_outlined,
              color: colors.primary,
            ),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            label: 'Email',
            onChanged: registerCubit.email,
            errorMessage: email.errorMessage,
            icon: Icon(
              Icons.email,
              color: colors.primary,
            ),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: registerCubit.password,
            errorMessage: password.errorMessage,
            icon: Icon(
              Icons.password,
              color: colors.primary,
            ),
          ),
          SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            label: Text('Create user'),
            icon: Icon(Icons.save),
          )
        ],
      ),
    );
  }
}
