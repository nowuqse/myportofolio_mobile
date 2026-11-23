import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Menyimpan input menggunakan variabel state
  String _title = "";
  String _description = "";
  String _category = "Internship";

  DateTime? _startDate;
  DateTime? _endDate;

  final List<String> _categories = [
    'Internship',
    'Research',
    'Volunteer',
    'Part-time',
    'Full-time',
    'Freelance',
  ];

  // Format tanggal menjadi YYYY-MM-DD
  String _formatDate(DateTime? date) {
    if (date == null) return 'Not selected';

    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '${date.year}-$month-$day';
  }

  // Memilih tanggal mulai
  Future<void> _selectStartDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (!mounted) return;

    if (selectedDate != null) {
      setState(() {
        _startDate = selectedDate;

        // End Date tidak boleh sebelum Start Date
        if (_endDate != null && _endDate!.isBefore(selectedDate)) {
          _endDate = null;
        }
      });
    }
  }

  // Memilih tanggal selesai
  Future<void> _selectEndDate() async {
    final firstDate = _startDate ?? DateTime(2000);

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _endDate ?? firstDate,
      firstDate: firstDate,
      lastDate: DateTime(2100),
    );

    if (!mounted) return;

    if (selectedDate != null) {
      setState(() {
        _endDate = selectedDate;
      });
    }
  }

  // Mengosongkan seluruh input form
  void _clearForm() {
    _formKey.currentState!.reset();

    setState(() {
      _title = "";
      _description = "";
      _category = "Internship";
      _startDate = null;
      _endDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Experience Form'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),

      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. EXPERIENCE TITLE
              TextFormField(
                maxLength: 255,
                decoration: const InputDecoration(
                  labelText: 'Experience Title',
                  hintText: 'Example: Software Engineer Intern',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Experience title cannot be empty!';
                  }

                  if (value.trim().length > 255) {
                    return 'Title cannot exceed 255 characters!';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              // 2. DESCRIPTION
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Describe your role and responsibilities',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Description cannot be empty!';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              // 3. CATEGORY
              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: _categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _category = value;
                    });
                  }
                },
                validator: (value) {
                  if (value == null || !_categories.contains(value)) {
                    return 'Please select a valid category!';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              // 4. START DATE
              FormField<DateTime>(
                validator: (_) {
                  if (_startDate == null) {
                    return 'Please select a start date!';
                  }

                  return null;
                },
                builder: (field) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            await _selectStartDate();

                            if (!mounted) return;

                            field.didChange(_startDate);
                          },
                          icon: const Icon(Icons.calendar_today),
                          label: Text('Start Date: ${_formatDate(_startDate)}'),
                        ),
                      ),

                      if (field.hasError)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            field.errorText!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 8),

              // 5. END DATE
              FormField<DateTime>(
                validator: (_) {
                  if (_startDate != null &&
                      _endDate != null &&
                      _endDate!.isBefore(_startDate!)) {
                    return 'End Date cannot be before Start Date!';
                  }

                  return null;
                },
                builder: (field) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            await _selectEndDate();

                            if (!mounted) return;

                            field.didChange(_endDate);
                          },
                          icon: const Icon(Icons.event_available),
                          label: Text(
                            'End Date: ${_endDate == null ? "Ongoing" : _formatDate(_endDate)}',
                          ),
                        ),
                      ),

                      if (field.hasError)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            field.errorText!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 16),

              // 6. CLEAR & SAVE BUTTON
              Row(
                children: [
                  // CLEAR BUTTON
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return AlertDialog(
                              title: const Text('Clear Form?'),
                              content: const Text(
                                'Are you sure you want to clear all inputs?',
                              ),
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
                      },
                      child: const Text('Clear'),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // SAVE BUTTON
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return AlertDialog(
                                title: const Text(
                                  'Experience added successfully!',
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Title: $_title'),
                                      Text('Description: $_description'),
                                      Text('Category: $_category'),
                                      Text(
                                        'Start Date: ${_formatDate(_startDate)}',
                                      ),
                                      Text(
                                        'End Date: ${_endDate == null ? "Ongoing" : _formatDate(_endDate)}',
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(dialogContext);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text('Save Experience'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
