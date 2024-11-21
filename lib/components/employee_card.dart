import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:be_talent/theme/app_colors.dart';
import 'package:be_talent/theme/app_font.dart';
import '../model/employee.dart';

class EmployeeCard extends StatefulWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray10, width: 1.0)),
      ),
      child: ExpansionTile(
        leading: ClipOval(
          child: CachedNetworkImage(
            imageUrl: widget.employee.image,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) {
              print('Erro ao carregar imagem: $error');
              return const Icon(Icons.error);
            },
            fit: BoxFit.cover,
            width: 40,
            height: 40,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            widget.employee.name,
            style: AppFont.h3(color: AppColors.black),
          ),
        ),
        trailing: Icon(
          isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: AppColors.blue_primary,
          size: 30,
        ),
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Cargo',
                      style: AppFont.h2(color: AppColors.black),
                    ),
                    Spacer(),
                    Text(
                      widget.employee.job,
                      style: AppFont.h3(color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Data de admissão',
                      style: AppFont.h2(color: AppColors.black),
                    ),
                    Spacer(),
                    Text(
                      widget.employee.formattedAdmissionDate,
                      style: AppFont.h3(color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Telefone',
                      style: AppFont.h2(color: AppColors.black),
                    ),
                    Spacer(),
                    Text(
                      widget.employee.formattedPhone,
                      style: AppFont.h3(color: AppColors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
      ),
    );
  }
}
