import 'package:flutter/material.dart';
import 'package:app_lrt_jabodebek/calculate_arrival_time.dart';
import 'package:app_lrt_jabodebek/model/data.dart';
import 'package:app_lrt_jabodebek/data/jamOption.dart';
import 'package:app_lrt_jabodebek/data/stationList.dart';
import 'package:app_lrt_jabodebek/list_train.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Delay for 3 seconds and navigate to the main screen
//     Timer(Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => MainScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black, // Set background color to black
//       body: Center(
//         child: Text(
//           'LRT Jabodebek',
//           style: TextStyle(
//             fontSize: 25.0,
//             color: Colors.white, // Set text color to white
//             fontFamily: 'PoppinsRegular', // Use Poppins font
//           ),
//         ),
//       ),
//     );
//   }
// }

class _MainScreenState extends State<MainScreen> {
  String selectedStation = 'Dukuh Atas';
  String selectedDariJam = '06:00'; // Default value for jam tiba
  String selectedSampaiJam = '08:00'; // Default value for jam berangkat

  @override
  Widget build(BuildContext context) {
    List<String> stationData = chooseStation(selectedStation);
    List<DataLRT> getDataLRT =
        convertToDataLRT(stationData, selectedDariJam, selectedSampaiJam);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 139, 1, 1),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 2.0, vertical: 2.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0), // Add padding inside the container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 255, 220, 220), // Set the background color
                    borderRadius:
                        BorderRadius.circular(25.0), // Add rounded border
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.directions_subway,
                      size: 17,
                      color: Colors.black, // Set icon color to black
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Text(
                // '${stationData[0]} Station',
                'LRT Jabodebek',
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 17.0,
                  fontFamily: 'PoppinsMedium', // Use the PoppinsBold font
                ),
              ),
            ],
          ),
        ),
        body: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Dropdown for Jam Tiba
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Pilih stasiun',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 17.0,
                                      fontFamily: 'PoppinsMedium')),
                              DropdownButton<String>(
                                value: selectedStation,
                                icon: const Icon(Icons.arrow_drop_down),
                                isExpanded: true,
                                underline: Container(
                                  height: 2,
                                  color: Color.fromARGB(255, 139, 1, 1),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedStation = newValue!;
                                  });
                                },
                                items: stasiunList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Dari Jam',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 17.0,
                                      fontFamily: 'PoppinsMedium')),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Pilih Jam',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 17.0,
                                                fontFamily: 'PoppinsMedium')),
                                        content: Container(
                                          width: double.maxFinite,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: jamOptions.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return ListTile(
                                                title: Text(jamOptions[index]),
                                                onTap: () {
                                                  setState(() {
                                                    if (jamOptions.indexOf(
                                                            selectedSampaiJam) >
                                                        jamOptions.indexOf(
                                                            jamOptions[
                                                                index])) {
                                                      selectedDariJam =
                                                          jamOptions[index];
                                                    } else {
                                                      selectedDariJam =
                                                          jamOptions[index];

                                                      selectedSampaiJam =
                                                          jamOptions[index + 1];
                                                    }
                                                  });
                                                  Navigator.pop(
                                                      context); // Close the dialog
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(255, 139, 1, 1),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    selectedDariJam,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20.0,
                                        fontFamily: 'PoppinsReguler'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20), // Space between the columns
                        // Dropdown for Jam Berangkat
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Sampai Jam',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 17.0,
                                      fontFamily: 'PoppinsMedium')),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Pilih Jam',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 17.0,
                                                fontFamily: 'PoppinsMedium')),
                                        content: Container(
                                          width: double.maxFinite,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: jamOptions.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return ListTile(
                                                title: Text(jamOptions[index]),
                                                onTap: () {
                                                  setState(() {
                                                    if (jamOptions.indexOf(
                                                            jamOptions[index]) >
                                                        jamOptions.indexOf(
                                                            selectedDariJam)) {
                                                      selectedSampaiJam =
                                                          jamOptions[index];
                                                    } else {
                                                      selectedDariJam =
                                                          jamOptions[index - 1];
                                                      selectedSampaiJam =
                                                          jamOptions[index];
                                                    }
                                                  });
                                                  Navigator.pop(
                                                      context); // Close the dialog
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(255, 139, 1, 1),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    selectedSampaiJam,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20.0,
                                        fontFamily: 'PoppinsReguler'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20.0, left: 10.0, right: 10.0, bottom: 4.0),
                    child: Text(
                        'Estimasti waktu tiba di stasiun $selectedStation',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 14.0,
                            fontFamily: 'PoppinsMedium')),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: getDataLRT.length,
                    itemBuilder: (context, index) {
                      final DataLRT item = getDataLRT[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ListTrain(stationName: selectedStation)),
                          );
                        },
                        child: Card(
                          shadowColor: const Color.fromARGB(255, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Allow column to take minimum space
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // To make all container in center
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2.0, vertical: 2.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical:
                                            8.0), // Add padding inside the container
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 255, 255,
                                          255), // Set the background color to black
                                      borderRadius: BorderRadius.circular(
                                          25.0), // Add rounded border
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.directions_subway,
                                        size: 40,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      item.tujuanAkhir,
                                      style: const TextStyle(
                                        fontFamily: 'PoppinsRegular',
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical:
                                              2.0), // Add padding inside the container
                                      decoration: BoxDecoration(
                                        color: item.lineLrt.contains('Bekasi')
                                            ? const Color.fromARGB(255, 16, 1,
                                                182) // Blue if 'Bekasi'
                                            : const Color.fromARGB(255, 1, 135,
                                                52), // Black for other cases // Set the background color to black
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Add rounded border
                                      ),
                                      child: Text(
                                        item.lineLrt,
                                        style: const TextStyle(
                                          fontFamily: 'PoppinsRegular',
                                          fontSize: 13.0,
                                          color: Colors
                                              .white, // Set text color to white
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        const Text(
                                          'Tiba ',
                                          style: TextStyle(
                                            fontFamily: 'PoppinsRegular',
                                            fontSize: 16.0,
                                            color: Color.fromARGB(255, 0, 0,
                                                0), // Set text color to white
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 1.0,
                                              vertical: 5.0), //
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                              vertical:
                                                  1.0), // Add padding inside the container
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 139, 1, 1),

                                            /// Set the background color to black
                                            borderRadius: BorderRadius.circular(
                                                8.0), // Add rounded border
                                          ),
                                          child: Text(
                                            item.jamTiba,
                                            style: const TextStyle(
                                              fontFamily: 'PoppinsRegular',
                                              fontSize: 18.0,
                                              color: Colors
                                                  .white, // Set text color to white
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )),
                ])));
  }
}
