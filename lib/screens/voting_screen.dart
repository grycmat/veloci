import 'package:flutter/material.dart';
import 'package:veloci/widgets/voting/votes_avatar.dart';
import 'package:veloci/widgets/voting/votes_container.dart';
import 'package:veloci/widgets/voting/voting_app_bar.dart';
import 'package:veloci/widgets/voting/voting_card.dart';
import 'package:veloci/widgets/voting/voting_card_container.dart';
import 'package:veloci/widgets/voting/voting_description.dart';
import 'package:veloci/widgets/voting/voting_header.dart';

class VotingScreen extends StatefulWidget {
  final String taskTitle;
  final String taskDescription;
  final String sessionName;

  const VotingScreen({
    super.key,
    required this.taskTitle,
    required this.taskDescription,
    required this.sessionName,
  });

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  String? _selectedValue;
  final List<String> _cardValues = [
    '0',
    '1',
    '2',
    '3',
    '5',
    '8',
    '13',
    '21',
    '☕',
  ];

  final List<Map<String, dynamic>> _participants = [
    {
      'name': 'John',
      'imageUrl': 'https://i.pravatar.cc/150?img=1',
      'hasVoted': true,
    },
    {
      'name': 'Sarah',
      'imageUrl': 'https://i.pravatar.cc/150?img=2',
      'hasVoted': true,
    },
    {
      'name': 'Mike',
      'imageUrl': 'https://i.pravatar.cc/150?img=3',
      'hasVoted': true,
    },
    {
      'name': 'Emma',
      'imageUrl': 'https://i.pravatar.cc/150?img=4',
      'hasVoted': true,
    },
    {
      'name': 'Alex',
      'imageUrl': 'https://i.pravatar.cc/150?img=5',
      'hasVoted': false,
    },
    {
      'name': 'Lisa',
      'imageUrl': 'https://i.pravatar.cc/150?img=6',
      'hasVoted': false,
    },
    {
      'name': 'David',
      'imageUrl': 'https://i.pravatar.cc/150?img=7',
      'hasVoted': false,
    },
  ];

  int get _votedCount =>
      _participants.where((p) => p['hasVoted'] == true).length;
  int get _totalCount => _participants.length;
  bool get _canReveal => _votedCount == _totalCount;

  void _handleCardTap(String value) {
    setState(() {
      if (_selectedValue == value) {
        _selectedValue = null;
      } else {
        _selectedValue = value;
      }
    });
  }

  void _handleRevealVotes() {
    if (_canReveal) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Revealing votes...'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _handleAddTask() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Add new task'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VotingAppBar(
        title: widget.sessionName,
        onClosePressed: () => Navigator.of(context).pop(),
        onAddPressed: _handleAddTask,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VotingHeader(title: widget.taskTitle),
                  VotingDescription(description: widget.taskDescription),
                  VotingCardContainer(
                    children: _cardValues.map((value) {
                      final isIcon = value == '☕';
                      return VotingCard(
                        value: value,
                        isSelected: _selectedValue == value,
                        onTap: () => _handleCardTap(value),
                        isIcon: isIcon,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ),
          VotesContainer(
            votedCount: _votedCount,
            totalCount: _totalCount,
            avatars: _participants.map((participant) {
              return VotesAvatar(
                imageUrl: participant['imageUrl'],
                hasVoted: participant['hasVoted'],
                userName: participant['name'],
              );
            }).toList(),
            onRevealPressed: _handleRevealVotes,
            canReveal: _canReveal,
          ),
        ],
      ),
    );
  }
}
