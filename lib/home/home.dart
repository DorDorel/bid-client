import 'package:bid_client/connections/http_bid_request.dart';
import 'package:bid_client/connections/tenant_data.dart';
import 'package:bid_client/models/tenant.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

void fetchTenantData() async {
  TenantData tenantData = TenantData();
  Tenant? tenantInfo = await tenantData.getTenantInfo();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '578493 ',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.phone_android)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            DateTime.now().toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Center(
            child: Text(),
          ),
          // TextButton(
          //     onPressed: () async {
          //       TenantData t = TenantData();
          //       Tenant? a = await t.getTenantInfo();
          //       print(a!.companyMail);
          //     },
          //     child: Text('click'))
        ],
      ),
    );
  }
}
