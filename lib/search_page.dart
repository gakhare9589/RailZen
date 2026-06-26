import 'package:flutter/material.dart';
import 'services/train_search_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
final TextEditingController trainController = TextEditingController();
final TrainSearchService trainService = TrainSearchService();

Map<String, dynamic>? trainData;
bool isLoading = false;

Future<void> searchTrain() async {
if (trainController.text.trim().isEmpty) return;

setState(() => isLoading = true);

try {
final data =
await trainService.searchTrain(trainController.text.trim());

setState(() {
trainData = data;
});
} catch (e) {
if (!mounted) return;

ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(e.toString()),
),
);
} finally {
if (mounted) {
setState(() => isLoading = false);
}
}
}

String formatRunningDays(String days) {
if (days.length != 7) return days;

const week = [
"Mon",
"Tue",
"Wed",
"Thu",
"Fri",
"Sat",
"Sun",
];

List<String> result = [];

for (int i = 0; i < 7; i++) {
if (days[i] == 'Y') {
result.add(week[i]);
}
}

return result.join(", ");
}

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
"SEARCH TRAIN",
style: TextStyle(
color: Colors.white70,
fontSize: 14,
letterSpacing: 2,
),
),

const SizedBox(height: 8),

const Text(
"TRAIN\nSEARCH",
style: TextStyle(
color: Colors.white,
fontSize: 34,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 24),

TextField(
controller: trainController,
style: const TextStyle(
color: Colors.white,
),
decoration: InputDecoration(
hintText: "Enter Train Number",
hintStyle: const TextStyle(
color: Colors.white54,
),
prefixIcon: const Icon(
Icons.train,
color: Color(0xFF8B5CF6),
),
filled: true,
fillColor: const Color(0xFF17171C),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(18),
borderSide: BorderSide.none,
),
),
),

const SizedBox(height: 20),

SizedBox(
width: double.infinity,
height: 55,
child: ElevatedButton(
onPressed: searchTrain,
child: const Text("SEARCH"),
),
),

const SizedBox(height: 20),

if (isLoading)
const Center(
child: CircularProgressIndicator(),
),

if (trainData != null)
Builder(
builder: (context) {
final train = trainData!['body'][0]['trains'][0];
return Container(
width: double.infinity,
padding: const EdgeInsets.all(18),
decoration: BoxDecoration(
color: const Color(0xFF17171C),
borderRadius: BorderRadius.circular(20),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

Text(
train['trainName'] ?? '',
style: const TextStyle(
color: Colors.white,
fontSize: 24,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 20),

infoTile(
"🚆 Train No",
train['trainNumber'] ?? "",
),

infoTile(
"📍 Origin",
train['origin'] ?? "",
),

infoTile(
"🏁 Destination",
train['destination'] ?? "",
),

infoTile(
"🚉 From",
train['stationFrom'] ?? "",
),

infoTile(
"🚉 To",
train['stationTo'] ?? "",
),

infoTile(
"📅 Running",
formatRunningDays(
train['runningOn'] ?? "",
),
),
],
),
);
},
),
],
),
),
),
);
}

Widget infoTile(String title, String value) {
return Padding(
padding: const EdgeInsets.only(bottom: 12),
child: Container(
padding: const EdgeInsets.all(14),
decoration: BoxDecoration(
color: const Color(0xFF24242C),
borderRadius: BorderRadius.circular(16),
),
child: Row(
children: [
Text(
"$title : ",
style: const TextStyle(
color: Colors.white70,
fontWeight: FontWeight.bold,
),
),

Expanded(
child: Text(
value,
style: const TextStyle(
color: Colors.white,
),
),
),
],
),
),
);
}
}