import 'package:flutter/material.dart';
import 'package:state_management/models/record.dart';
import 'package:state_management/repository.dart';

class RecordEditPage extends StatefulWidget {
  const RecordEditPage({Key? key, required this.record, required this.repository}) : super(key: key);

  final Record record;
  final Repository repository;

  @override
  State<RecordEditPage> createState() => _RecordEditPageState();
}

class _RecordEditPageState extends State<RecordEditPage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String details;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    title = widget.record.title;
    details = widget.record.details;
    isFavorite = widget.record.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${widget.record.title}'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(child: Text('edit')),
              TextFormField(
                initialValue: title,
                onSaved: (val) {
                  setState(() {
                    title = val ?? '';
                  });
                },
                validator: (val) {
                  if (val!.length < 2) {
                    return 'you can\'t have a title shorter than 2 chars';
                  }
                  return null;
                },
                decoration: InputDecoration(label: Text('Title')),
              ),
              TextFormField(
                maxLines: 5,
                initialValue: details,
                onSaved: (val) {
                  setState(() {
                    details = val ?? '';
                  });
                },
                validator: (val) {
                  if (val!.length < 2) {
                    return 'you can\'t have details shorter than 2 chars';
                  }
                  return null;
                },
                decoration: InputDecoration(label: Text('Title')),
              ),
              Row(
                children: [
                  Checkbox(value: isFavorite, onChanged: (val) {
                    setState(() {
                      isFavorite = val!;
                    });
                  }),
                  const Text('favourite'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  print(title);
                  print(details);
                  print(isFavorite);

                  widget.repository.replaceRecord(widget.record,
                    Record(
                      title: title,
                      details: details,
                      isFavorite: isFavorite,
                    ),
                  );

                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
