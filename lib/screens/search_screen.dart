import 'package:arogya_mitra/services/db_services.dart';
import 'package:arogya_mitra/widgets/chat_tile.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  String userId;
  SearchScreen({super.key, required this.userId});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<HealthCenter> hcList = [];
  List<HealthCenter> searchResults = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getHealthCenters();
  }

  getHealthCenters() async {
    await DatabaseServices().getHCList().then((value) {
      setState(() {
        hcList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      searchHealthCenters(value);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Health Centers...",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    cursorColor: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    searchHealthCenters(searchController.value.toString());
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(40)),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child:  buildHealthCenterList(),
          )
        ],
      ),
    );
  }

  searchHealthCenters(String query) {
    query = query.toLowerCase();
    setState(() {
      searchResults =
          hcList.where((hc) => hc.name.toLowerCase().contains(query)).toList();
    });
  }

  buildHealthCenterList() {
    final displayList =
        searchController.text.isNotEmpty ? searchResults : hcList;

    if (displayList.isEmpty) {
      return noSearchResultsWidget();
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: displayList.length,
        itemBuilder: (context, index) {
          return ChatTile(
            user_id: widget.userId,
            hc_id: displayList[index].id,
            hc_name: displayList[index].name,
            lastmsg: "from search",
          );
        },
      );
    }
  }

  noSearchResultsWidget() {
    return Container(
      child: Text('No results found'),
    );
  }

  Widget SearchTile() {
    return ListTile();
  }
}
