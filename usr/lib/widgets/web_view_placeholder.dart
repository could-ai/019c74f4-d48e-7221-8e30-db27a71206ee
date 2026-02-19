import 'package:flutter/material.dart';

class WebViewPlaceholder extends StatelessWidget {
  const WebViewPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Mock Website Content
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              Container(
                height: 300,
                width: double.infinity,
                color: const Color(0xFFF5F5F7),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.analytics_outlined, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      Text(
                        'Future of AI Agents',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Exploring the next generation of autonomous web browsing.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Content Blocks
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSkeletonLine(width: 200, height: 24),
                    const SizedBox(height: 20),
                    _buildSkeletonParagraph(),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(child: _buildCard()),
                        const SizedBox(width: 20),
                        Expanded(child: _buildCard()),
                        const SizedBox(width: 20),
                        Expanded(child: _buildCard()),
                      ],
                    ),
                    const SizedBox(height: 40),
                    _buildSkeletonParagraph(),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // Overlay for "Simulated Browser" feel
        Positioned(
          bottom: 16,
          left: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'VIEW MODE: READER',
              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkeletonLine({double width = double.infinity, double height = 16}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildSkeletonParagraph() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSkeletonLine(),
        const SizedBox(height: 8),
        _buildSkeletonLine(),
        const SizedBox(height: 8),
        _buildSkeletonLine(width: 300),
      ],
    );
  }

  Widget _buildCard() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
          const Spacer(),
          _buildSkeletonLine(width: 100),
          const SizedBox(height: 8),
          _buildSkeletonLine(height: 10),
        ],
      ),
    );
  }
}
