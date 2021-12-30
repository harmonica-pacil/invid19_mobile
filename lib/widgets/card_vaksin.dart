/// Flutter code sample for Card

// This sample shows creation of a [Card] widget that can be tapped. When
// tapped this [Card]'s [InkWell] displays an "ink splash" that fills the
// entire card.

import 'package:flutter/material.dart';
import '../screens/add_pendaftar.dart';
import '../models/vaksin.dart';

Widget ArtikelCard(BuildContext context, Vaksin vaksin) {
  return Center(
    child: Card(
      child: InkWell(
        child: Container(
          width: 270,
          decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,
    boxShadow: [
      BoxShadow(color: Colors.indigo, spreadRadius: 5),
    ],
  ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Text(
                      vaksin.lokasi + ", " + vaksin.kota + ", " + vaksin.provinsi,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Kode Vaksinasi: " + vaksin.kode,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Jeknis Vaksin: " + vaksin.jenis_vaksin,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Tanggal: " + vaksin.tanggal,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Jam: " + vaksin.jam_mulai + " - " + vaksin.jam_berakhir,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Kuota: " + vaksin.kuota.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 28),
                    
                    Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                child: const Text(
                  "Daftar",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.indigo[400]),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPendaftar(vaksin.kode),
                    ),
                  );
                },
              ),
            ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}