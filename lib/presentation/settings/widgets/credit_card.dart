import 'package:card_settings/common/extensions/text_extensions.dart';
import 'package:card_settings/common/extensions/theme_extensions.dart';
import 'package:card_settings/common/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24,16,24,8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.icons.bankLogo.image(height: 40, width: 80),
                Container(
                  decoration: BoxDecoration(
                    color: context.colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                  child: 'Main card'.w(500).c(context.colors.white),
                ),
              ],
            ),
            const Spacer(),
           Container(
             decoration: BoxDecoration(
               color: context.colors.black.withOpacity(0.6),
               borderRadius: BorderRadius.circular(8),
             ),
             padding: const EdgeInsets.all( 8),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Align(
                   alignment: Alignment.centerRight,
                   child: Card(
                     margin: EdgeInsets.zero,
                     elevation: 0,
                     color: context.colors.white,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(4)),
                     child: Padding(
                       padding:
                       const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                       child: Assets.icons.humo.image(height: 20),
                     ),
                   ),
                 ),
                 const SizedBox(height: 8),
                 '1000 000 000 UZS'.w(500).s(24).c(context.colors.white),
                 const SizedBox(height: 8),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     '9860 00** **** 0000'.w(500).c(context.colors.white),
                     '00\\00'.w(500).c(context.colors.white),
                   ],
                 ),
                 const SizedBox(height: 8),
                 'CARDHOLDER NAME'.w(500).c(context.colors.white),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
