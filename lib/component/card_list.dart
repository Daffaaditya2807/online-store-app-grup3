import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/list_colour.dart';

Container cardProduct(
    {String? asset, String? item, String? rate, String? harga}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: greyPrimary.withAlpha(40))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: greyLight,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage("$asset")),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  item!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange.shade400,
                  ),
                  Text(rate!, style: GoogleFonts.montserrat()),
                ],
              )
            ],
          ),
          Text(harga!, style: GoogleFonts.montserrat(fontSize: 14))
        ],
      ),
    ),
  );
}

Container cardDetailProduct({String? asset, String? item, String? harga}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: greyPrimary.withAlpha(40))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage("$asset")),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  item!,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ],
          ),
          Text(harga!, style: GoogleFonts.montserrat(fontSize: 14)),
        ],
      ),
    ),
  );
}
