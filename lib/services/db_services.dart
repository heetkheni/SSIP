import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});

  final userCollectionRef = FirebaseFirestore.instance.collection('users');
  final chatCollectonRef =
      FirebaseFirestore.instance.collection('conversations');

  Future savingUserData(String? fullName, String? email) async {
    //creting user by doc.set beacuse we alredy have userid
    // which we are getting from auth services when we create a user
    return userCollectionRef
        .doc(uid)
        .set({'fullName': fullName, 'email': email, 'uid': uid});
  }

  Future<bool> checkExistingConversationsForUser() async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('conversations')
        .where('participants', arrayContains: uid)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Stream<List<HealthCenter>> getConversationsForUser(String id) {
    // Set up a query for the chats and convert it to a stream
    Query query = FirebaseFirestore.instance
        .collection('conversations')
        .where('participants', arrayContains: id);

    // Create a stream of snapshots from the query
    Stream<QuerySnapshot> snapshots = query.snapshots();

    // Convert the snapshots to a stream of List<HealthCenter>
    Stream<List<HealthCenter>> chatStream =
        snapshots.asyncMap((snapshot) async {
      List<HealthCenter> healthCenters = [];

      // Process the snapshot to get chat data
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        // Extract chat information and create HealthCenter objects
        final List<dynamic> participants = doc['participants'] as List<dynamic>;
        if (participants.length == 2) {
          final String centerId = participants[1];

          // Fetch additional information about the health center
          DocumentSnapshot centerSnapshot = await FirebaseFirestore.instance
              .collection('healthCenters')
              .doc(centerId)
              .get();

          if (centerSnapshot.exists) {
            final String healthCenterName = centerSnapshot['hc_name'] as String;
            final String healthCenterEmail =
                centerSnapshot['hc_email'] as String;
            healthCenters.add(HealthCenter(
                id: centerId,
                name: healthCenterName,
                email: healthCenterEmail));
          }
        }
      }

      return healthCenters;
    });

    return chatStream;
  }

  Stream<List<UserofAPP>> getConversationsForHC(String id) {
    // Set up a query for the chats and convert it to a stream
    Query query = FirebaseFirestore.instance
        .collection('conversations')
        .where('participants', arrayContains: id);

    // Create a stream of snapshots from the query
    Stream<QuerySnapshot> snapshots = query.snapshots();

    // Convert the snapshots to a stream of List<HealthCenter>
    Stream<List<UserofAPP>> chatStream = snapshots.asyncMap((snapshot) async {
      List<UserofAPP> users = [];

      // Process the snapshot to get chat data
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        // Extract chat information and create HealthCenter objects
        final List<dynamic> participants = doc['participants'] as List<dynamic>;
        if (participants.length == 2) {
          final String userId = participants[0];
          // Fetch additional information about the health center
          DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get();

          if (userSnapshot.exists) {
            final String userName = userSnapshot['fullName'] as String;
            final String userEmail = userSnapshot['email'] as String;
            users.add(UserofAPP(id: userId, name: userName, email: userEmail));
          }
        }
      }
      return users;
    });

    return chatStream;
  }

  Future<List<HealthCenter>> getHCList() async {
    try {
      final QuerySnapshot healthCentersSnapshot =
          await FirebaseFirestore.instance.collection('healthCenters').get();

      if (healthCentersSnapshot.docs.isEmpty) {
        return [];
      }

      final List<HealthCenter> healthCenters = [];

      for (final doc in healthCentersSnapshot.docs) {
        final healthCenterId = doc['hc_id'] as String;
        final healthCenterName = doc['hc_name'] as String;
        final healthCenterEmail = doc['hc_email'] as String;

        healthCenters.add(HealthCenter(
            id: healthCenterId,
            name: healthCenterName,
            email: healthCenterEmail));
      }

      return healthCenters;
    } catch (e) {
      print('Error getting health centers: $e');
      return [];
    }
  }

  Future<String?> getConversationId(String user_id, String admin_id) async {
    final QuerySnapshot conversationsSnapshot = await FirebaseFirestore.instance
        .collection('conversations')
        .where('participants', isEqualTo: [user_id, admin_id]).get();

    if (conversationsSnapshot.docs.isNotEmpty) {
      // Assuming there's only one conversation between the same participants.
      return conversationsSnapshot.docs.first.id;
    } else {
      // Conversation not found.
      return null;
    }
  }

  Future getChatMessages(String? coversation_id) async {
    if (coversation_id == null) {
      return Stream.empty();
    } else {
      return FirebaseFirestore.instance
          .collection('conversations')
          .doc(coversation_id)
          .collection('messages')
          .orderBy('time')
          .snapshots();
    }
  }

  Future<String> sendFirstmsg(String userId, String adminId,
      Map<String, dynamic> chatMessageMap) async {
    final conversationsCollection =
        FirebaseFirestore.instance.collection('conversations');
    final newConversationRef = await conversationsCollection.add({
      'participants': [userId, adminId],
    });

    final newConversationId = newConversationRef.id;

    await newConversationRef.collection('messages').add(chatMessageMap);

    return newConversationId;
  }

  sendChatMessage(
      String? coversation_id, Map<String, dynamic> chatMessageMap) async {
    await FirebaseFirestore.instance
        .collection('conversations')
        .doc(coversation_id)
        .collection('messages')
        .add(chatMessageMap);
    await FirebaseFirestore.instance
        .collection('conversations')
        .doc(coversation_id)
        .update({
      'recentMessage': chatMessageMap['message'],
      'recentMessageSender': chatMessageMap['sender_id'],
      'recentMessageTime': chatMessageMap['time']
    });
  }
}

class HealthCenter {
  final String id;
  final String name;
  final String email;

  HealthCenter({required this.id, required this.name, required this.email});
}

class UserofAPP {
  final String id;
  final String name;
  final String email;

  UserofAPP({required this.id, required this.name, required this.email});
}
