import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:todo/model/task.dart';
import 'package:todo/ui/common/app_colors.dart';
import 'package:todo/ui/common/ui_helpers.dart';
import 'package:todo/ui/views/task/task_view.form.dart';

import 'task_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'title'),
  FormTextField(name: 'description'),
])
class TaskView extends StackedView<TaskViewModel> with $TaskView {
  final Task? task;
  const TaskView({Key? key, this.task}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TaskViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        title: Text(task == null ? "Create a Task" : "Edit your Task"),
        backgroundColor: kcAppBarColor,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Task Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            verticalSpaceMedium,
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: TextFormField(
                controller: descriptionController,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "Task Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            verticalSpaceMedium,
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kcAppBarColor),
                ),
                onPressed: task != null
                    ? () => viewModel.updateTask()
                    : () => viewModel.addTask(),
                child: Text(
                  task != null ? "Update" : "Add",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(TaskViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    if (task != null) {
      titleController.text = task!.title;
      descriptionController.text = task!.description;
      viewModel.setTask(task!);
    }
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(TaskViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  TaskViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TaskViewModel();
}
