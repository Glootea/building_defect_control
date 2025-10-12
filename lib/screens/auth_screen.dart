import 'package:control/domain/user.dart';
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
    final state = ref.watch(userProvider);

    final loginTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    void submitForm() async {
      if (_formKey.currentState?.validate() != true) {
        return;
      }
      ref
          .read(userProvider.notifier)
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
                      decoration: const InputDecoration(labelText: 'Email'),

                      autofillHints: [AutofillHints.email],
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your email'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    // TODO: use focus to move to password field
                    TextFormField(
                      controller: passwordTextController,
                      decoration: const InputDecoration(labelText: 'Password'),

                      autofillHints: [AutofillHints.password],
                      obscureText: true,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your password'
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
                      child: const Text('Login'),
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
