import 'dart:convert';
import '../model/employee.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class EmployeeService {
  Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse(Constant.baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final employees = data.map((e) => Employee.fromJson(e)).toList();
        return employees;
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      throw Exception('Error fetching employees: $e');
    }
  }
}
