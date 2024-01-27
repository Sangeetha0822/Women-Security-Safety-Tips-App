import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsScreen extends StatefulWidget {
  final String title;

  const DetailsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  //int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      //_selectedTag = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white, // RGB values for peach

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 10),
                // Back Button
                const SizedBox(height: 25),
                // Text with lines
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Self-defense is protection\n'
                                'Walking home alone and feeling uneasy? Getting a weird vibe from a stranger on the bus? Many of us have been there.\n\n'
                                'In a January 2018 survey of 1,000 women nationwide, 81 percent reported experiencing some form of sexual harassment, assault, or both in their lifetime.\n\n'
                                'Verbal harassment was the most common form, but 51 percent of women said they were touched or groped in an unwelcome way, while 27 percent of women survived sexual assault.\n\n'
                                'Even if you’ve personally never felt yourself in a situation that made you feel physically unsafe, having reassurance about your next steps (and what you can do to help yourself should the unfortunate circumstance ever happen) can make all the difference.\n\n'
                                'A study from the University of Oregon found that women who participated in a self-defense class felt they:\n\n'
                                'had better safety strategies in place\n'
                                'were more equipped to deal with strangers, and people they know, in the context of potential assault or abuse\n'
                                'had more positive feelings about their bodies\n'
                                'had increased self-confidence',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image
                                Text(
                                  '1) Elbow Strike',
                                  style: TextStyle(
                                    fontSize: 20, // Adjust the font size as needed for a headline
                                    fontWeight: FontWeight.bold, // Make it bold
                                  ),
                                ),

                                Text(
                                    'If your attacker is in close range and you’re unable to get enough momentum to throw a strong punch or kick, use your elbows.\n\n'
                                      'To perform:\n'
                                      '->If you can, stabilize yourself with a strong core and legs to ensure a powerful blow.\n'
                                      '->Bend your arm at the elbow, shift your weight forward, and strike your elbow into your attacker’s neck, jawline, chin, or temple. These are all effective targets.\n'
                                      '->This may cause your attacker to loosen their grip, allowing you to run.\n' ,                                 style: TextStyle(fontSize: 16),
                                ),
                                Image.asset(
                                  'assets/Elbow-strike.webp', // Replace 'your_image.png' with the actual image path
                                  height: 300,
                                  width: 600,// Adjust the height as needed
                                ),

                                // Spacer between image and text
                                SizedBox(height: 12),
                              ]
                          ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image
                          Text(
                            '2) Groin kick',
                            style: TextStyle(
                              fontSize: 20, // Adjust the font size as needed for a headline
                              fontWeight: FontWeight.bold, // Make it bold
                            ),
                          ),

                          Text(

                                'If someone is coming at you from the front, a groin kick may deliver enough force to paralyze your attacker, making your escape possible.\n\n'
                                'To perform:\n'
                                '->Stabilize yourself as best you can.\n'
                                '->Lift your dominant leg off the ground and begin to drive your knee upward.\n'
                                '->Extend your dominant leg, drive hips forward, slightly lean back, and kick forcefully, making contact between your lower shin or ball of your foot and the attacker’s groin area.\n\n'
                                'Alternative:\n'
                      '->If your attacker is too close, thrust your knee toward the groin. Make sure you’re stabilized and not at risk of falling over',
                            style: TextStyle(fontSize: 16),
                          ),
                          Image.asset(
                            'assets/Groin-kick.webp', // Replace 'your_image.png' with the actual image path
                            height: 300,
                            width: 600,// Adjust the height as needed
                          ),

                          // Spacer between image and text
                          SizedBox(height: 12),
                          ]
                      ),
                          SizedBox(height: 16),

                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3) Heel Palm Strike',
                            style: TextStyle(
                              fontSize: 20, // Adjust the font size as needed for a headline
                              fontWeight: FontWeight.bold, // Make it bold
                            ),
                          ),


                          Text(

                                'This move can cause damage to the nose or throat. To execute, get in front of your attacker as much as is possible.\n\n'
                                'To perform:\n'
                                '-> With your dominant hand, flex your wrist.\n'
                                '- >Aim for either the attacker’s nose, jabbing upward from the nostrils, or underneath the attacker’s chin, jabbing upward at the throat.\n'
                                '- >Make sure to recoil your strike. Pulling your arm back quickly will help thrust the attacker’s head up and back.\n\n'
                                'Alternative:\n'
                              '->An open palm to the ears can be very disorienting.',
                            style: TextStyle(fontSize: 16),
                          ),
                          Image.asset(
                            'assets/Heel-palm-strike.webp', // Replace 'your_image.png' with the actual image path
                            height: 300,
                            width: 600,// Adjust the height as needed
                          ),
                          ]
                      ),

                          SizedBox(height: 16),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '4) Escape from a ‘bear hug attack’',
                                  style: TextStyle(
                                    fontSize: 20, // Adjust the font size as needed for a headline
                                    fontWeight: FontWeight.bold, // Make it bold
                                  ),
                                ),


                                Text(
                                  'For cases where the attacker is coming from behind, you’ll want to use this move. Focus on getting low and creating space to free yourself.\n'
                                   'To Perfornm\n'
                                  '->Bend forward from the waist. This shifts your weight forward, making it more difficult for your attacker to pick you up. It also gives you a better angle to throw elbows from side to side to the attacker’s face.:\n'
                                      '->Turn into the attacker with one of your elbows and continue counterattacking.\n'
                                  '->This should give you space to turn fully, using another move to injure the face or strike the groin. With the space these moves have created, you may be able to escape and run away.\n',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Image.asset(
                                  'assets/Escape-from-a-bear-hug-attack.webp', // Replace 'your_image.png' with the actual image path
                                  height: 300,
                                  width: 600,// Adjust the height as needed
                                ),
                              ]
                          ),

                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '5) Hammer Strike',
                            style: TextStyle(
                              fontSize: 20, // Adjust the font size as needed for a headline
                              fontWeight: FontWeight.bold, // Make it bold
                            ),
                          ),
                          Text(

                                'Using your keys is one of the easiest ways to defend yourself. Don’t use your fingernails, because you’re more at risk to injure your hands.\n\n'
                                'Instead, if you feel unsafe while walking at night, have your keys stick out from one side of your fist for hammer strikes.\n\n'
                                'Another way to use your keys is to click them onto a lanyard to swing at your attacker.\n\n'
                                'To perform:\n'
                                '- >Hold your key ring in a tight fist, like holding a hammer, with keys extending from the side of your hand.\n'
                                '-> Thrust downward toward your target.',
                            style: TextStyle(fontSize: 16),
                          ),
                          Image.asset(
                            'assets/Hamer-strike1.webp', // Replace 'your_image.png' with the actual image path
                            height: 300,
                            width: 600,// Adjust the height as needed
                          ),
                        ],
                      ),
                    ]
                      ),
                  ),
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
