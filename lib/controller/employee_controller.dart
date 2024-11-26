import 'package:flutter/foundation.dart';

import '../model/employee.dart';
import '../service/employee_service.dart';

class EmployeeController {
  final EmployeeService _employeeService;
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  //search
  final ValueNotifier<List<Employee>> filteredEmployeesNotifier =
      ValueNotifier([]);
  final ValueNotifier<List<Employee>> employeesNotifier = ValueNotifier([]);

  EmployeeController(this._employeeService);

  //get employees
  Future<List<Employee>> fetchEmployees() async {
    isLoadingNotifier.value = true;

    try {
      return await _employeeService.fetchEmployees();
    } catch (e) {
      throw Exception('Error in EmployeeController: $e');
    } finally {
      isLoadingNotifier.value = false;
    }
  }

  //search employees
  void filterEmployees(String query) {
    final employeeQuery = query.toLowerCase();
    filteredEmployeesNotifier.value = employeesNotifier.value.where((employee) {
      return employee.name.toLowerCase().contains(employeeQuery) ||
          employee.job.toLowerCase().contains(employeeQuery) ||
          employee.admissionDate.toLowerCase().contains(employeeQuery) ||
          employee.phone.toLowerCase().contains(employeeQuery);
    }).toList();
  }
}
