import 'package:flutter/material.dart';
import '../models/design_sample.dart';
import 'design_detail_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock data for design samples
  final List<DesignSample> _designSamples = [
    DesignSample(
      imagePath: 'assets/images/design1.png',
      title: 'تصميم مودرن لغرفة معيشة',
      description: 'تصميم عصري وأنيق يجمع بين البساطة والفخامة، باستخدام مواد عالية الجودة وألوان محايدة لخلق مساحة مريحة وجذابة.',
      price: 1500.00,
    ),
    DesignSample(
      imagePath: 'assets/images/design2.png',
      title: 'تصميم مطبخ كلاسيكي',
      description: 'تصميم مطبخ فاخر بلمسات كلاسيكية، مع خزائن خشبية منحوتة وأسطح من الرخام، مما يوفر مساحة عملية وجميلة للطهي.',
      price: 2200.00,
    ),
    DesignSample(
      imagePath: 'assets/images/design3.png',
      title: 'تصميم حديقة خارجية',
      description: 'تصميم حديقة خلابة مع مساحات خضراء ومنطقة جلوس مريحة، مثالية للاسترخاء والاستمتاع بالطبيعة.',
      price: 1800.00,
    ),
    DesignSample(
      imagePath: 'assets/images/design4.png',
      title: 'تصميم غرفة نوم هادئة',
      description: 'تصميم يركز على الراحة والهدوء، بألوان الباستيل وإضاءة خافتة لخلق جو مثالي للنوم والاسترخاء.',
      price: 1300.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نماذج التصاميم'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.contact_phone),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactScreen()),
              );
            },
            tooltip: 'تواصل معنا',
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        itemCount: _designSamples.length,
        itemBuilder: (context, index) {
          final design = _designSamples[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DesignDetailScreen(design: design),
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      design.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      design.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                    child: Text(
                      '\$${design.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
