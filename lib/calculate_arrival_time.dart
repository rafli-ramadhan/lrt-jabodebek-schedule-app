import 'package:app_lrt_jabodebek/data/dukuhAtas.dart';
import 'package:app_lrt_jabodebek/data/jatiMulya.dart';
import 'package:app_lrt_jabodebek/data/harjaMukti.dart';

class DataStasiun {
  String namaStasiun;
  List<String> dataStasiun;

  DataStasiun(
      {required this.namaStasiun,
      required this.dataStasiun,});
}

// List stasiun di sepanjang jalur LRT
List<DataStasiun> stasiunDataList = [
// Bekasi line only
  DataStasiun(namaStasiun: 'Jatimulya', dataStasiun: dataJatiMulya),
  DataStasiun(namaStasiun: 'Bekasi Barat', dataStasiun: dataBekasiBarat),
  DataStasiun(namaStasiun: 'Cikunir 2', dataStasiun: dataCikunir2),
  DataStasiun(namaStasiun: 'Cikunir 1', dataStasiun: dataCikunir1),
  DataStasiun(namaStasiun: 'Jatibening Baru', dataStasiun: dataJatibeningBaru),
  DataStasiun(namaStasiun: 'Halim', dataStasiun: dataHalim),
  // Cibubur line only
  DataStasiun(namaStasiun: 'Harjamukti', dataStasiun: dataHarjamukti),
  DataStasiun(namaStasiun: 'Ciracas', dataStasiun: dataCiracas),
  DataStasiun(namaStasiun: 'Kampung Rambutan', dataStasiun: dataKampungRambutan),
  DataStasiun(namaStasiun: 'TMII', dataStasiun: dataTMII),
  // Join line
  DataStasiun(namaStasiun: 'Cawang', dataStasiun: dataCawang),
  DataStasiun(namaStasiun: 'Ciliwung', dataStasiun: dataCiliwung),
  DataStasiun(namaStasiun: 'Pancoran', dataStasiun: dataPancoran),
  DataStasiun(namaStasiun: 'Kuningan', dataStasiun: dataKuningan),
  DataStasiun(namaStasiun: 'Rasuna Said', dataStasiun: dataRusunaSaid),
  DataStasiun(namaStasiun: 'Setiabudi', dataStasiun: dataSetiabudi),
  DataStasiun(namaStasiun: 'Dukuh Atas', dataStasiun: dataDukuhAtasToHarjamukti + dataDukuhAtasToJatiMulya),
];

// Join line
List<String> dataSetiabudi = addMinutesToTime(dataDukuhAtasToJatiMulya, 2) + addMinutesToTime(dataDukuhAtasToHarjamukti, 2) + addMinutesToTime(dataHarjamukti, 9+4+4+10+3+2+4+5+3+3) + addMinutesToTime(dataJatiMulya, 5+6+3+5+9+5+3+2+4+5+3+3);
List<String> dataRusunaSaid = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3) + addMinutesToTime(dataDukuhAtasToHarjamukti, 2+3) + addMinutesToTime(dataHarjamukti, 9+4+4+10+3+2+4+5+3) + addMinutesToTime(dataJatiMulya, 5+6+3+5+9+5+3+2+4+5+3);
List<String> dataKuningan = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3+3) + addMinutesToTime(dataDukuhAtasToHarjamukti, 2+3+3) + addMinutesToTime(dataHarjamukti, 9+4+4+10+3+2+4+5) + addMinutesToTime(dataJatiMulya, 5+6+3+5+9+5+3+2+4+5);
List<String> dataPancoran = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3+3+5) + addMinutesToTime(dataDukuhAtasToHarjamukti, 2+3+3+5) + addMinutesToTime(dataHarjamukti, 9+4+4+10+3+2+4) + addMinutesToTime(dataJatiMulya, 5+6+3+5+9+5+3+2+4);
List<String> dataCikoko = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3+3+5+4) + addMinutesToTime(dataDukuhAtasToHarjamukti, 2+3+3+5+4) + addMinutesToTime(dataHarjamukti, 9+4+4+10+3+2) + addMinutesToTime(dataJatiMulya, 5+6+3+5+9+5+3+2);
List<String> dataCiliwung = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3+3+5+4+2) + addMinutesToTime(dataDukuhAtasToHarjamukti, 2+3+3+5+4+2) + addMinutesToTime(dataHarjamukti, 9+4+4+10+3) + addMinutesToTime(dataJatiMulya, 5+6+3+5+9+5+3);
List<String> dataCawang = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3+3+5+4+2+3) +  addMinutesToTime(dataDukuhAtasToHarjamukti, 2+3+3+5+4+2+3) + addMinutesToTime(dataHarjamukti, 9+4+4+10) + addMinutesToTime(dataJatiMulya, 5+6+3+5+9+5);

// Bekasi line only
List<String> dataHalim = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3+3+5+4+2+3+5) + addMinutesToTime(dataJatiMulya, 5+6+3+5+9);
List<String> dataJatibeningBaru = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3+3+5+4+2+3+5+9) + addMinutesToTime(dataJatiMulya, 5+6+3+5);
List<String> dataCikunir1 = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3+3+5+4+2+3+5+9+5) + addMinutesToTime(dataJatiMulya, 5+6+3);
List<String> dataCikunir2 = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3+3+5+4+2+3+5+9+5+3) + addMinutesToTime(dataJatiMulya, 5+6);
List<String> dataBekasiBarat = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3+3+5+4+2+3+5+9+5+3+6) + addMinutesToTime(dataJatiMulya, 5);
List<String> dataJatiMulyaUpdated = addMinutesToTime(dataDukuhAtasToJatiMulya, 2+3+3+5+4+2+3+5+9+5+3+6+5) + dataJatiMulya;

// Cibubur line only
List<String> dataTMII = addMinutesToTime(dataDukuhAtasToHarjamukti, 2+3+3+5+4+2+3+10) + addMinutesToTime(dataHarjamukti, 9+4+4);
List<String> dataKampungRambutan = addMinutesToTime(dataDukuhAtasToHarjamukti, 2+3+3+5+4+2+3+10+4) + addMinutesToTime(dataHarjamukti, 9+4);
List<String> dataCiracas = addMinutesToTime(dataDukuhAtasToHarjamukti, 2+3+3+5+4+2+3+10+4+4) + addMinutesToTime(dataHarjamukti, 9);
List<String> dataHarjamuktiUpdated = addMinutesToTime(dataDukuhAtasToHarjamukti, 2+3+3+5+4+2+3+10+4+4+9) + dataHarjamukti;

List<String> chooseStation(String stationName) {
  try {
    // Find the station with the matching name
    DataStasiun selectedStation = stasiunDataList.firstWhere(
      (station) => station.namaStasiun.toLowerCase() == stationName.toLowerCase(),
    );
    return selectedStation.dataStasiun;
  } catch (e) {
    print('Station not found');
    return [];
  }
}

List<String> addMinutesToTime(
    List<String> schedule, int minutesToAdd) {
  return schedule.map((entry) {
    // Split the time and destination
    List<String> parts = entry.split(' ');
    String time = parts[0];
    String destination = parts.sublist(1).join(' ');

    // Parse the time
    List<String> timeParts = time.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    // Add the minutes
    DateTime dateTime =
        DateTime(2024, 1, 1, hour, minute).add(Duration(minutes: minutesToAdd));

    // Format the new time as HH:mm
    String newTime =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

    return "$newTime $destination";
  }).toList();
}
