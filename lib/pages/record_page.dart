import 'package:flutter/material.dart';
import 'package:state_management/models/record.dart';
import 'package:state_management/pages/record_edit_page.dart';
import 'package:state_management/repository.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key, required this.record, required this.repository}) : super(key: key);

  final Record record;
  final Repository repository;

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  void initState() {
    super.initState();
    widget.repository.addListener(recordsUpdated);
  }

  @override
  void dispose() {
    super.dispose();
    widget.repository.removeListener(recordsUpdated);
  }

  void recordsUpdated() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RecordEditPage(record: widget.record, repository: widget.repository),
              ));
              print('edit');
            },
            icon: Icon(Icons.edit),
          ),
        ],
        title: Row(
          children: [
            Text(
              widget.record.title,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(width: 8.0),
            if (widget.record.isFavorite) const Icon(Icons.favorite)
          ],
        ),
      ),
      body: Center(
        child: Text(
          widget.record.details,
          style: const TextStyle(
            fontSize: 26,
          ),
        ),
      ),
    );
  }
}
