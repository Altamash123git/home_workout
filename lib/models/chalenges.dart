class ChallengeModel {
  final String workout;
  final String description;
  final String exercisesperday;
  final int dayscompleted;
  final String img;
   String motivation;
  ChallengeModel({
   required this.motivation,
    required this.workout,
    required this.description,
    required this.exercisesperday,
    required this.dayscompleted,
    required this.img,
  });
}

List<ChallengeModel> challengelist = [
  ChallengeModel(
    workout: 'Arms',
    description:
        ' Tone and strengthen your arms in just 28 days with targeted exercises for biceps, triceps, and shoulders. Perfect for all levels, this plan builds muscle and confidence with gradual progress.',
    exercisesperday: '6',
    dayscompleted: 0,
    img: 'assets/arm.jpg',
    motivation: ""
  ),
  ChallengeModel(
    workout: 'Chest',
    description:
        'Build a stronger, sculpted chest in just 28 days! This plan focuses on push-ups, bench presses, and other chest-targeting exercises, gradually increasing in intensity. Suitable for all levels, it’s perfect for enhancing strength, definition, and confidence.',
    exercisesperday: '5',
    dayscompleted: 0,
    img: 'assets/chest.jpg',
      motivation: ""
  ),
  ChallengeModel(
    workout: 'Abes',
    description:
        'Tone and strengthen your core in 28 days with exercises like crunches, planks, and leg raises. This plan gradually increases in intensity to build definition and improve core strength.',
    exercisesperday: '5',
    dayscompleted: 3,
    img: 'assets/abes.jpg',
      motivation: ""
  ),
  ChallengeModel(
    workout: 'Shoulders',
    description:
        'Build strong, defined shoulders in 28 days with exercises like shoulder presses, lateral raises, and front raises. This plan increases in intensity to improve strength, mobility, and muscle definition.',
    exercisesperday: '7',
    dayscompleted: 0,
    img: 'assets/shoulders.jpg',
      motivation: ""
  ),
  ChallengeModel(
    motivation: "",
    workout: 'Legs',
    description:
        'Strengthen and tone your legs in 28 days with exercises like squats, lunges, and leg presses. This plan gradually increases intensity to build muscle, improve endurance, and enhance overall leg strength',
    exercisesperday: '5',
    dayscompleted: 0,
    img: 'assets/legs.jpg',
  ),
  ChallengeModel(

    workout: 'Full Body',

    motivation: "Success is earned, not given. Make each workout count and build the body you deserve!",
    description:
        ' Tone and strengthen your arms in just 28 days with targeted exercises for biceps, triceps, and shoulders. Perfect for all levels, this plan builds muscle and confidence with gradual progress.',
    exercisesperday: '7',
    dayscompleted: 0,
    img: 'assets/catimg5.jpg',
  ),
  ChallengeModel(
    motivation: "",
    workout: 'Cardio Blast',
    description:
        ' Tone and strengthen your arms in just 28 days with targeted exercises for biceps, triceps, and shoulders. Perfect for all levels, this plan builds muscle and confidence with gradual progress.',
    exercisesperday: '8',
    dayscompleted: 0,
    img: 'assets/catimg6.jpg',
  ),
  ChallengeModel(
    motivation:"Every rep gets you closer to your goal. Keep going, you’re stronger than you think!" ,
      workout: "Upper Body",
      description:
          "Focuses on calf muscle endurance and strength. Perform bodyweight or weighted versions for ankle stability and power. Enhances daily functional tasks like lifting or pushing.Strengthens the core due to stabilization requirements.",
      exercisesperday: "5",
      dayscompleted: 0,
      img: ""),
  ChallengeModel(
    motivation: "Push yourself today, and see the results tomorrow. Strength starts with your commitment.",
      workout: "Lower Body",
      description: "Builds strong, powerful legs and improves athletic performance.",
      exercisesperday: "5",
      dayscompleted: 0,
      img: "")
];
