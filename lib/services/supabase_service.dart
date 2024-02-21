import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/app/app.logger.dart';
import 'package:todo/model/task.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;
  final logger = getLogger("SupabaseService");

  //get all tasks from server
  Future<List<Task>> getAllTasks() async {
    List<Task> tasks = [];
    try {
      final data = await supabase.from("tasks").select();
      logger.i('All Tasks Fetched Successfully');
      return data.map((e) => Task.fromMap(e)).toList();
    } catch (e) {
      logger.e(e);
    }

    return tasks;
  }

  //Add the task on server
  addTask(Task task) async {
    try {
      await supabase.from("tasks").insert(task.toMap());
      logger.i("Added the task successfully");
    } catch (e) {
      logger.e(e);
    }
  }

  //update the task on server
  editTask(Task task) async {
    try {
      await supabase.from('tasks').update(task.toMap()).match({'id': task.id});
      logger.i("updated the task successfully");
    } catch (e) {
      logger.e(e);
    }
  }

  //Delete the task on server
  deleteTask(int id) async {
    try {
      await supabase.from("tasks").delete().match({'id': id});
      logger.i("The task deleted successfully");
    } catch (e) {
      logger.e(e);
    }
  }
}
