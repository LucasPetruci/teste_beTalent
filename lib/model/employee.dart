class Employee {
  final int id;
  final String name;
  final String job;
  final String admissionDate;
  final String phone;
  final String image;

  Employee({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      job: json['job'],
      admissionDate: json['admission_date'],
      phone: json['phone'],
      image: json['image'],
    );
  }
  @override
  String toString() {
    return 'Employee{id: $id, name: $name, job: $job, admissionDate: $admissionDate, phone: $phone, image: $image}';
  }
}
