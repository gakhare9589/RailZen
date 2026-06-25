import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "SEARCH",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "FIND YOUR\nTRAIN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 25),

              _buildField(
                "From Station",
                Icons.train,
              ),

              const SizedBox(height: 15),

              _buildField(
                "To Station",
                Icons.location_on,
              ),

              const SizedBox(height: 15),

              _buildField(
                "Journey Date",
                Icons.calendar_month,
              ),

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B5CF6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "SEARCH TRAINS",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "POPULAR TRAINS",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 15),

              trainCard(
                "Rajdhani Express",
                "12951",
                "16:35",
                "08:30",
              ),

              trainCard(
                "Vande Bharat Express",
                "20171",
                "06:00",
                "13:45",
              ),

              trainCard(
                "Duronto Express",
                "12263",
                "23:15",
                "15:20",
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildField(
      String hint,
      IconData icon,
      ) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.white54,
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF8B5CF6),
        ),
        filled: true,
        fillColor: const Color(0xFF17171C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget trainCard(
      String name,
      String number,
      String departure,
      String arrival,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF17171C),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: const Color(0xFF8B5CF6)
                  .withOpacity(.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.train,
              color: Color(0xFF8B5CF6),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "$number • $departure → $arrival",
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor:
              const Color(0xFF8B5CF6),
            ),
            child: const Text(
              "Book",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}