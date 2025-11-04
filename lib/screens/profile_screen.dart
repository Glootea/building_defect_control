import 'package:control/domain/user/user.dart';
import 'package:control/models/user.dart';
import 'package:control/utils/breadcrums.dart';
import 'package:control/utils/context_extentions.dart';
import 'package:control/utils/riverpod_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool showEmail = false;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userProvider);
    return Scaffold(
      body: RiverpodScreen<UserData?>(
        state: state,
        child: (user) {
          final items = [
            Icon(Icons.person_outline, size: 100),
            Text(
              '${user?.lastName ?? ''} ${user?.firstName ?? ''} ${user?.middleName ?? ''}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text('${context.translate.jobPosition}: ${user?.post ?? 'N/A'}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${context.translate.email}: '),
                MouseRegion(
                  onEnter: (event) => setState(() {
                    showEmail = true;
                  }),
                  onExit: (event) => setState(() {
                    showEmail = false;
                  }),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        showEmail = !showEmail;
                      });
                    },

                    child: AnimatedCrossFade(
                      firstChild: Text(user?.email ?? 'N/A'),
                      secondChild: Text('*****'),
                      crossFadeState: showEmail
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 200),
                    ),
                  ),
                ),
              ],
            ),
          ];
          return CustomScrollView(
            slivers: [
              const Breadcrums(),
              SliverList.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemBuilder: (context, index) => Align(child: items[index]),
                itemCount: items.length,
              ),
            ],
          );
        },
      ),
    );
  }
}
