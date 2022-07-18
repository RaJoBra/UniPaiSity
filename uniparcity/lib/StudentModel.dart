class Student {
  final String Name;
  final String Firstname;
  final String StudySpecilization;
  final String PhoneNumber;
  final String eMailAdress;
  int? CreatedAt;
  String? SelectedUniversityID;
  String? id;

  Student({
    required this.Name,
    required this.Firstname,
    required this.StudySpecilization,
    required this.PhoneNumber,
    required this.eMailAdress,
    CreatedAt,
    id,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      Name: json['Name'],
      Firstname: json['Firstname'],
      StudySpecilization: json['StudySpecialization'],
      PhoneNumber: json['Telefonnummer'],
      eMailAdress: json['E-MailAdresse'],
      CreatedAt: json['createdAt'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'Name': Name,
        'Firstname': Firstname,
        'Study Specilization': StudySpecilization,
        'Phone Number': PhoneNumber,
        'E-Mail Adress': eMailAdress,
        'Create At': CreatedAt,
        'SelectedUnivistery': SelectedUniversityID,
        'id': id,
      };
}
