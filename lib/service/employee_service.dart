import 'dart:convert';

import '../model/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  final String baseUrl = 'http://10.0.2.2:8080/employees';

  Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      print('base url: $baseUrl');
      print('response: ${response.body}');

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
