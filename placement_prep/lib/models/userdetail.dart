class Userdetails {
  String name;
  String roll;
  String department;
  String year;
  String interestType;


  Userdetails(
      this.name,
      this.roll,
      this.department,
      this.year,
      this.interestType
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'roll': roll,
    'department': department,
    'year': year,
    'interestType': interestType,
  };
}