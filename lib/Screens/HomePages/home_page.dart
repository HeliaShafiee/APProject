import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  String _formatBalance(int amount) {
    return amount.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => ',',
    );
  }

  final String userName = 'John Doe';
  final int totalBalance = 125250000;
  final int activeAccounts = 2;

  @override
Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildContent(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }


  Widget _buildBackground() {
    return Column(
      children: [
        Image.asset('assets/icons.BackgroundUp.jpg',
        width : double.infinity,
        fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildContent() {
    return SafeArea(child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildBalanceCard(),
          const SizedBox(height: 20),
          _buildQuickActions(),
          const SizedBox(height: 20),
          _buildServices(),
          const SizedBox(height: 20),
          _buildPromoBanner(),
          const SizedBox(height: 80),
        ],
      ),
    ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: const Color(0xFF0A5DBA),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'Accounts'),
        BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Groups'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }


  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.white,
        ),
        const SizedBox(width: 12),
        Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text(
        userName,
    style: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        ),
        ),
    Text('Welcome to BankOra', style: GoogleFonts.manrope(
    fontSize: 14,
    color: Colors.black54,
    ),
    ),
      ],
    ),
    ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors:[Color(0xFF061F5C), Color(0xFF0A5DBA)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.account_balance, color:Colors.white,size: 36),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Balance',
                  style: GoogleFonts.manrope(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  ),
                  Text('_formatBalance(totalBalance)} Toman',
                  style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${activeAccounts.toString()} Active Accounts',
                style: GoogleFonts.manrope(
                  color: Colors.white70,
                ),
                ),
                ElevatedButton(onPressed: (){}
                    ,style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Details',
                      style: GoogleFonts.manrope(
                        color: const Color(0xFF0A5DBA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                )
              ],
          )
        ],
      ),
    );
  }
  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _quickActionItem(Icons.credit_card, 'Card Transfer'),
        _quickActionItem(Icons.receipt_long, 'Statements'),
        _quickActionItem(Icons.groups, 'Joint Accounts'),
        _quickActionItem(Icons.send, 'Send Money'),
      ],
    );
  }
  Widget _quickActionItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: const Color(0xFF0A5DBA), size: 28),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.manrope(fontSize: 12),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
  Widget _buildServices() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _serviceItem(Icons.receipt, 'Bill Payment')),
            const SizedBox(width: 12),
            Expanded(child: _serviceItem(Icons.phone_android, 'Mobile Recharge')),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _serviceItem(Icons.account_balance, 'Manage Accounts')),
            const SizedBox(width: 12),
            Expanded(child: _serviceItem(Icons.settings, 'Settings')),
          ],
        ),
      ],
    );
  }
  Widget _serviceItem(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0A5DBA)),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildPromoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF66AEEF),
            Color(0xFF0A5DBA),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Open a new Account in Minutes!',
            style: GoogleFonts.manrope(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: Text(
              'Get Started',
              style: GoogleFonts.manrope(
                color: const Color(0xFF0A5DBA),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

}