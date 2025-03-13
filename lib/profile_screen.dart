import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileInfo(
                    Icons.mail,
                    'Correo',
                    'juan.perez@gmail.com',
                  ),
                  _buildProfileInfo(Icons.person_2, 'Nombre', 'Juan'),
                  _buildProfileInfo(Icons.person_2, 'Apellido', 'Pérez'),
                  _buildProfileInfo(Icons.today, 'Edad', '28'),
                  _buildProfileInfo(
                    Icons.location_on,
                    'País',
                    'Estados Unidos',
                  ),
                  _buildProfileInfo(Icons.location_on, 'Estado', 'California'),
                  SizedBox(height: 20),
                  Text(
                    'Lugares Visitados',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildVisitedPlace('Cancún'),
                  _buildVisitedPlace('Isla de Holbox'),
                  _buildVisitedPlace('Tulum'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(IconData icon, String title, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.blueAccent),
          SizedBox(width: 12),
          Text(
            '$title: ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              info,
              style: TextStyle(fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisitedPlace(String place) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.explore, size: 20, color: Colors.green),
          SizedBox(width: 8),
          Text(place, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
