import 'package:flutter/material.dart';
import 'package:state_management/models/record.dart';
import 'package:state_management/pages/record_page.dart';
import 'package:state_management/repository.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key, required this.repository}) : super(key: key);

  final Repository repository;

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {

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
      appBar: AppBar(title: Text('Records Page')),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
          fontSize: 20,
        ),
        child: Center(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(color: Colors.black),
            itemCount: widget.repository.records.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Text('This is the records page');
              }
              final record = widget.repository.records[index - 1];
              return ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return RecordPage(record: record, repository: widget.repository);
                },)),
                key: ObjectKey(record),
                leading: IconButton(
                  onPressed: () {
                    print('pressed ${index - 1}');
                    widget.repository.replaceRecord(
                      record,
                      Record.withFavorite(record, !record.isFavorite),
                    );
                    // record.isFavorite = !record.isFavorite;
                  },
                  icon: record.isFavorite
                      ? const Icon(Icons.favorite, color: Colors.red,)
                      : const Icon(Icons.favorite_border),
                ),
                title: Text(
                  record.title,
                ),
                subtitle: Text(
                  record.details,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
