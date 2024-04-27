import 'package:flutter/material.dart';
import '../models/candidate_dart.dart';
import 'add_candidate_form.dart';

class HomeCandidatePage extends StatefulWidget {
  const HomeCandidatePage({super.key});

  @override
  State<HomeCandidatePage> createState() => _HomeCandidatePageState();
}

class _HomeCandidatePageState extends State<HomeCandidatePage> {
  String name = "";
  bool liked = false;
  List<Candidate> candidates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '                            Elections 🇧🇯🇧🇯',
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 25),
        ),
        actions: [
          SizedBox(
            width: 48.0,
            height: 48.0,
            child: Padding(
              padding: EdgeInsets.only(right: 15.0),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: candidates.length,
                itemBuilder: (context, index) {
                  Candidate candidate = candidates[index];
                  return Card(
                    margin: EdgeInsets.all(10.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: candidate.image != null
                                ? Image.file(
                                    candidate.image!,
                                    width: 80.0,
                                    height: 80.0,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    'https://guardian.ng/wp-content/uploads/2022/06/Adebayo-2.jpg',
                                    width: 80.0,
                                    height: 80.0,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${candidate.name} ${candidate.surname}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  "${candidate.party}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Candidats',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Vote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Candidate candidate = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCandidateForm(),
              ));

          setState(() => candidates.add(candidate));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
