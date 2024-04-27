import 'dart:io';

class Candidate {
  final String name;
  final String surname;
  final String party;
  final String bio;
  final File? image;
  final DateTime? birthdate;

  Candidate({
    required this.name,
    required this.surname,
    required this.party,
    required this.bio,
    this.image,
    required this.birthdate,
  });
  
}



