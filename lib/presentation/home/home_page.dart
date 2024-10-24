import 'package:auto_route/auto_route.dart';
import 'package:card_settings/common/base/base_page.dart';
import 'package:card_settings/common/extensions/text_extensions.dart';
import 'package:card_settings/common/router/app_router.dart';
import 'package:card_settings/presentation/home/cubit/home_cubit.dart';
import 'package:card_settings/presentation/home/cubit/home_state.dart';
import 'package:card_settings/presentation/settings/widgets/credit_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends BasePage<HomeCubit, HomeBuildable, HomeListenable> {
  const HomePage({super.key});

  @override
  Widget builder(BuildContext context, HomeBuildable state) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CreditCard(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.router.push(const SettingsRoute()),
              child: 'Edit'.w(500),
            )
          ],
        ),
      ),
    );
  }
}
