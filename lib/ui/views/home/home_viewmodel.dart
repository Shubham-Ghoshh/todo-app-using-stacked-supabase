import 'package:todo/app/app.locator.dart';
import 'package:todo/app/app.router.dart';
import 'package:todo/model/task.dart';
import 'package:todo/services/supabase_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  bool _loading = false;
  List<Task> _tasks = [];
  final _supabaseService = locator<SupabaseService>();
  final _navigationService = locator<NavigationService>();

  bool get isLoading => _loading;
  List<Task> get getTasks => _tasks;

  //Get List of all the tasks
  getAllTasks() async {
    _loading = true;
    _tasks = await _supabaseService.getAllTasks();
    _loading = false;
    rebuildUi();
  }

  //Navigate to task screen with task to edit it
  //also onback callback is provided for returning back to screen
  editTask(Task task) {
    // await _navigationService.navigateToTaskView(task: task).then((value) {
    //   getAllTasks();
    // });
  }

  //Navigate to task screen to add it
  //also onback callback is provided for returning back to screen

  addTask() async {
    await _navigationService.navigateToTaskView().then((value) {
      getAllTasks();
    });
  }

// Delete task from Home Screen
  deleteTask(int id) async {
    await _supabaseService.deleteTask(id);

    getAllTasks();
    rebuildUi();
  }
}
