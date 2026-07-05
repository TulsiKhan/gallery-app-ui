import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/ad_manager.dart';
import 'photo_view_screen.dart';

class TemplateModuleApp extends StatefulWidget {
  const TemplateModuleApp({super.key});

  @override
  State<TemplateModuleApp> createState() => _TemplateModuleAppState();
}

class _TemplateModuleAppState extends State<TemplateModuleApp> {
  @override
  Widget build(BuildContext context) {
    // 🧱 LEGO BLOCK: MasterScaffold automatically creates a safe area and injects banner ads safely.
    return MasterScaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Pro Gallery",
          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        actions: [
          // 🧱 LEGO BLOCK: MasterPremiumWrapper securely gates premium features (Soft Paywall / Rewarded Ad)
          MasterPremiumWrapper(
            featureName: "Cloud Vault",
            icon: Icons.cloud_upload,
            onUnlock: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Cloud Vault Unlocked for 24h!"), backgroundColor: Colors.green)
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.cloud_done, color: Colors.amberAccent),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 8, 
            mainAxisSpacing: 8,
            childAspectRatio: 0.8, 
          ),
          itemCount: 40,
          itemBuilder: (context, index) {
            // 🧱 LEGO BLOCK: SmartListNativeInjector safely drops native ads into the grid every 6 items
            return SmartListNativeInjector(
              index: index,
              adInterval: 6, 
              adHeight: 250,
              child: InkWell(
                onTap: () {
                  // Standard transition. The MasterRouteObserver handles ads automatically!
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoViewScreen(photoIndex: index),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'photo_$index',
                          child: const Icon(Icons.photo_library, color: Colors.white54, size: 40),
                        ),
                        const SizedBox(height: 8),
                        Text("Album ${index + 1}", style: const TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
