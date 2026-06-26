import 'package:flutter/material.dart';
class RouteTimeline extends StatelessWidget {
  final List stations;

  const RouteTimeline({
    super.key,
    required this.stations,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: stations.take(5).map((station) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color(0xFF8B5CF6),
                    size: 22,
                  ),
                  Container(
                    width: 2,
                    height: 45,
                    color: Colors.white24,
                  ),
                ],
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        station['stationName'] ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Arrival : ${station['arrivalTime']}",
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                      Text(
                        "Departure : ${station['departureTime']}",
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}