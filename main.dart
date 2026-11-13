import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HalamanCatatan(),
  ));
}

class HalamanCatatan extends StatefulWidget {
  @override
  State<HalamanCatatan> createState() => _HalamanCatatanState();
}

class _HalamanCatatanState extends State<HalamanCatatan> {
  List<String> daftarTugas = [];
  List<bool> sudahSelesai = [];
  TextEditingController inputController = TextEditingController();

  void tambahTugas() {
    if (inputController.text.isNotEmpty) {
      setState(() {
        daftarTugas.add(inputController.text);
        sudahSelesai.add(false);
        inputController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Harian'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: InputDecoration(
                      hintText: 'Tulis tugas baru...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: tambahTugas,
                  child: Text('Simpan'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: daftarTugas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: sudahSelesai[index],
                      onChanged: (_) {
                        setState(() {
                          sudahSelesai[index] = !sudahSelesai[index];
                        });
                      },
                    ),
                    title: Text(
                      daftarTugas[index],
                      style: TextStyle(
                        decoration: sudahSelesai[index]
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          daftarTugas.removeAt(index);
                          sudahSelesai.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
