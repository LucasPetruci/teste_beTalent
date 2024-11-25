import '../model/employee.dart';
import '../service/employee_service.dart';

class EmployeeController {
  final EmployeeService _employeeService;

  EmployeeController(this._employeeService);

  Future<List<Employee>> fetchEmployees() async {
    try {
      return await _employeeService.fetchEmployees();
    } catch (e) {
      throw Exception('Error in EmployeeController: $e');
    }
  }
}
