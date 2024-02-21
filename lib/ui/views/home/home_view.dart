import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/ui/common/app_colors.dart';
import 'package:todo/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        title: const Text("Todo"),
        backgroundColor: kcAppBarColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: viewModel.isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  verticalSpaceTiny,
                  Text(
                    "Tasks are Loading....",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: viewModel.getTasks.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.pageview_outlined,
                              size: 60,
                              color: Colors.white,
                            ),
                            verticalSpaceMedium,
                            Text(
                              "No Tasks Found....",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      )
                    : ListView(
                        children: [
                          verticalSpaceMedium,
                          ...List.generate(viewModel.getTasks.length, (index) {
                            return Container(
                              margin: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "",
                                      // DateFormat('dd-MM-yyyy , kk:mm').format(
                                      //     viewModel.getTasks[index].createdAt!),
                                    ),
                                  ),
                                  Text(
                                    viewModel.getTasks[index].title,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  verticalSpaceSmall,
                                  Text(
                                    viewModel.getTasks[index].description,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () => viewModel.editTask(
                                              viewModel.getTasks[index]),
                                          icon:
                                              const Icon(Icons.edit_document)),
                                      horizontalSpaceSmall,
                                      IconButton(
                                          onPressed: () => viewModel.deleteTask(
                                              viewModel.getTasks[index].id!),
                                          icon:
                                              const Icon(Icons.delete_rounded))
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
              ),
            ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
