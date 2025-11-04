import 'package:control/domain/auth_screen/auth_screen.dart';
import 'package:control/utils/context_extentions.dart';
import 'package:control/utils/riverpod_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthScreen extends StatefulHookConsumerWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authScreenProvider);

    final loginTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    void submitForm() async {
      if (_formKey.currentState?.validate() != true) {
        return;
      }
      ref
          .read(authScreenProvider.notifier)
          .login(loginTextController.text, passwordTextController.text);
    }

    return Scaffold(
      body: RiverpodScreen(
        state: state,
        child: (_) => Align(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: _formKey,
              child: AutofillGroup(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: loginTextController,
                      decoration: InputDecoration(
                        labelText: context.translate.email,
                      ),

                      autofillHints: [AutofillHints.email],
                      validator: (value) => value == null || value.isEmpty
                          ? '${context.translate.pleaseEnter} ${context.translate.email.toLowerCase()}'
                          : null,
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: passwordTextController,
                      decoration: InputDecoration(
                        labelText: context.translate.password,
                      ),

                      autofillHints: [AutofillHints.password],
                      obscureText: true,
                      validator: (value) => value == null || value.isEmpty
                          ? '${context.translate.pleaseEnter} ${context.translate.password.toLowerCase()}'
                          : null,
                      onFieldSubmitted: (_) async {
                        submitForm();
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () async {
                        TextInput.finishAutofillContext();

                        submitForm();
                      },
                      child: Text(context.translate.login),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
