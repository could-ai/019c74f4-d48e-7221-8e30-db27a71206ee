import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/ai_sidebar.dart';
import '../widgets/web_view_placeholder.dart';

class AgentBrowserScreen extends StatefulWidget {
  const AgentBrowserScreen({super.key});

  @override
  State<AgentBrowserScreen> createState() => _AgentBrowserScreenState();
}

class _AgentBrowserScreenState extends State<AgentBrowserScreen> {
  final TextEditingController _urlController = TextEditingController(text: 'https://example.com/research/ai-trends');
  bool _isSidebarOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Navigation Bar
          _buildTopBar(),
          
          // Main Content Area
          Expanded(
            child: Row(
              children: [
                // Web Content Area
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: const WebViewPlaceholder(),
                  ),
                ),
                
                // AI Agent Sidebar
                if (_isSidebarOpen)
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white.withOpacity(0.1)),
                      ),
                      child: const AiSidebar(),
                    ).animate().fadeIn(duration: 300.ms).slideX(begin: 0.1, end: 0),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.1))),
      ),
      child: Row(
        children: [
          // Controls
          Row(
            children: [
              _circleButton(Colors.red),
              const SizedBox(width: 8),
              _circleButton(Colors.yellow),
              const SizedBox(width: 8),
              _circleButton(Colors.green),
            ],
          ),
          const SizedBox(width: 24),
          
          // Navigation Icons
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {},
          ),
          
          const SizedBox(width: 16),
          
          // URL Bar
          Expanded(
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lock, size: 14, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _urlController,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.only(bottom: 12),
                      ),
                    ),
                  ),
                  const Icon(Icons.star_border, size: 16, color: Colors.grey),
                ],
              ),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Toggle Sidebar Button
          IconButton(
            icon: Icon(
              _isSidebarOpen ? Icons.view_sidebar : Icons.view_sidebar_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              setState(() {
                _isSidebarOpen = !_isSidebarOpen;
              });
            },
            tooltip: 'Toggle AI Agent',
          ),
          
          const SizedBox(width: 8),
          const CircleAvatar(
            radius: 16,
            backgroundColor: Colors.deepPurple,
            child: Text('U', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _circleButton(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
