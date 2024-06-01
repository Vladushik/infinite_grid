import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:infinite_grid/src/core/app_routes.dart';
import 'package:infinite_grid/src/core/form_status_enum.dart';
import 'package:infinite_grid/src/core/injection_container.dart';
import 'package:infinite_grid/src/core/widgets/buttons/app_button_widget.dart';
import 'package:infinite_grid/src/core/widgets/logo_widget.dart';
import 'package:infinite_grid/src/core/widgets/text_fields/text_field_widget.dart';
import 'package:infinite_grid/src/core/widgets/ui_kit/default_padding_widget.dart';
import 'package:infinite_grid/src/features/auth/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.submitStatus.isSuccess) {
          context.goNamed(AppPages.home.name);
        }
        if (state.submitStatus.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorSubmit)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign in')),
        body: const CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: DefaultPaddingWidget(
                child: Column(
                  children: [
                    Spacer(flex: 2),
                    LogoWidget(),
                    Spacer(flex: 1),
                    _EmailFieldWidget(),
                    _PasswordFieldWidget(),
                    Spacer(flex: 3),
                    _Button(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//MARK: - _EmailFieldWidget
class _EmailFieldWidget extends StatelessWidget {
  const _EmailFieldWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFieldWidget(
          label: 'Email',
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (String value) {
            context.read<LoginBloc>().add(LoginEmailChangedEvent(value));
          },
        );
      },
    );
  }
}

//MARK: - _PasswordFieldWidget
class _PasswordFieldWidget extends StatelessWidget {
  const _PasswordFieldWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFieldWidget(
          label: 'Password',
          onChanged: (String value) {
            context.read<LoginBloc>().add(LoginPasswordChangedEvent(value));
          },
        );
      },
    );
  }
}

//MARK: - _Button
class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return AppButtonWidget(
          title: 'Continue',
          isValid: state.isValid,
          isLoading: state.submitStatus.isLoading,
          onPressed: () {
            context.read<LoginBloc>().add(const LoginSubmittedEvent());
          },
        );
      },
    );
  }
}
