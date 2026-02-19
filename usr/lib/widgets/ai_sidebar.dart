import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AiSidebar extends StatefulWidget {
  const AiSidebar({super.key});

  @override
  State<AiSidebar> createState() => _AiSidebarState();
}

class _AiSidebarState extends State<AiSidebar> {
  final List<Map<String, dynamic>> _messages = [
    {
      'role': 'ai',
      'content': 'Hello! I am your AI browsing assistant. I can help you summarize this page, extract data, or find related information. What would you like to do?',
      'time': 'Now'
    }
  ];
  final TextEditingController _inputController = TextEditingController();

  void _sendMessage() {
    if (_inputController.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'role': 'user',
        'content': _inputController.text,
        'time': 'Now'
      });
      
      // Simulate AI thinking and response
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _messages.add({
              'role': 'ai',
              'content': 'I am analyzing the content based on your request: "${_inputController.text}". \n\nHere are some insights...',
              'time': 'Now'
            });
          });
        }
      });
      
      _inputController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.1))),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.auto_awesome, color: Theme.of(context).colorScheme.primary, size: 20),
              ).animate(onPlay: (controller) => controller.repeat(reverse: true)).pulse(duration: 2000.ms),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AI Copilot', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('Active & Browsing', style: TextStyle(color: Colors.green, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),

        // Chat Area
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final msg = _messages[index];
              final isAi = msg['role'] == 'ai';
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: isAi ? MainAxisAlignment.start : MainAxisAlignment.end,
                  children: [
                    if (isAi) ...[
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                        child: Icon(Icons.smart_toy, size: 14, color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isAi ? const Color(0xFF2A2A2A) : Theme.of(context).colorScheme.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12),
                            topRight: const Radius.circular(12),
                            bottomLeft: Radius.circular(isAi ? 0 : 12),
                            bottomRight: Radius.circular(isAi ? 12 : 0),
                          ),
                        ),
                        child: Text(
                          msg['content'],
                          style: const TextStyle(height: 1.4),
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn().slideY(begin: 0.2, end: 0);
            },
          ),
        ),

        // Input Area
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1))),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _inputController,
                  onSubmitted: (_) => _sendMessage(),
                  decoration: InputDecoration(
                    hintText: 'Ask AI about this page...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF2C2C2C),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: _sendMessage,
                icon: const Icon(Icons.send_rounded),
                color: Theme.of(context).colorScheme.primary,
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
