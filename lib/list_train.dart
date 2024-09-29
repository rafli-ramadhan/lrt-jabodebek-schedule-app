import 'package:flutter/material.dart';
import 'package:app_lrt_jabodebek/data/stationList.dart';

class ListTrain extends StatelessWidget {
  final String stationName;
  final String lineLrt;
  List<String> stations;

  ListTrain({Key? key, required this.stationName, required this.lineLrt})
      : stations = lineLrt.contains('Cibubur')
            ? stasiunListCibuburLine
            : stasiunListBekasiLine,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stasiun LRT',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20.0,
                fontFamily: 'PoppinsMedium')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
        child: ListView.builder(
          itemCount: stations.length,
          itemBuilder: (context, index) {
            bool isSelected = stations[index] == stationName;
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 139, 1, 1),
                        shape: BoxShape.circle,
                      ),
                    ),

                    if (index != stations.length - 1)
                      Container(
                        width: 2,
                        height: 40,
                        color: Color.fromARGB(255, 139, 1, 1),
                      ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color.fromARGB(255, 139, 1, 1)
                        : const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                      isSelected
                          ? '${stations[index]} (posisi kamu)'
                          : stations[index],
                      style: TextStyle(
                          color: isSelected
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Color.fromARGB(255, 139, 1, 1),
                          fontSize: 17.0,
                          fontFamily: 'PoppinsReguler')),
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
