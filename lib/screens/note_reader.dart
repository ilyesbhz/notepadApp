// ignore_for_file: must_be_immutable, avoid_print, invalid_return_type_for_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notepad_app/style/app_style.dart';


class NoteReader extends StatefulWidget {
  final String noteId;
  NoteReader({super.key, required this.doc}) : noteId = doc.id;
  final QueryDocumentSnapshot doc;

  @override
  State<NoteReader> createState() => _NoteReaderState();
}

class _NoteReaderState extends State<NoteReader> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    double size = MediaQuery.of(context).size.width * 0.5; 

    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          width: size,
          height: size, 
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.doc['note_title'],
                style: AppStyle.mainTitle,
              ),
              const SizedBox(
                height: 16.0, 
              ),
              Text(
                widget.doc['creation_date'],
                style: AppStyle.dateTitle,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded( 
                child: SingleChildScrollView(
                  child: Text(
                    widget.doc['note_content'],
                    style: AppStyle.mainContent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          if (widget.noteId.isNotEmpty) {
            FirebaseFirestore.instance.collection("notes").doc(widget.noteId).delete().then((_) {
              print("Note deleted");
              Navigator.pop(context);
            }).catchError((error) => print("Failed to delete note due to an $error"));
          } else {
            print("Note ID is empty, cannot delete");
          }
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
