import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/app/app.logger.dart';
import 'package:todo/model/task.dart';

class SupabaseService {
  final _supabase = Supabase.instance.client;
  final _logger = getLogger("SupabaseService");

  //get all tasks from server
  Future<List<Task>> getAllTasks() async {
    List<Task> tasks = [];
    try {
      final data = await _supabase.from("todo_table").select();
      _logger.i('All tasks fetched successfully');
      return data.map((e) => Task.fromMap(e)).toList();
    } catch (e) {
      _logger.e(e);
    }

    return tasks;
  }

  //Add the task to database
  addTask(Task task) async {
    try {
      await _supabase.from("todo_table").insert(task.toMap());
      _logger.i("Added the task successfully");
    } catch (e) {
      _logger.e(e);
    }
  }

  //update the task on server
  editTask(Task task) async {
    try {
      await _supabase
          .from('todo_table')
          .update(task.toMap())
          .match({'id': task.id});
      _logger.i("updated the task successfully");
    } catch (e) {
      _logger.e(e);
    }
  }

  //Delete the task on server
  deleteTask(int id) async {
    try {
      await _supabase.from("todo_table").delete().match({'id': id});
      _logger.i("The task deleted successfully");
    } catch (e) {
      _logger.e(e);
    }
  }
}
