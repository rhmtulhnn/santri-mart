import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/core/router/router_provider.dart';

void main() => runApp(const ProviderScope(child: IslamicMarket()));

class IslamicMarket extends ConsumerWidget {
  const IslamicMarket({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Santri Mart',
      theme: ThemeData(
          useMaterial3: true
      ),
    );
  }
}
