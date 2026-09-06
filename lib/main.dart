import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amaan Patel Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
        fontFamily: 'Roboto',
        cardTheme: CardThemeData(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ----------------------- HOME PAGE -----------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.indigo,
                    child: Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Amaan Patel',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'AI Analyst',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 8,
                    children: const [
                      InfoTag(icon: Icons.school, text: 'CR RAO AIMSCS'),
                      InfoTag(icon: Icons.calendar_today, text: '3rd Year'),
                      InfoTag(icon: Icons.memory, text: 'CSE AI/ML'),
                      InfoTag(icon: Icons.location_on, text: 'Hyderabad'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Hi, I\'m Amaan, a 3rd year AI/ML student passionate '
                        'about Deep Learning and Computer Vision. I enjoy '
                        'building intelligent systems that solve real-world '
                        'problems using PyTorch and modern ML tools.',
                        style: TextStyle(fontSize: 15, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      bool isNarrow = constraints.maxWidth < 400;
                      final buttons = [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutPage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.person_outline),
                          label: const Text('About Me'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProjectsPage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.work_outline),
                          label: const Text('My Projects'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                          ),
                        ),
                      ];
                      return isNarrow
                          ? Column(
                              children: [
                                buttons[0],
                                const SizedBox(height: 12),
                                buttons[1],
                              ],
                            )
                          : Wrap(
                              spacing: 16,
                              runSpacing: 12,
                              alignment: WrapAlignment.center,
                              children: buttons,
                            );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoTag extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoTag({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.indigo),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

// ----------------------- ABOUT ME PAGE -----------------------
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const List<String> languages = ['Python', 'C', 'SQL'];
  static const List<String> technologies = [
    'PyTorch',
    'scikit-learn',
    'Hugging Face',
    'NumPy',
    'Pandas',
    'TensorFlow',
  ];
  static const List<String> interests = [
    'Deep Learning',
    'Computer Vision',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Amaan Patel',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'AI Analyst',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 16),
                          _DetailRow(icon: Icons.school, label: 'College', value: 'CR RAO AIMSCS'),
                          _DetailRow(icon: Icons.calendar_today, label: 'Year', value: '3rd Year'),
                          _DetailRow(icon: Icons.memory, label: 'Branch', value: 'CSE AI/ML'),
                          _DetailRow(icon: Icons.location_on, label: 'Location', value: 'Hyderabad'),
                          SizedBox(height: 12),
                          Text(
                            'Passionate about building intelligent, real-world '
                            'AI systems, with a strong focus on deep learning '
                            'and computer vision applications.',
                            style: TextStyle(fontSize: 14, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SectionTitle(title: 'Programming Languages', icon: Icons.code),
                  const SizedBox(height: 10),
                  SkillWrap(items: languages),
                  const SizedBox(height: 24),
                  const SectionTitle(title: 'Technologies & Frameworks', icon: Icons.build),
                  const SizedBox(height: 10),
                  SkillWrap(items: technologies),
                  const SizedBox(height: 24),
                  const SectionTitle(title: 'Areas of Interest', icon: Icons.lightbulb_outline),
                  const SizedBox(height: 10),
                  SkillWrap(items: interests),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _DetailRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.indigo),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  const SectionTitle({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.indigo),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class SkillWrap extends StatelessWidget {
  final List<String> items;
  const SkillWrap({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: items
          .map((item) => Chip(
                label: Text(item),
                backgroundColor: Colors.indigo.shade50,
                labelStyle: const TextStyle(color: Colors.indigo),
              ))
          .toList(),
    );
  }
}

// ----------------------- PROJECTS PAGE -----------------------
class ProjectData {
  final String title;
  final String description;
  final List<String> tech;
  final IconData icon;

  const ProjectData({
    required this.title,
    required this.description,
    required this.tech,
    required this.icon,
  });
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const List<ProjectData> projects = [
    ProjectData(
      title: 'Real-Time Drowsiness & Fatigue Detection System',
      description:
          'A computer vision system that monitors facial cues in real time '
          'to detect signs of drowsiness and fatigue, aimed at improving '
          'driver and workplace safety.',
      tech: ['Computer Vision', 'PyTorch', 'OpenCV'],
      icon: Icons.visibility,
    ),
    ProjectData(
      title: 'Medical Image Classification via Transfer Learning',
      description:
          'A transfer learning based model that classifies medical images '
          'to assist in faster and more accurate diagnostic support.',
      tech: ['PyTorch', 'scikit-learn'],
      icon: Icons.local_hospital,
    ),
    ProjectData(
      title: 'Hugging Face Vision Transformer (ViT) Fine-Tuner',
      description:
          'A fine-tuning pipeline for Vision Transformer models using '
          'Hugging Face, enabling custom image classification tasks.',
      tech: ['Hugging Face', 'PyTorch', 'Transformers'],
      icon: Icons.hub,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              int columns;
              if (constraints.maxWidth >= 900) {
                columns = 3;
              } else if (constraints.maxWidth >= 600) {
                columns = 2;
              } else {
                columns = 1;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: columns == 1 ? 1.6 : 0.95,
                ),
                itemBuilder: (context, index) {
                  return ProjectCard(project: projects[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final ProjectData project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.indigo.shade50,
              child: Icon(project.icon, color: Colors.indigo),
            ),
            const SizedBox(height: 12),
            Text(
              project.title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                project.description,
                style: const TextStyle(fontSize: 12.5, height: 1.4),
                overflow: TextOverflow.fade,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: project.tech
                  .map((t) => Chip(
                        label: Text(t, style: const TextStyle(fontSize: 11)),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        backgroundColor: Colors.indigo.shade50,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
