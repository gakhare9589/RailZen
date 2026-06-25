import 'package:flutter/material.dart';
import 'services/pnr_service.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  final TextEditingController pnrController =
  TextEditingController();

  Map<String, dynamic>? pnrData;
  bool isLoading = false;

  Future<void> checkPnr() async {
    if (pnrController.text.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    try {
      final result = await PnrService()
          .checkPnr(pnrController.text.trim());

      setState(() {
        pnrData = result;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              const Text(
                "PNR",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "CHECK\nPNR STATUS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 25),

              TextField(
                controller: pnrController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Enter PNR Number",
                  hintStyle: const TextStyle(
                    color: Colors.white54,
                  ),
                  prefixIcon: const Icon(
                    Icons.confirmation_number,
                    color: Color(0xFF8B5CF6),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF17171C),
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: checkPnr,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xFF8B5CF6),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "CHECK STATUS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),

              if (pnrData != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF8B5CF6),
                        Color(0xFF6D28D9),
                      ],
                    ),
                    borderRadius:
                    BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "PNR DETAILS",
                        style: TextStyle(
                          color: Colors.white70,
                          letterSpacing: 1,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        pnrController.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        pnrData.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}