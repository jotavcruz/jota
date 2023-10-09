import 'package:flutter/material.dart';
import 'package:todo_list_lvppl/pages/add_item_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de tarefas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                _buildContainer(list[index], index+1),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          final taskItem = await 
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const TodoListPage();
              },
            ),

          );
          if (taskItem != null){
          
            setState(() {  
              list.add(taskItem);
              
            });
          }
          
          
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _buildContainer(String text, int index) {
    return Container(
      
      height: 80,
      color: Colors.white,
      child: Center(
        child: Row(
          children: [
            Text(index.toString(),
            style: const TextStyle(fontSize: 30),
            ),

            Text(
              ' - $text', 
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
