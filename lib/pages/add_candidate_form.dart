import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tp_election/models/candidate_dart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddCandidateForm extends StatefulWidget {
  const AddCandidateForm({super.key});

  @override
  State<AddCandidateForm> createState() => _AddCandidateFormState();
}

class _AddCandidateFormState extends State<AddCandidateForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _surname = '';
  String _party = '';
  String _bio = '';
  File? _image;
  DateTime? _birthdate;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final candidate = Candidate(
        name: _name,
        surname: _surname,
        party: _party,
        bio: _bio,
        image: _image,
        birthdate: _birthdate,
      );

      Navigator.pop(context, candidate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Création de candidat'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                  },
                  child: CircleAvatar(
                    radius: 150,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null ? const Icon(Icons.camera) : null,
                    backgroundColor: Colors.grey[100],
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Surname'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a surname';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _surname = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Parti politique'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a party';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _party = value!;
                  },
                  Icon()
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a biography';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _bio = value!;
                  },
                ),
                ListTile(
                  title: Text("Date de naissance"),
                  subtitle: Text("$_birthdate"),
                  trailing: Icon(Icons.calendar_month),
                  onTap: () async {
                    _birthdate = await showDatePicker(
                        cancelText: "Annuler",
                        confirmText: "Confirmer",
                        barrierColor: Colors.green.shade50,
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now());
                    setState(() {});
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: const Text('Sauvegarder'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
