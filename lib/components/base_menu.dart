import 'package:flutter/material.dart';
import 'package:be_talent/theme/app_colors.dart';

import '../theme/app_font.dart';

//App bar with avatar and notification icon
class BaseMenu extends StatelessWidget {
  final int notificationCount;

  const BaseMenu({super.key, this.notificationCount = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar
        CircleAvatar(
          radius: 22.5,
          backgroundColor: AppColors.gray5,
          child: Text(
            'CG',
            style: AppFont.h3(color: AppColors.black),
          ),
        ),
        const Spacer(),
        Stack(
          children: [
            // Ícone de notificação
            IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: AppColors.black,
                size: 32,
              ),
              onPressed: () {},
            ),
            if (notificationCount > 0)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.blue_primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      notificationCount.toString().padLeft(2, '0'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
