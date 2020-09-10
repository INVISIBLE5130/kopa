import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _postsCollectionReference =
  Firestore.instance.collection('posts');

  Future addPost(Post post) async {
    try {
      await _postsCollectionReference.add(post.toMap());
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}