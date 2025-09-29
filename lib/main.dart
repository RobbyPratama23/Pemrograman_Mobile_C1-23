import 'package:flutter/material.dart';

void main() {
  runApp(const BankMockupApp());
}

class BankMockupApp extends StatelessWidget {
  const BankMockupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Mockup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const BankMockupScreen(),
    );
  }
}

class BankMockupScreen extends StatelessWidget {
  const BankMockupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Wireframe Bank Mini",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // GridView: daftar halaman
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 4;
              if (constraints.maxWidth < 900) crossAxisCount = 3;
              if (constraints.maxWidth < 700) crossAxisCount = 2;
              if (constraints.maxWidth < 500) crossAxisCount = 1;

              return GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 0.7,
                children: [
                  _buildMockup("Splash Screen", _buildSplashMockup()),
                  _buildMockup("Login Screen", _buildLoginMockup()),
                  _buildMockup("Dashboard Screen", _buildDashboardMockup()),
                  _buildMockup("Transaction Screen", _buildTransactionMockup()),
                  _buildMockup("Profile Screen", _buildProfileMockup()),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMockup(String title, Widget content) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title bar
          Container(
            width: double.infinity,
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          // Mockup content dengan Stack
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey[400]!, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: Stack(
                  children: [content],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSplashMockup() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[500],
            ),
            child: const Center(
              child: Text(
                "Bank Mini",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 7,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Tap anywhere to continue",
            style: TextStyle(color: Colors.black54, fontSize: 7),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginMockup() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[500],
            ),
            child: const Center(
              child: Text(
                "BM",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Bank Mini",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _inputField("Username"),
          const SizedBox(height: 6),
          _inputField("Password"),
          const SizedBox(height: 10),
          _button("Login", Colors.grey[600]!),
        ],
      ),
    );
  }

  Widget _inputField(String hint) {
    return Container(
      height: 22,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(child: Text(hint, style: const TextStyle(fontSize: 7))),
    );
  }

  Widget _button(String title, Color color) {
    return Container(
      width: double.infinity,
      height: 22,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 7),
        ),
      ),
    );
  }

  Widget _buildDashboardMockup() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 40,
              color: Colors.grey[300],
            ), // placeholder header
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: [
                  _menuItem(Icons.arrow_downward, "Setor"),
                  _menuItem(Icons.arrow_upward, "Tarik"),
                  _menuItem(Icons.send, "Transfer"),
                  _menuItem(Icons.apps, "Riwayat"),
                  _menuItem(Icons.settings, "Pengaturan"),
                  _menuItem(Icons.help_center, "Bantuan"),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[600],
            ),
            child: const Icon(Icons.person, size: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 12, color: Colors.black54),
          const SizedBox(height: 2),
          Text(title, style: const TextStyle(fontSize: 6)),
        ],
      ),
    );
  }

  Widget _buildTransactionMockup() {
    final transactions = [
      {
        "title": "Setor Tunai",
        "detail": "ATM Cabang A",
        "amount": "+Rp 500.000",
      },
      {
        "title": "Tarik Tunai",
        "detail": "ATM Cabang B",
        "amount": "-Rp 200.000",
      },
      {"title": "Transfer", "detail": "Ke Budi", "amount": "-Rp 150.000"},
      {"title": "Transfer", "detail": "Dari Andi", "amount": "+Rp 300.000"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final trx = transactions[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 4),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              const Icon(Icons.swap_horiz, color: Colors.black54, size: 12),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trx["title"]!,
                      style: const TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      trx["detail"]!,
                      style: const TextStyle(
                        fontSize: 6,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                trx["amount"]!,
                style: TextStyle(
                  color: trx["amount"]!.contains("+")
                      ? Colors.green[700]
                      : Colors.red[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 6,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileMockup() {
    return Stack(
      children: [
        Column(
          children: [
            Container(height: 50, color: Colors.grey[400]), // header
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _infoItem(
                      Icons.account_balance,
                      "No. Rekening",
                      "1001-1234-5678",
                    ),
                    _infoItem(Icons.phone, "Nomor HP", "+62 812 3456 7890"),
                    _infoItem(Icons.verified, "Status", "Aktif"),
                    const SizedBox(height: 8),
                    _button("Edit Profil", Colors.grey[600]!),
                    const SizedBox(height: 4),
                    _button("Logout", Colors.grey[800]!),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[600],
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }

  Widget _infoItem(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700], size: 10),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(fontSize: 6, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
