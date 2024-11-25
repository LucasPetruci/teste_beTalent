import 'package:flutter/foundation.dart';

import '../model/employee.dart';
import '../service/employee_service.dart';

class EmployeeController {
  final EmployeeService _employeeService;
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

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
}
