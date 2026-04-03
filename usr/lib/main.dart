import 'package:flutter/material.dart';

void main() {
  runApp(const YeosuFisheriesApp());
}

class YeosuFisheriesApp extends StatelessWidget {
  const YeosuFisheriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '사단법인 여수수산인협회',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF005B9F), // Ocean Blue
          primary: const Color(0xFF005B9F),
          secondary: const Color(0xFF00B4D8),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ProfileScreen(),
      },
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                _buildGreetingSection(context),
                const Divider(height: 48, thickness: 1),
                _buildVisionSection(context),
                const Divider(height: 48, thickness: 1),
                _buildActivitiesSection(context),
                const Divider(height: 48, thickness: 1),
                _buildContactSection(context),
                const SizedBox(height: 48),
                _buildFooter(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280.0,
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          '사단법인 여수수산인협회',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [Shadow(color: Colors.black45, blurRadius: 4)],
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            // 바다 느낌의 그라데이션 배경
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0077B6),
                    Color(0xFF00B4D8),
                  ],
                ),
              ),
            ),
            // 장식용 아이콘
            Positioned(
              right: -40,
              bottom: -40,
              child: Icon(
                Icons.sailing,
                size: 200,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Positioned(
              left: 40,
              top: 60,
              child: Icon(
                Icons.water,
                size: 100,
                color: Colors.white.withOpacity(0.15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '여수 수산인의\n든든한 동반자',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  height: 1.3,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            '사단법인 여수수산인협회는 여수 지역 수산인들의 권익을 보호하고, 지속 가능한 어업 환경을 조성하며, 지역 경제 발전에 기여하기 위해 설립되었습니다. 우리는 바다와 함께 살아가는 모든 수산인들의 목소리를 대변합니다.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                  color: Colors.black87,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisionSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, '핵심 가치'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildVisionCard(context, Icons.shield, '권익 보호')),
              const SizedBox(width: 12),
              Expanded(child: _buildVisionCard(context, Icons.eco, '지속 가능')),
              const SizedBox(width: 12),
              Expanded(child: _buildVisionCard(context, Icons.handshake, '상생 협력')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVisionCard(BuildContext context, IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildActivitiesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, '주요 사업'),
          const SizedBox(height: 16),
          _buildActivityItem(
            context,
            Icons.gavel,
            '정책 건의 및 권익 대변',
            '불합리한 수산 제도 개선 및 어업인 지원 정책 건의',
          ),
          _buildActivityItem(
            context,
            Icons.school,
            '수산인 교육 및 훈련',
            '선진 어업 기술 보급 및 안전 조업 교육 실시',
          ),
          _buildActivityItem(
            context,
            Icons.waves,
            '해양 환경 보전 활동',
            '바다 정화 활동 및 해양 생태계 보호 캠페인',
          ),
          _buildActivityItem(
            context,
            Icons.storefront,
            '수산물 유통 및 홍보',
            '여수 우수 수산물 브랜드화 및 판로 개척 지원',
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(BuildContext context, IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Theme.of(context).colorScheme.onSecondaryContainer),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, '오시는 길 및 연락처'),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildContactRow(Icons.location_on, '전라남도 여수시 (상세 주소 입력)'),
                const Divider(height: 24),
                _buildContactRow(Icons.phone, '061-000-0000'),
                const Divider(height: 24),
                _buildContactRow(Icons.email, 'contact@yeosufish.or.kr'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[600], size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(
            '사단법인 여수수산인협회',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Copyright © Yeosu Fisheries Association. All rights reserved.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
