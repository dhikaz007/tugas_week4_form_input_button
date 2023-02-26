import 'package:flutter/material.dart';
import 'package:tugas_week4_form_input_button/new_contact_page.dart';

class ContactsHome extends StatefulWidget {
  const ContactsHome({super.key});

  @override
  State<ContactsHome> createState() => _ContactsHomeState();
}

class _ContactsHomeState extends State<ContactsHome> {
  // Membuat daftar kontak berupa list
  final List<Map<String, String>> cLists = [
    {"first name": "Caleb", "last name": "Rivera", "phone": "(555) 123-4567"},
    {"first name": "Isabella", "last name": "White", "phone": "(555) 234-5678"},
    {"first name": "Jackson", "last name": "Palel", "phone": "(555) 345-6789"},
    {"first name": "Mia", "last name": "Lee", "phone": "(555) 456-7890"},
    {"first name": "Owen ", "last name": "Wright", "phone": "(555) 567-8901"},
    {"first name": "Benjamin ", "last name": "Chen", "phone": "(555) 678-9012"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Contacts Phone'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
        itemCount: cLists.length,
        itemBuilder: (context, index) {
          return ListTile(
            // Membuat avatar kontak sesuai dengan nama awalan pada kontak
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(
                cLists[index]['first name']![0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            // Menampilkan nama kontak
            title: Text(
              '${cLists[index]['first name']!} ${cLists[index]['last name']!}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            // Menampilkan telepan kontak
            subtitle: Text(cLists[index]['phone']!),
          );
        },
      ),
      // Tombol ke halaman selanjutnya untuk membuat daftar kontak baru
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const NewContactPage()));
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
