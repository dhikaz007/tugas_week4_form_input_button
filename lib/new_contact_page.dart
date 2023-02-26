import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_week4_form_input_button/contacts_home.dart';

// TextFormField Widget

class NewContactPage extends StatefulWidget {
  const NewContactPage({super.key});

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  // Inisialisasi parameter
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String msg = '';

  // Parameter untuk menyimpan sementara data textformfiled
  var formKey = GlobalKey<FormState>();
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Contact'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                    // Form untuk mengisi nama depan
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                      controller: fnameController,
                      decoration: InputDecoration(
                          labelText: 'First Name',
                          border: const OutlineInputBorder(),
                          hintText: 'Input first name',
                          prefixIcon: const Icon(Icons.person_outline),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          )),
                    ),
                  ),
                ),
                //SizedBox(width: 8.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 4.0),
                    // Form untuk mengisi nama belakang
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      controller: lnameController,
                      decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: const OutlineInputBorder(),
                          hintText: 'Input last name',
                          prefixIcon: const Icon(Icons.person_outline),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // Form untuk mengisi nomor telepon
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                controller: phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLength: 13,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.smartphone),
                    labelText: 'Phone Number',
                    border: const OutlineInputBorder(),
                    hintText: 'Input phone number',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    )),
              ),
            ),
            const SizedBox(height: 28.0),
            // Tombol untuk menampilkan data yang sudah di isi
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {});
                  var fname = fnameController.text;
                  var lname = lnameController.text;
                  var phone = phoneController.text;
                  msg = 'Fullname : $fname $lname\nPhone Number : $phone';

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Done')),
                  );
                }
              },
              child: const Text(
                'SUBMIT',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16.0),
            // Tombol untuk kembali ke halaman sebelumnya
            ElevatedButton(
                child: const Text('Back'),
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactsHome()));
                }),
            const SizedBox(height: 28.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                // Menampilkan data yang sudah di isi ke layar
                child: Text(
                  msg,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
