
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("New User")),
      ),
      body: BlocProvider(create: (BuildContext context) => RegisterCubit(),
      child: const _RegisterView()),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 18),
              _RegisterForm()
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
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: "Username",
            prefixIcon: Icons.supervised_user_circle_outlined,
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage
            ,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            label: "Email",
            prefixIcon: Icons.email_outlined,
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage
            ,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            label: "Password",
            prefixIcon: Icons.password,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage
            ,
            isPassword: true,
          ),
          const SizedBox(height: 18),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text("Create User"),
          )
        ],
      ),
    );
  }
}
