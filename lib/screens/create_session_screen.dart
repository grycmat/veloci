import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:veloci/routing/route_names.dart';
import 'package:veloci/widgets/voting/voting_button.dart';

class CreateSessionScreen extends StatefulWidget {
  const CreateSessionScreen({super.key});

  @override
  State<CreateSessionScreen> createState() => _CreateSessionScreenState();
}

class _CreateSessionScreenState extends State<CreateSessionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _sessionNameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _sessionNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleNext() {
    final sessionName = _sessionNameController.text.trim();

    if (sessionName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Session name is required'),
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
      'sessionName': sessionName,
      'sessionDescription': _descriptionController.text.trim(),
    };

    context.push(RouteNames.addTask, extra: data);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Session'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go(RouteNames.dashboard),
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
                  Text(
                    'Create a new planning session',
                    style: textTheme.headlineMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Set up your session details to get started with story point estimation.',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: _sessionNameController,
                    decoration: InputDecoration(
                      labelText: 'Session Name',
                      hintText: 'e.g., Sprint Planning Q4',
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description (Optional)',
                      hintText: 'Add additional context or notes',
                      prefixIcon: const Icon(Icons.description_outlined),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    maxLines: 4,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _handleNext(),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: VotingButton(
                      text: 'Next',
                      onPressed: _handleNext,
                      icon: Icons.arrow_forward,
                      width: 280,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
