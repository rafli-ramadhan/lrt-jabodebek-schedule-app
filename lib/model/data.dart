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
  DateFormat timeFormat = DateFormat('HH:mm');

  DateTime dariTime = timeFormat.parse(selectedDariJam);
  DateTime sampaiTime = timeFormat.parse(selectedSampaiJam);

  List<DataLRT> dataLRTList= rawData.map((entry) {
    List<String> parts = entry.split(' ');
    String jamTiba = parts[0];

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
      namaStasiun: stationName,
      tujuanAkhir: tujuanAkhir,
      jamTiba: jamTiba,
      lineLrt: parts.sublist(1).join(' ').contains('Jati Mulya')
          ? 'Bekasi Line'
          : 'Cibubur Line',
    );
  }).toList();

  List<DataLRT> filteredData = dataLRTList.where((data) {
    DateTime jamTibaTime = timeFormat.parse(data.jamTiba);
    return jamTibaTime.isAfter(dariTime) && jamTibaTime.isBefore(sampaiTime);
  }).toList();

  // Sort based on jamTiba
  filteredData.sort((a, b) => a.jamTiba.compareTo(b.jamTiba));

  return filteredData;
}
