import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final double coverHeight = 200;
  @override
  Widget build(BuildContext context) {
    final title = coverHeight / 7.5;
    final backPos = coverHeight / 4.5;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(child: aboutImage()),
              Positioned(
                left: 0,
                top: backPos - 45,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'About Us',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: const Text(
              'Our Vision is: “Transforming millets cultivation from subsistence farming to globally competitive through cost-effective and environment friendly production, processing and value addition technologies and supply chain networks”. The focus of our targeted outputs on a given timeline is in tune with the stated vision that could yield the expected gains in terms of enhanced production and stability of millets under low to moderate-rainfall situations, increased resistance to drought and other environmental stresses to address the climate change, diversification of the genetic base including hybrid cytoplasm, grainmold and leaf disease resistance, headbug, midge, stemborer and shootfly, grain quality and acid and saline-soil adaptability in sorghum; and yield improvement, drought tolerance and downey mildew, rust and ergot resistance and value addition in pearl Millet; and Yield enhancement technologies and blast resistance, including exploring possibility of developing hybrids in finger millet and other small millets; including low and high temperature tolerance in millets. While grain production is the main focus, forage and stover uses and quality are also of equal priority. National priorities, networks and international linkages, support and technology exchange will be integrated in the research agenda.',
              textAlign: TextAlign.justify,
              style: TextStyle(height: 1.5, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutImage() => Container(
        color: Colors.grey,
        child: CachedNetworkImage(
          imageUrl:
              "https://www.millets.res.in/images/dsr-building-560-360-new.jpg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  Widget aboutTitle() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
      );
}
