class HistoryTransaksiModel {
  final String alamat;
  final String hargaBarang;
  final String hargaTotal;
  final String idTransaksi;
  final String metodeBayar;
  final String nama;
  final String phone;
  final String quantity;
  final String status;
  final String tanggal;
  final String title;
  final String uid;
  final String urlImage;

  HistoryTransaksiModel(
      {required this.alamat,
      required this.hargaBarang,
      required this.hargaTotal,
      required this.idTransaksi,
      required this.metodeBayar,
      required this.nama,
      required this.phone,
      required this.quantity,
      required this.status,
      required this.tanggal,
      required this.title,
      required this.uid,
      required this.urlImage});

  factory HistoryTransaksiModel.fromJson(Map<String, dynamic> json) {
    return HistoryTransaksiModel(
        alamat: json['alamat'],
        hargaBarang: json['harga_barang'],
        hargaTotal: json['harga_total'],
        idTransaksi: json['idTransaksi'],
        metodeBayar: json['metode_bayar'],
        nama: json['nama'],
        phone: json['phone'],
        quantity: json['quantity'],
        status: json['status'],
        tanggal: json['tanggal'],
        title: json['title'],
        uid: json['uid'],
        urlImage: json['urlImage']);
  }
}
