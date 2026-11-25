import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart'; // Import ini
import 'package:myportofolio_mobile/widgets/auth_guard.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final LinearGradient gradient;
  final Color border;

  const ItemHomepage(this.name, this.icon, this.gradient, this.border);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          gradient: item.gradient,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: item.border, width: 1.5),
        ),
        child: InkWell(
          onTap: () async {
            if (item.name == "View Projects") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProjectListScreen(),
                ),
              );
            } else if (item.name == "Add Project") {
              final isAuthorized = await ensureLoggedIn(context);
              if (isAuthorized && context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProjectFormPage(),
                  ),
                );
              }
            } else if (item.name == "Add Experience") {
              final isAuthorized = await ensureLoggedIn(context);
              if (isAuthorized && context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExperienceFormPage(),
                  ),
                );
              }
            }
            // Note: "View Experiences" belum ada halamannya, jadi belum di-handle
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, color: Colors.black87, size: 30.0),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
