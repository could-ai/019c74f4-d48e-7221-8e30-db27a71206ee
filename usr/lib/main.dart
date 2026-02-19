import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/agent_browser_screen.dart';

void main() {
  runApp(const AiBrowserApp());
}

class AiBrowserApp extends StatelessWidget {
  const AiBrowserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Agent Browser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF00E5FF), // Cyan neon
          secondary: const Color(0xFF2979FF), // Blue neon
          surface: const Color(0xFF121212),
          background: const Color(0xFF0A0A0A),
          onSurface: Colors.white,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AgentBrowserScreen(),
      },
    );
  }
}
