class Employee {
  final String name;
  final String job;
  final String admissionDate;
  final String phone;
  final String image;

  Employee({
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      job: json['job'],
      admissionDate: json['admission_date'],
      phone: json['phone'],
      image: json['image'],
    );
  }

  //format date to DD/MM/YYYY
  String get formattedAdmissionDate {
    try {
      final DateTime parsedDate = DateTime.parse(admissionDate);
      final String day = parsedDate.day.toString().padLeft(2, '0');
      final String month = parsedDate.month.toString().padLeft(2, '0');
      final String year = parsedDate.year.toString();
      return '$day/$month/$year';
    } catch (e) {
      return 'Data inválida';
    }
  }

  //format phone number to + 55 (XX) XXXXX-XXXX
  String get formattedPhone {
    try {
      final String contryCode = phone.substring(0, 2);
      final String ddd = phone.substring(2, 4);
      final String firstPart = phone.substring(4, 9);
      final String secondPart = phone.substring(9);
      return '+$contryCode ($ddd) $firstPart-$secondPart';
    } catch (e) {
      return 'Telefone inválido';
    }
  }

  @override
  String toString() {
    return 'Employee{ name: $name, job: $job, admissionDate: $formattedAdmissionDate, phone: $formattedPhone, image: $image}';
  }
}
