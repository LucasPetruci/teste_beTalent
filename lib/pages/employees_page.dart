import 'package:be_talent/controller/employee_controller.dart';
import 'package:be_talent/model/employee.dart';
import 'package:be_talent/service/employee_service.dart';
import 'package:be_talent/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:be_talent/theme/app_colors.dart';
import 'package:be_talent/components/base_menu.dart';

import '../components/employee_card.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  final EmployeeController _employeeController =
      EmployeeController(EmployeeService());
  List<Employee> employees = [];

  List<Employee> filteredEmployees = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getEmployees();
    searchController.addListener(filterEmployees);
  }

  Future<void> filterEmployees() async {
    final query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredEmployees = employees;
      }
      filteredEmployees = employees.where((employee) {
        return employee.name.toLowerCase().contains(query) ||
            employee.job.toLowerCase().contains(query) ||
            employee.admissionDate.toLowerCase().contains(query) ||
            employee.phone.toLowerCase().contains(query);
      }).toList();
    });
  }

  Future<void> getEmployees() async {
    try {
      _employeeController.isLoadingNotifier.value = true;
      final fetchedEmployees = await _employeeController.fetchEmployees();
      setState(() {
        employees = fetchedEmployees;
        filteredEmployees = fetchedEmployees;
      });
    } catch (e) {
      print('Erro ao buscar funcionários: $e');
    } finally {
      _employeeController.isLoadingNotifier.value = false;
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(16),
          child: BaseMenu(notificationCount: 2),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ValueListenableBuilder<bool>(
          valueListenable: _employeeController.isLoadingNotifier,
          builder: (context, isLoading, child) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Funcionários',
                    style: AppFont.h1(color: AppColors.black),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 12),
                  // Barra de pesquisa
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Pesquisar',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(
                          color: AppColors.gray10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray10, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: filteredEmployees.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Nenhum funcionário encontrado',
                              style: AppFont.h2(color: AppColors.gray10),
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Cabeçalho da lista
                              Container(
                                height: 47,
                                decoration: BoxDecoration(
                                  color: AppColors.gray10,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 24),
                                    Text("Foto",
                                        style:
                                            AppFont.h2(color: AppColors.black)),
                                    const SizedBox(width: 34),
                                    Text("Nome",
                                        style:
                                            AppFont.h2(color: AppColors.black)),
                                    const Spacer(),
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 36),
                                  ],
                                ),
                              ),
                              // Lista de funcionários
                              ListView.builder(
                                itemCount: filteredEmployees.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return EmployeeCard(
                                      employee: filteredEmployees[index]);
                                },
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
