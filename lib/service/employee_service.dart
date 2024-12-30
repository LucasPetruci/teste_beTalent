import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/employee.dart';

class EmployeeService {
  final CollectionReference employeesCollection =
      FirebaseFirestore.instance.collection('employees');

  // Buscar todos os funcionários
  Future<List<Employee>> fetchEmployees() async {
    try {
      QuerySnapshot snapshot = await employeesCollection.get();
      for (var doc in snapshot.docs) {
        print(doc.data());
      }
      return snapshot.docs
          .map((doc) => Employee.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Erro ao buscar funcionários: $e');
    }
  }
}
