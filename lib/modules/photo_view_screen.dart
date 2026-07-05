import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/ad_manager.dart';

class PhotoViewScreen extends StatelessWidget {
  final int photoIndex;

  const PhotoViewScreen({super.key, required this.photoIndex});

  @override
  Widget build(BuildContext context) {
    // 🧱 LEGO BLOCK: MasterScaffold automatically protects the bottom banner ad.
    return MasterScaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context), 
        ),
        title: Text(
          "Photo Detail",
          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'photo_$photoIndex',
                child: const Icon(Icons.insert_photo, size: 150, color: Colors.white24),
              ),
              const SizedBox(height: 30),
              Text(
                "High Resolution Image ${photoIndex + 1}",
                style: GoogleFonts.inter(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "Swipe left or right to view more.",
                style: GoogleFonts.inter(color: Colors.white54, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
