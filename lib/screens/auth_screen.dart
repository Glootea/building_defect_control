import 'package:control/domain/user.dart';
import 'package:control/navigation/navigation.dart';
import 'package:flutter/material.dart';
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
    final loginTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    final state = ref.watch(userProvider);

    state.whenData(
      // TODO: move to guard/middleware/listener
      (userData) => (userData != null)
          ? WidgetsBinding.instance.addPostFrameCallback(
              (_) => ProjectsListRoute().go(context),
            )
          : null,
    );

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: (state.isLoading)
              ? const CircularProgressIndicator()
              : Form(
                  key: _formKey,
                  child: AutofillGroup(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state.hasError) ...[
                          Text(
                            state.error.toString(),
                            style: const TextStyle(color: Colors.red),
                          ),
                          const SizedBox(height: 16),
                        ],

                        TextFormField(
                          controller: loginTextController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                          autofillHints: [AutofillHints.username],
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your username'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: passwordTextController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          autofillHints: [AutofillHints.password],
                          obscureText: true,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your password'
                              : null,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() != true) {
                              return;
                            }

                            ref
                                .read(userProvider.notifier)
                                .login(
                                  loginTextController.text,
                                  passwordTextController.text,
                                );
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
