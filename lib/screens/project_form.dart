import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  // Sesuaikan kategori dengan pilihan di models.py Django
  String _category = 'web';
  final List<Map<String, String>> _categories = [
    {'value': 'ui/ux', 'label': 'UI/UX Design'},
    {'value': 'web', 'label': 'Web Development'},
    {'value': 'business', 'label': 'Business'},
  ];

  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    // 1. Validasi form
    if (!_formKey.currentState!.validate()) return;

    // 2. Pastikan user sudah login
    final isAuthorized = await ensureLoggedIn(context);
    if (!isAuthorized || !mounted) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      // 3. Buat object Project baru
      final newProject = Project(
        title: _titleController.text,
        description: _descController.text,
        category: _category,
      );

      // 4. Ambil token
      final token = context.read<AuthState>().token!;

      // 5. Kirim ke API Django
      await context.read<ApiClient>().createProject(newProject, token: token);

      if (!mounted) return;

      // 6. Tampilkan dialog sukses
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Project added successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx); // Tutup dialog
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } on ApiException catch (e) {
      if (!mounted) return;

      // 7. Tangani error (401 = token expired)
      if (e.statusCode == 401 || e.statusCode == 403) {
        await context.read<AuthState>().logout();
        
        // PERBAIKAN: Menggunakan mounted milik State, bukan context.mounted
        if (!mounted) return; 
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Session expired. Please login again.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create project: ${e.message}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Project Form'),
        backgroundColor: const Color(0xFFEF3D8B),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. TITLE
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _titleController,
                  maxLength: 255,
                  decoration: const InputDecoration(
                    labelText: "Project Title",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Title cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // 2. DESCRIPTION
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _descController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Description cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // 3. CATEGORY (Dropdown)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  initialValue: _category, 
                  decoration: const InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(),
                  ),
                  items: _categories.map((cat) {
                    return DropdownMenuItem<String>(
                      value: cat['value'],
                      child: Text(cat['label']!),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _category = value;
                      });
                    }
                  },
                ),
              ),

              const SizedBox(height: 16),

              // 4. SAVE BUTTON
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Save Project'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}