import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:be_talent/theme/app_colors.dart';
import 'package:be_talent/theme/app_font.dart';
import '../model/employee.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray10, width: 1.0)),
      ),
      child: ExpansionTile(
        leading: ClipOval(
          child: CachedNetworkImage(
            imageUrl: employee.image,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) {
              print('Erro ao carregar imagem: $error');
              return const Icon(Icons.error);
            },
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        title: Text(
          employee.name,
          style: AppFont.h3(color: AppColors.black),
        ),
        trailing: const Icon(Icons.arrow_drop_down),
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cargo: ${employee.job}',
                  // style: AppFont.body(color: AppColors.gray80),
                ),
                const SizedBox(height: 8),
                Text(
                  'Data de Admissão: ${employee.admissionDate}',
                  // style: AppFont.body(color: AppColors.gray80),
                ),
                const SizedBox(height: 8),
                Text(
                  'Telefone: ${employee.phone}',
                  // style: AppFont.body(color: AppColors.gray80),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
