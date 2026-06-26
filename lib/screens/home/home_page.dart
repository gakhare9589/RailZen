import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0D),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconBox(Icons.person),
                  _iconBox(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                "WELCOME BACK",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "TRACK\nINDIAN RAILWAYS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 24),

              // SEARCH
              Container(
                height: 58,
                decoration: BoxDecoration(
                  color: const Color(0xFF17171C),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF8B5CF6),
                    ),
                    hintText: "Search Train Number",
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // LIVE STATUS CARD
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
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "LIVE STATUS",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "12627 Karnataka Express",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Running On Time",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "QUICK ACTIONS",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 14),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.15,
                children: const [
                  ActionCard(
                    icon: Icons.train,
                    title: "LIVE TRAIN",
                  ),
                  ActionCard(
                    icon: Icons.confirmation_number,
                    title: "PNR STATUS",
                  ),
                  ActionCard(
                    icon: Icons.search,
                    title: "TRAIN SEARCH",
                  ),
                  ActionCard(
                    icon: Icons.event_seat,
                    title: "SEAT CHECK",
                  ),
                ],
              ),

              const SizedBox(height: 22),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF17171C),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.local_offer,
                      color: Color(0xFF8B5CF6),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Get 20% OFF on Railway Food Orders",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
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

  static Widget _iconBox(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF17171C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const ActionCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF17171C),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: const Color(0xFF8B5CF6),
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}