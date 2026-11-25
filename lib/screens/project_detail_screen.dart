import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Category: ${project.category.toUpperCase()}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Menampilkan Info Bintang
            Row(
              children: [
                Icon(
                  project.isStarred ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                const SizedBox(width: 4),
                Text(
                  '${project.starCount} Stars',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // Menampilkan nama yang nge-star (jika ada)
            if (project.starredByNames.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                'Starred by: ${project.starredByNames}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],

            const Divider(height: 32),
            Text(project.description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
