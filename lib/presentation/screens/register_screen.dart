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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            onChanged: (value) {
              registerCubit.username(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field required';
              if (value.trim().isEmpty) return 'Field required';
              if (value.length < 6) return 'Required at least 6 letters';
              return null;
            },
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: 'Email',
            onChanged: (value) {
              registerCubit.email(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field required';
              if (value.trim().isEmpty) return 'Field required';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if (!emailRegExp.hasMatch(value)) return 'Format invalid';
              return null;
            },
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: (value) {
              registerCubit.password(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field required';
              if (value.trim().isEmpty) return 'Field required';
              if (value.length < 6) return 'Required at least 6 letters';
              return null;
            },
          ),
          SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
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
