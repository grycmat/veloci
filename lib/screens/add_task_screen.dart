import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:veloci/routing/route_names.dart';
import 'package:veloci/widgets/voting/voting_button.dart';

class AddTaskScreen extends StatefulWidget {
  final String sessionName;
  final String sessionDescription;

  const AddTaskScreen({
    super.key,
    required this.sessionName,
    required this.sessionDescription,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _taskTitleController = TextEditingController();
  final _taskDescriptionController = TextEditingController();

  @override
  void dispose() {
    _taskTitleController.dispose();
    _taskDescriptionController.dispose();
    super.dispose();
  }

  void _handleStartVoting() {
    final taskTitle = _taskTitleController.text.trim();

    if (taskTitle.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Task title is required'),
          backgroundColor: Theme.of(context).colorScheme.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
      return;
    }

    final data = {
      'sessionName': widget.sessionName,
      'sessionDescription': widget.sessionDescription,
      'taskTitle': taskTitle,
      'taskDescription': _taskDescriptionController.text.trim(),
    };

    context.go(RouteNames.voting, extra: data);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Session info chip
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.casino_outlined,
                        size: 20,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.sessionName,
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            if (widget.sessionDescription.isNotEmpty)
                              Text(
                                widget.sessionDescription,
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurface.withValues(
                                    alpha: 0.7,
                                  ),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Add a task to estimate',
                  style: textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Provide details about the user story or task that needs estimation.',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _taskTitleController,
                  decoration: InputDecoration(
                    labelText: 'Task Title',
                    hintText: 'e.g., User Story #123',
                    prefixIcon: const Icon(Icons.task_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _taskDescriptionController,
                  decoration: InputDecoration(
                    labelText: 'Task Description (Optional)',
                    hintText: 'As a user, I want to... so that I can...',
                    prefixIcon: const Icon(Icons.notes_outlined),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  maxLines: 6,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _handleStartVoting(),
                ),
                const SizedBox(height: 32),
                Center(
                  child: VotingButton(
                    text: 'Start Voting',
                    onPressed: _handleStartVoting,
                    icon: Icons.how_to_vote,
                    width: 280,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
