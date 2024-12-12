import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceLibraryScreen extends StatefulWidget {
  @override
  _ResourceLibraryScreenState createState() => _ResourceLibraryScreenState();
}

class _ResourceLibraryScreenState extends State<ResourceLibraryScreen> {
  List<Resource> resources = [
    Resource(
      className: 'Class 9',
      resources: [
        ResourceItem(
          title: 'Mathematics Notes',
          url: 'https://example.com/math-notes.pdf',
          type: ResourceType.pdf,
        ),
        ResourceItem(
          title: 'Science Article',
          url: 'https://example.com/science-article',
          type: ResourceType.article,
        ),
      ],
    ),
    Resource(
      className: 'Class 10',
      resources: [
        ResourceItem(
          title: 'English Notes',
          url: 'https://example.com/english-notes.pdf',
          type: ResourceType.pdf,
        ),
        ResourceItem(
          title: 'History Article',
          url: 'https://example.com/history-article',
          type: ResourceType.article,
        ),
      ],
    ),
    Resource(
      className: 'Class 11',
      resources: [
        ResourceItem(
          title: 'Physics Notes',
          url: 'https://example.com/physics-notes.pdf',
          type: ResourceType.pdf,
        ),
        ResourceItem(
          title: 'Chemistry Article',
          url: 'https://example.com/chemistry-article',
          type: ResourceType.article,
        ),
      ],
    ),
    Resource(
      className: 'Class 12',
      resources: [
        ResourceItem(
          title: 'Biology Notes',
          url: 'https://example.com/biology-notes.pdf',
          type: ResourceType.pdf,
        ),
        ResourceItem(
          title: 'Computer Science Article',
          url: 'https://example.com/computer-science-article',
          type: ResourceType.article,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resource Library'),
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(resources[index].className),
            children: resources[index].resources.map((resource) {
              return ListTile(
                title: Text(resource.title),
                onTap: () async {
                  if (resource.type == ResourceType.pdf) {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PdfViewerScreen(resource.url)),
                    );
                  } else {
                    await launch(resource.url);
                  }
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class Resource {
  String className;
  List<ResourceItem> resources;

  Resource({required this.className, required this.resources});
}

class ResourceItem {
  String title;
  String url;
  ResourceType type;

  ResourceItem({required this.title, required this.url, required this.type});
}

enum ResourceType { pdf, article }

class PdfViewerScreen extends StatelessWidget {
  final String url;

  PdfViewerScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: SfPdfViewer.network(url),
    );
  }
}