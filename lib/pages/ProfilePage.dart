import 'package:e_commerce/widgets/Login.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&s'),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.edit, color: Colors.purple),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Fahmi Abror',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '345 Poin',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.purple,
                ),
              ),
            ),
            SizedBox(height: 30),
            _buildProfileOption(context, Icons.edit, 'Edit Profile'),
            _buildProfileOption(context, Icons.lock, 'Change Password'),
            _buildProfileOption(context, Icons.info, 'Information'),
            _buildProfileOption(context, Icons.update, 'Update'),
            _buildProfileOption(context, Icons.logout, 'Log out',
                isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, IconData icon, String label,
      {bool isLogout = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isLogout ? Colors.red[100] : Colors.purple[100],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isLogout ? Colors.red : Colors.purple),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: isLogout ? Colors.red : Colors.black,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onPressed: () {
              if (isLogout) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              }
            },
          ),
        ],
      ),
    );
  }
}
