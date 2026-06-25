import 'package:flutter/material.dart';

class TrainCard extends StatelessWidget {
  final String trainName;
  final String trainNumber;
  final String origin;
  final String destination;
  final String from;
  final String to;
  final VoidCallback? onBook;

  const TrainCard({
    super.key,
    required this.trainName,
    required this.trainNumber,
    required this.origin,
    required this.destination,
    required this.from,
    required this.to,
    this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF17171C),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              const Icon(
                Icons.train,
                color: Color(0xFF8B5CF6),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  trainName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const Icon(
                Icons.favorite_border,
                color: Colors.white54,
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            "Train No : $trainNumber",
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

          const Divider(
            color: Colors.white12,
            height: 30,
          ),

          Row(
            children: [
              Expanded(
                child: Text(
                  origin,
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              const Icon(
                Icons.arrow_forward,
                color: Color(0xFF8B5CF6),
              ),

              Expanded(
                child: Text(
                  destination,
                  textAlign: TextAlign.end,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 18,
                color: Color(0xFF8B5CF6),
              ),

              const SizedBox(width: 6),

              Text(
                "$from  ➜  $to",
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onBook,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5CF6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "BOOK NOW",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}