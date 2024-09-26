import 'package:intl/intl.dart';

class DataLRT {
  String namaStasiun;
  String tujuanAkhir;
  String jamTiba;
  String lineLrt;

  DataLRT(
      {required this.namaStasiun,
      required this.tujuanAkhir,
      required this.jamTiba,
      required this.lineLrt});
}

List<DataLRT> convertToDataLRT(List<String> rawData, String selectedDariJam, String selectedSampaiJam) {
  // Format for the time comparison
  DateFormat timeFormat = DateFormat('HH:mm');

  // Convert the selected range times into DateTime objects
  DateTime dariTime = timeFormat.parse(selectedDariJam);
  DateTime sampaiTime = timeFormat.parse(selectedSampaiJam);

  List<DataLRT> dataLRTList= rawData.map((entry) {
    // Split the entry into time and destination
    List<String> parts = entry.split(' ');
    String jamTiba = parts[0]; // e.g., '06:17'

    String stationName = parts.sublist(3).join(' ') == 'Jati Mulya'
        ? 'Jati Mulya'
        : (parts.sublist(3).join(' ') == 'Dukuh Atas'
            ? 'Dukuh Atas'
            : 'Harjamukti');

    String tujuanAkhir = parts.sublist(1, 3).join(' ') == 'Jati Mulya'
        ? 'Jati Mulya'
        : (parts.sublist(1, 3).join(' ') == 'Dukuh Atas'
            ? 'Dukuh Atas'
            : 'Harjamukti');

    return DataLRT(
      namaStasiun: stationName, // Always Dukuh Atas in this case
      tujuanAkhir: tujuanAkhir,
      jamTiba: jamTiba,
      lineLrt: parts.sublist(1).join(' ').contains('Jati Mulya')
          ? 'Bekasi Line'
          : 'Cibubur Line',
    );
  }).toList();

  // Filter based on the time range
  List<DataLRT> filteredData = dataLRTList.where((data) {
    DateTime jamTibaTime = timeFormat.parse(data.jamTiba);
    return jamTibaTime.isAfter(dariTime) && jamTibaTime.isBefore(sampaiTime);
  }).toList();

  // Sort the filtered list by jamTiba
  filteredData.sort((a, b) => a.jamTiba.compareTo(b.jamTiba));

  return filteredData;
}
