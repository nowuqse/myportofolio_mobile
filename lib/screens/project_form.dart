import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';


class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _projectName = "";
  String _description = "";
  String _category = "Web Development";
  String _technologies = "";
  String _projectLink = "";

  final List<String> _categories = [
    'Web Development',
    'Mobile Development',
    'UI/UX',
    'Project Management',
    'Game Development',
    'Other',
  ];

  // Mengosongkan seluruh input form
  void _clearForm() {
    _formKey.currentState!.reset();

    setState(() {
      _projectName = "";
      _description = "";
      _category = "Web Development";
      _technologies = "";
      _projectLink = "";
    });
  }

  // Menampilkan dialog konfirmasi sebelum menghapus form
  void _showClearConfirmation() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Clear Form?'),
          content: const Text('Are you sure you want to clear all inputs?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                _clearForm();
              },
              child: const Text('Clear'),
            ),
          ],
        );
      },
    );
  }

  // Menampilkan ringkasan input setelah validasi berhasil
  void _saveProject() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Project added successfully!'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Project Name: $_projectName'),
                  Text('Description: $_description'),
                  Text('Category: $_category'),
                  Text('Technologies: $_technologies'),
                  Text('Project Link: $_projectLink'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  _clearForm();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Project Form'),
        backgroundColor: Color(0xFFEF3D8B),
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
              // 1. PROJECT NAME
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLength: 255,
                  decoration: InputDecoration(
                    hintText: "Project Name",
                    labelText: "Project Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _projectName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Project name cannot be empty!";
                    }

                    if (value.trim().length > 255) {
                      return "Project name cannot exceed 255 characters!";
                    }

                    return null;
                  },
                ),
              ),

              // 2. PROJECT DESCRIPTION
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Project Description",
                    labelText: "Project Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Project description cannot be empty!";
                    }

                    return null;
                  },
                ),
              ),

              // 3. PROJECT CATEGORY
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  initialValue: _category,
                  decoration: InputDecoration(
                    labelText: "Project Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  items: _categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    if (newValue == null) return;

                    setState(() {
                      _category = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || !_categories.contains(value)) {
                      return "Please select a valid project category!";
                    }

                    return null;
                  },
                ),
              ),

              // 4. TECHNOLOGIES USED
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Example: Flutter, Django, Figma",
                    labelText: "Technologies Used",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _technologies = value;
                    });
                  },
                ),
              ),

              // 5. PROJECT LINK
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: "Project URL (optional)",
                    labelText: "Project Link",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _projectLink = value;
                    });
                  },
                  validator: (value) {
                    // Project Link bersifat opsional
                    if (value == null || value.trim().isEmpty) {
                      return null;
                    }

                    final uri = Uri.tryParse(value.trim());

                    if (uri == null ||
                        (uri.scheme != 'http' && uri.scheme != 'https') ||
                        uri.host.isEmpty ||
                        !uri.host.contains('.')) {
                      return "Please enter a valid URL (https://example.com)";
                    }

                    return null;
                  },
                ),
              ),

              const SizedBox(height: 16),

              // 6. CLEAR & SAVE BUTTON
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // CLEAR BUTTON
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _showClearConfirmation,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text('Clear'),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // SAVE BUTTON
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveProject,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
