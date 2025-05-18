import 'package:flutter/material.dart';

class StudentNutritionDetail extends StatefulWidget {
  final String schoolName;
  final String studentName;
  final String studentClass;
  final int heightCm;
  final double weightKg;
  final String nutritionStatus;

  const StudentNutritionDetail({
    super.key,
    required this.schoolName,
    this.studentName = '',
    this.studentClass = '',
    this.heightCm = 0,
    this.weightKg = 0,
    this.nutritionStatus = '',
  });

  @override
  State<StudentNutritionDetail> createState() => _StudentNutritionDetailState();
}

class _StudentNutritionDetailState extends State<StudentNutritionDetail> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _classController;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _statusController;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.studentName);
    _classController = TextEditingController(text: widget.studentClass);
    _heightController = TextEditingController(text: widget.heightCm > 0 ? widget.heightCm.toString() : '');
    _weightController = TextEditingController(text: widget.weightKg > 0 ? widget.weightKg.toString() : '');
    _statusController = TextEditingController(text: widget.nutritionStatus);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _classController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  Widget buildTextField(String label, TextEditingController controller, {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: Text("$label :")),
          Expanded(
            flex: 3,
            child: isEditing
                ? TextFormField(
                    controller: controller,
                    keyboardType: type,
                    decoration: const InputDecoration(isDense: true),
                  )
                : Text(controller.text.isNotEmpty ? controller.text : "-"),
          ),
        ],
      ),
    );
  }

  void _showAddStudentForm() {
    final tempNameController = TextEditingController();
    final tempClassController = TextEditingController();
    final tempHeightController = TextEditingController();
    final tempWeightController = TextEditingController();
    final tempStatusController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "Tambah Data Siswa",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              _buildInput("Nama Siswa", tempNameController),
              _buildInput("Kelas", tempClassController),
              _buildInput("Tinggi Badan(cm)", tempHeightController, type: TextInputType.number),
              _buildInput("Berat Badan(kg)", tempWeightController, type: TextInputType.number),
              _buildInput("Status Gizi", tempStatusController),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _nameController.text = tempNameController.text;
                _classController.text = tempClassController.text;
                _heightController.text = tempHeightController.text;
                _weightController.text = tempWeightController.text;
                _statusController.text = tempStatusController.text;
              });
              Navigator.pop(context);
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController controller, {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: label,
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text("Data Siswa"),
        centerTitle: true,
        backgroundColor: Colors.teal[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _showAddStudentForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[900],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text("Tambah Data Siswa"),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildTextField("Nama Siswa", _nameController),
                    buildTextField("Kelas", _classController),
                    buildTextField("Tinggi Badan(cm)", _heightController, type: TextInputType.number),
                    buildTextField("Berat Badan(kg)", _weightController, type: TextInputType.number),
                    buildTextField("Status Gizi", _statusController),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isEditing = !isEditing;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[900],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text(isEditing ? "Simpan" : "Edit"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Absen'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }
}
