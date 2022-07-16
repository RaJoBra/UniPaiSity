class UniversitatsModel {
  final String id;
  final int createdAt;
  final String Name;
  final String Information;
  final num TuitionFee;
  final List<String> PartnerUniversity;
  bool isSeen = false;

  UniversitatsModel( {required this.id, required this.createdAt, required this.Name, required this.Information, required this.TuitionFee, required this.PartnerUniversity});

  factory UniversitatsModel.fromJson(Map<String, dynamic> json) {
    return UniversitatsModel(
      id: json['id'],
      createdAt: json['createdAt'],
      Name: json['Name'],
      Information: json['Information'],
      TuitionFee: json['TuitionFee'],
      PartnerUniversity: json['PartnerUniversity'],);
  }
}