import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'campo obrigatorio';
                  } else {
                    return null;
                  }
                },
                controller: taskController,
                decoration: const InputDecoration(
                  labelText: 'Add Item',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  debugPrint('cadastrou');
                  Navigator.pop(context, taskController.text);
                } else {
                  debugPrint('erro');
                }
              },
              child: const Text('Salvar'),
            )
          ]),
        ),
      ),
    );
  }
}
