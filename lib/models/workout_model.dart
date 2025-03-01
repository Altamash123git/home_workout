class WorkoutModel {
  final String workoutname;
  String? week;
  final String image;
  final String exercises;
  final String calories;
  final String duration;
  final List<String> exerciselist;

  final List<String> exercisedetaillist;
  final List<String> exercisegiflist;
  final List<String> exerciseaudiolist;
  final List<String> instructions;
  final List<String> focus_areas;
  final List<String> not_to_do;
  final List<String> shortdescription;
  List<WeekDataModel> weekwise;
  WorkoutModel({
    this.week,
    this.weekwise = const [],
    required this.workoutname,
    required this.image,
    required this.exercises,
    required this.calories,
    required this.duration,
    required this.exerciselist,
    required this.exercisedetaillist,
    required this.exercisegiflist,
    required this.exerciseaudiolist,
    required this.instructions,
    required this.focus_areas,
    required this.not_to_do,
    required this.shortdescription,
  });
}

class WeekDataModel {
  String WeekNO;

  final List<String> exercisegiflist;
  final List<String> exerciseaudiolist;
  final List<String> instructions;
  final List<String> focus_areas;
  final List<String> not_to_do;

  final List<String> workoutlist;
  final List<String> shortdesc;
  WeekDataModel(
      {required this.exerciseaudiolist,
      required this.exercisegiflist,
      required this.WeekNO,
      required this.workoutlist,
      required this.instructions,
      required this.focus_areas,
      required this.not_to_do,
      required this.shortdesc});
}

List<WorkoutModel> workoutlist = [
  WorkoutModel(
    shortdescription: [
      "A core-strengthening isometric exercise that improves stability and endurance.",
      "A dynamic abdominal exercise that targets the obliques and lower abs.",
      "A lower abs movement that enhances core strength and stability.",
      "A twisting motion that engages the obliques and strengthens the core.",
      "A fast-paced cardio move that activates the core and burns calories.",
      "A side-core exercise that improves balance and strengthens the obliques.",
      "A fluttering leg motion that engages the lower abs and hip flexors.",
      "A full-core movement that combines a sit-up and leg raise for maximum engagement."
    ],
    workoutname: 'Abs Workout',
    image: 'assets/images/abs.jpg',
    exercises: '8',
    calories: '400',
    duration: '03:00',
    exerciselist: [
      "Plank",
      'Bicycle Crunches',
      'Leg Raises',
      'Russian Twists',
      'Mountain Climbers',
      "Side Plank",
      'Flutter kicks',
      "V-Ups"
    ],
    exercisedetaillist: [
      'Reverse crunches effectively target the lower abdominal muscles and improve core strength. Start by lying on your back with your arms at your sides and legs bent at a 90-degree angle. Engage your core as you lift your hips off the ground, curling them toward your chest in a controlled motion, then slowly lower them back down. Avoid using momentum and focus on smooth, deliberate movements for best results.',
      'Leg raises are a simple and effective exercise to strengthen your lower abdominal muscles. Lie flat on your back with your arms at your sides and legs extended straight. Keeping your core engaged, slowly lift your legs until they form a 90-degree angle with your body, then lower them back down without letting them touch the ground. Maintain control throughout the movement to maximize the benefits and avoid straining your lower back.',
      'The high plank is a foundational core-strengthening exercise that also engages your shoulders, arms, and legs. Start in a push-up position with your hands directly under your shoulders and your body forming a straight line from head to heels. Keep your core tight, avoid arching your back or raising your hips, and hold the position for 20–60 seconds, focusing on maintaining proper form. Breathe steadily throughout the hold for maximum stability and endurance.',
      'The side plank is an excellent exercise to strengthen your obliques, core, and stabilizing muscles. Lie on one side with your legs stacked and your elbow directly under your shoulder. Lift your hips off the ground, creating a straight line from your head to your feet. Keep your core tight and hold the position for 20–60 seconds, ensuring your body stays aligned. Repeat on the other side for balanced strength development.',
      'Push-ups are a classic upper-body exercise that targets the chest, shoulders, triceps, and core. Start in a high plank position with your hands slightly wider than shoulder-width apart and your body in a straight line from head to heels. Lower your body by bending your elbows until your chest is close to the ground, then push back up to the starting position. Maintain a tight core and steady breathing for proper form, and aim for 10–15 repetitions or more based on your fitness level.',
    ],
    exercisegiflist: [
      'assets/exercises/reverse_crunch.gif',
      'assets/exercises/leg_raises.gif',
      'assets/exercises/high_plank.png',
      'assets/exercises/side_plank.png',
      'assets/exercises/pushups.gif',
      'assets/exercises/high_plank.png',
      'assets/exercises/side_plank.png',
      'assets/exercises/pushups.gif',
    ],
    exerciseaudiolist: [
      'audio/reversecrunches.mp3',
      'audio/legraises.mp3',
      'audio/highplank.mp3',
      'audio/sideplank.mp3',
      'audio/pushups.mp3',
      'audio/highplank.mp3',
      'audio/sideplank.mp3',
      'audio/pushups.mp3',
    ],
    instructions: [
      "1. Hold for 30-40 seconds, 3 sets \n2. Start in a push-up position with hands under shoulders.\n3. Engage your core, keep your body in a straight line from head to heels.\n4. Hold the position without letting your hips drop or rise too high.",
      "1. 20-25 reps per side, 3 sets \n2. Lie on your back with hands behind your head.\n3. Lift your shoulders off the ground and bring your right elbow toward your left knee while extending the right leg.\n4. Switch sides in a pedaling motion.",
      "1. 15-20 reps, 3 sets \n2. Lie on your back with legs straight and hands under your hips.\n3. Lift your legs up to 90° while keeping them straight.\n4. Slowly lower them without touching the floor.",
      "1. 20 reps per side, 3 sets \n2. Sit on the floor with knees bent and feet slightly lifted.\n3. Hold your hands together or a weight and twist your torso side to side.\n4. Keep your core engaged throughout.",
      "1. 30-40 reps, 3 sets \n2. Start in a plank position.\n3. Bring one knee toward your chest while keeping your body aligned.\n4. Quickly switch legs in a running motion.",
      "1. Hold for 20-30 seconds per side, 3 sets \n2. Lie on your side with feet stacked and elbow under your shoulder.\n3. Lift your hips, keeping your body in a straight line.\n4. Hold and switch sides.",
      "1. 30-35 seconds, 3 sets \n2. Lie on your back with hands under your hips.\n3. Lift both legs slightly and kick up and down in a fluttering motion.\n4. Keep your core engaged and lower back on the mat.",
      "1. 15-20 reps, 3 sets \n2. Lie on your back with legs straight and arms extended overhead.\n3. Simultaneously lift your arms and legs to meet in a V-shape.\n4. Lower back down with control."
    ],
    focus_areas: [
      "Core, shoulders, arms:\nStrengthens the core while engaging shoulders and arms for stability.",
      "Obliques, core, lower abs:\nWorks the obliques and core, improving rotation and balance.",
      "Lower abs, hip flexors:\nTargets lower abdominal muscles and improves hip flexibility.",
      "Obliques, core stability:\nEnhances rotational strength and overall core balance.",
      "Core, cardio endurance, shoulders:\nImproves core endurance while providing a cardio challenge.",
      "Obliques, core, shoulders:\nStrengthens obliques and improves core and shoulder stability.",
      "Lower abs, endurance:\nEngages lower abs while enhancing muscular endurance.",
      "Full core activation, hip flexors:\nWorks the entire core and improves hip strength."
    ],
    not_to_do: [
      "1. Avoid dropping or raising hips too high.\n2. Do not let your lower back sag.",
      "1. Do not pull on your neck.\n2. Avoid using momentum—engage your core.",
      "1. Avoid arching your lower back.\n2. Do not lift your legs too fast—control the motion.",
      "1. Do not move only your arms—rotate your torso fully.\n2. Avoid holding your breath.",
      "1. Do not let your hips sag.\n2. Avoid bouncing or rushing through reps.",
      "1. Keep your body straight—do not let your hips drop.\n2. Avoid sinking into your shoulders.",
      "1. Avoid bending your knees.\n2. Do not let your lower back lift off the floor.",
      "1. Don’t use momentum; control your movement.\n2. Avoid bending your knees too much."
    ],
  ),
  WorkoutModel(
    shortdescription: [
      "A fundamental bodyweight exercise for chest and core strength.",
      "An easier variation that reduces resistance while building strength.",
      "A challenging variation that emphasizes the upper chest.",
      "A push-up variation that widens chest activation.",
      "A close-hand push-up that primarily targets the triceps.",
      "A unilateral push-up that improves strength and control on each side."
    ],
    instructions: [
      "1. 15-20 reps, 3 sets \n2. Start in a high plank position, hands slightly wider than shoulders.\n3. Lower your chest to the ground, keeping your body straight.\n4. Push back up to the starting position.",
      "1. 12-15 reps, 3 sets \n2. Place your hands on an elevated surface (bench, step, or wall).\n3. Keep your body straight and lower your chest toward the surface.\n4. Push back up, engaging your chest and arms.",
      "1. 12-15 reps, 3 sets \n2. Place your feet on an elevated surface and hands on the floor.\n3. Lower your chest towards the ground, keeping your core tight.\n4. Push back up to the starting position.",
      "1. 15 reps, 3 sets \n2. Position hands wider than shoulder-width.\n3. Lower your chest to the ground, keeping elbows at a 45° angle.\n4. Push back up to the starting position.",
      "1. 12-15 reps, 3 sets \n2. Place hands close together, forming a diamond shape under your chest.\n3. Lower your body while keeping elbows tucked in.\n4. Push back up, engaging the triceps and chest.",
      "1. 10-12 reps per side, 3 sets \n2. Place hands wider than shoulder-width, shifting weight to one side.\n3. Lower your body towards one hand, keeping the other arm extended.\n4. Push back up and switch sides."
    ],
    focus_areas: [
      "Chest, shoulders, triceps, core:\nBuilds upper body strength while engaging the core.",
      "Chest, shoulders, arms:\nReduces resistance for an easier push-up variation.",
      "Upper chest, shoulders, triceps:\nTargets the upper chest and shoulders more intensely.",
      "Chest, shoulders, core:\nEmphasizes chest expansion and upper body control.",
      "Triceps, chest, shoulders:\nFocuses on triceps while still engaging the chest and shoulders.",
      "Chest, shoulders, triceps:\nEnhances unilateral strength by isolating each arm."
    ],
    not_to_do: [
      "1. Avoid letting your hips sag or rise too high.\n2. Keep elbows at a 45° angle to protect the shoulders.",
      "1. Do not arch your lower back.\n2. Keep your core engaged for stability.",
      "1. Avoid flaring your elbows out.\n2. Do not rush; maintain controlled movement.",
      "1. Keep your wrists aligned with your shoulders.\n2. Avoid dropping too fast; control the movement.",
      "1. Do not let your elbows flare outward.\n2. Keep your back straight and avoid arching.",
      "1. Do not rush the movement; control both sides.\n2. Keep your core tight to prevent imbalance."
    ],
    workoutname: 'Arms Workout',
    image: 'assets/images/shoulder2.jpg',
    exercises: '7',
    calories: '500',
    duration: '04:00',
    exerciselist: [
      "Push-Ups",
      "Diamond Push-Ups",
      "Tricep Dips",
      "Close-Grip Push-Ups",
      "Plank to Push-Ups",
      "Bodyweight Bicep Curls",
      "Inverted Push-Ups"
    ],
    exercisedetaillist: [
      'The dumbbell bent-over row strengthens your back, shoulders, and arms. Hold a dumbbell in each hand, lean forward with a straight back, and slightly bend your knees. Pull the dumbbells toward your body, squeezing your shoulder blades together, then slowly lower them back down. Do this 10–15 times, keeping the movement slow and steady.',
      'Burpees are a full-body exercise that builds strength and endurance. Start standing, then squat down and place your hands on the ground. Jump your feet back into a plank position, do a push-up (optional), then jump your feet forward to your hands. Finally, jump up with your arms overhead. Repeat this sequence for 10–15 reps, moving at a steady pace while keeping good form.',
      'Reverse crunches effectively target the lower abdominal muscles and improve core strength. Start by lying on your back with your arms at your sides and legs bent at a 90-degree angle. Engage your core as you lift your hips off the ground, curling them toward your chest in a controlled motion, then slowly lower them back down. Avoid using momentum and focus on smooth, deliberate movements for best results.',
      'The dumbbell extension targets the triceps. Hold a dumbbell overhead with both hands, elbows close to ears. Bend elbows to lower the dumbbell behind your head, then straighten arms to return to the starting position.',
      'Chest-focused dips primarily target the chest and triceps. To perform this variation, use parallel bars or a bench. Start by gripping the bars with your arms fully extended and your body upright. Lean slightly forward to engage the chest more. Lower your body by bending your elbows at a 90-degree angle while keeping your chest open and shoulders back. Push yourself back up to the starting position. To make the exercise more challenging, you can add weight using a dip belt.',
      'Push-ups are a classic upper-body exercise that targets the chest, shoulders, triceps, and core. Start in a high plank position with your hands slightly wider than shoulder-width apart and your body in a straight line from head to heels. Lower your body by bending your elbows until your chest is close to the ground, then push back up to the starting position. Maintain a tight core and steady breathing for proper form, and aim for 10–15 repetitions or more based on your fitness level.',
    ],
    exercisegiflist: [
      'assets/exercises/dumbell_bench_over_row.gif',
      'assets/exercises/burpees.gif',
      'assets/exercises/reverse_crunch.gif',
      'assets/exercises/dumbell_extension.gif',
      'assets/exercises/dips.gif',
      'assets/exercises/pushups.gif',
    ],
    exerciseaudiolist: [
      'audio/dumbellbentoverrow.mp3',
      'audio/burpees.mp3',
      'audio/reversecrunches.mp3',
      'audio/dumbellextension.mp3',
      'audio/dips.mp3',
      'audio/pushups.mp3',
    ],
  ),
  WorkoutModel(
    shortdescription: [
      "A fundamental bodyweight exercise for chest and core strength.",
      "An easier variation that reduces resistance while building strength.",
      "A challenging variation that emphasizes the upper chest.",
      "A push-up variation that widens chest activation.",
      "A close-hand push-up that primarily targets the triceps.",
      "A unilateral push-up that improves strength and control on each side."
    ],
    instructions: [
      "1. 15-20 reps, 3 sets \n2. Start in a high plank position with hands slightly wider than shoulders.\n3. Lower your chest to the ground, keeping your body straight.\n4. Push back up to the starting position.",
      "1. 12-15 reps, 3 sets \n2. Place your hands on an elevated surface (bench, step, or wall).\n3. Keep your body straight and lower your chest toward the surface.\n4. Push back up, engaging your chest and arms.",
      "1. 12-15 reps, 3 sets \n2. Place your feet on an elevated surface and hands on the floor.\n3. Lower your chest towards the ground, keeping your core tight.\n4. Push back up to the starting position.",
      "1. 15 reps, 3 sets \n2. Position hands wider than shoulder-width.\n3. Lower your chest to the ground, keeping elbows at a 45° angle.\n4. Push back up to the starting position.",
      "1. 12-15 reps, 3 sets \n2. Place hands close together, forming a diamond shape under your chest.\n3. Lower your body while keeping elbows tucked in.\n4. Push back up, engaging the triceps and chest.",
      "1. 10-12 reps per side, 3 sets \n2. Place hands wider than shoulder-width, shifting weight to one side.\n3. Lower your body towards one hand, keeping the other arm extended.\n4. Push back up and switch sides."
    ],
    focus_areas: [
      "Chest, shoulders, triceps, core:\nBuilds upper body strength while engaging the core.",
      "Chest, shoulders, arms:\nReduces resistance for an easier push-up variation.",
      "Upper chest, shoulders, triceps:\nTargets the upper chest and shoulders more intensely.",
      "Chest, shoulders, core:\nEmphasizes chest expansion and upper body control.",
      "Triceps, chest, shoulders:\nFocuses on triceps while still engaging the chest and shoulders.",
      "Chest, shoulders, triceps:\nEnhances unilateral strength by isolating each arm."
    ],
    not_to_do: [
      "1. Avoid letting your hips sag or rise too high.\n2. Keep elbows at a 45° angle to protect the shoulders.",
      "1. Do not arch your lower back.\n2. Keep your core engaged for stability.",
      "1. Avoid flaring your elbows out.\n2. Do not rush; maintain controlled movement.",
      "1. Keep your wrists aligned with your shoulders.\n2. Avoid dropping too fast; control the movement.",
      "1. Do not let your elbows flare outward.\n2. Keep your back straight and avoid arching.",
      "1. Do not rush the movement; control both sides.\n2. Keep your core tight to prevent imbalance."
    ],
    workoutname: 'Chest Workout',
    image: 'assets/images/chest.jpg',
    exercises: '6',
    calories: '700kcal',
    duration: '05:00',
    exerciselist: [
      "Standard Push_ups",
      "Incline Push ups",
      'Decline Push-Ups',
      "Wide-Grip Push_ups",
      "Diamond Push_Ups",
      "Archer Push-Ups",
    ],
    exercisedetaillist: [
      'The barbell bench press is a compound exercise that targets the chest, shoulders, and triceps. Lie flat on a bench with your feet flat on the ground and your hands gripping the barbell slightly wider than shoulder-width apart. Lower the barbell slowly to your chest, keeping your elbows at a 45-degree angle to your body. Push the barbell back up to the starting position, fully extending your arms. Ensure your back stays flat on the bench and your core remains engaged throughout the movement.',
      'The incline dumbbell press targets the upper chest, shoulders, and triceps. Set an incline bench at a 30-45 degree angle and sit with a dumbbell in each hand, resting on your thighs. Lie back on the bench and press the dumbbells up, keeping your palms facing forward and elbows at a slight angle. Lower the dumbbells slowly until your elbows are at a 90-degree angle, then press them back up to the starting position. Keep your core tight and maintain controlled movements throughout.',
      'Push-ups are a classic upper-body exercise that targets the chest, shoulders, triceps, and core. Start in a high plank position with your hands slightly wider than shoulder-width apart and your body in a straight line from head to heels. Lower your body by bending your elbows until your chest is close to the ground, then push back up to the starting position. Maintain a tight core and steady breathing for proper form, and aim for 10–15 repetitions or more based on your fitness level.',
      'Chest-focused dips primarily target the chest and triceps. To perform this variation, use parallel bars or a bench. Start by gripping the bars with your arms fully extended and your body upright. Lean slightly forward to engage the chest more. Lower your body by bending your elbows at a 90-degree angle while keeping your chest open and shoulders back. Push yourself back up to the starting position. To make the exercise more challenging, you can add weight using a dip belt.',
      'Incline push-ups are a great variation that targets the lower chest and shoulders. To perform them, place your hands on an elevated surface like a bench, step, or sturdy platform, keeping your body in a straight line from head to heels. Lower your chest towards the surface by bending your elbows, then push back up to the starting position. Keep your core engaged and maintain control throughout the movement. The higher the incline, the easier the exercise, so adjust the height based on your fitness level.',
    ],
    exercisegiflist: [
      'assets/exercises/dumbell_bench_press.gif',
      'assets/exercises/incline_dumbell_press.gif',
      'assets/exercises/pushups.gif',
      'assets/exercises/dips.gif',
      'assets/exercises/incline_pushups.gif',
      'assets/exercises/incline_pushups.gif',
    ],
    exerciseaudiolist: [
      'audio/dumbellbenchpress.mp3',
      'audio/inclinedumbelpress.mp3',
      'audio/pushups.mp3',
      'audio/dips.mp3',
      'audio/inclinepushups.mp3',
    ],
  ),
  WorkoutModel(
    shortdescription: [
      "A fundamental lower body exercise that builds leg strength and endurance.",
      "A single-leg exercise that improves balance and strengthens the legs.",
      "A hip-dominant movement that strengthens the glutes and lower back.",
      "A challenging single-leg exercise for strength and balance.",
      "A static hold that builds endurance in the lower body.",
      "A calf-focused exercise that improves ankle strength and stability.",
      "A functional movement that strengthens the legs and improves stepping power."
    ],
    instructions: [
      "1. 15-20 reps, 3 sets \n2. Stand with feet shoulder-width apart.\n3. Lower your body by bending your knees and pushing your hips back.\n4. Keep your chest up and back straight.\n5. Push through your heels to return to the starting position.",
      "1. 12-15 reps per leg, 3 sets \n2. Stand tall, step one foot forward, and lower your back knee close to the ground.\n3. Keep your front knee aligned with your ankle.\n4. Push back up and switch legs.",
      "1. 15 reps, 3 sets \n2. Lie on your back with knees bent and feet flat on the floor.\n3. Press through your heels to lift your hips towards the ceiling.\n4. Squeeze your glutes at the top, then lower back down slowly.",
      "1. 12 reps per leg, 3 sets \n2. Stand in front of a bench or step.\n3. Place one foot on the elevated surface and push through your heel to lift your body.\n4. Slowly lower back down and switch legs.",
      "1. Hold for 30-45 seconds, 3 sets \n2. Stand with your back against a wall, feet shoulder-width apart.\n3. Lower into a squat position, keeping your back against the wall.\n4. Hold the position, keeping thighs parallel to the ground.",
      "1. 20 reps, 3 sets \n2. Stand with feet hip-width apart.\n3. Push through the balls of your feet to raise your heels as high as possible.\n4. Lower back down slowly.",
      "1. 12-15 reps per leg, 3 sets \n2. Stand in front of a bench or step.\n3. Step one foot onto the surface and push through your heel to lift your body up.\n4. Lower back down slowly and switch legs."
    ],
    focus_areas: [
      "Quadriceps, glutes, hamstrings:\nImproves lower body strength and stability.",
      "Quads, hamstrings, glutes, core:\nEnhances balance and functional leg strength.",
      "Glutes, hamstrings, lower back:\nStrengthens posterior chain and improves hip mobility.",
      "Quads, glutes, balance:\nChallenges single-leg strength and stability.",
      "Quads, endurance, core:\nBuilds lower body endurance and stability.",
      "Calves, ankle stability:\nImproves lower leg strength and balance.",
      "Quads, glutes, endurance:\nEnhances leg power and stepping strength."
    ],
    not_to_do: [
      "1. Avoid letting your knees cave inward.\n2. Keep your chest lifted and back straight.",
      "1. Do not let your knee go too far past your toes.\n2. Avoid dropping your back knee too fast.",
      "1. Avoid arching your lower back.\n2. Do not push through your toes; use your heels.",
      "1. Do not rush; control the movement.\n2. Avoid using momentum to step up.",
      "1. Keep your knees at 90° and back flat against the wall.\n2. Do not slide down too low.",
      "1. Do not bounce at the top.\n2. Avoid rolling your ankles outward.",
      "1. Do not lean too far forward.\n2. Control the descent to avoid knee strain."
    ],
    workoutname: 'Legs Workout',
    image: 'assets/images/legs.jpg',
    exercises: '5',
    calories: '800',
    duration: '06:00',
    exerciselist: [
      ' Bodyweight Squats',
      'Lunges(Alternating Legs)',
      'Glute Bridges',
      "Bulgarian Step-Ups"
          'Wall Squats',
      'Calf Raises',
      "Step Ups"
    ],
    exercisedetaillist: [
      'Bodyweight squats are a great exercise for strengthening the legs and glutes. Stand with your feet shoulder-width apart and your toes slightly pointed out. Lower your body by bending your knees and pushing your hips back as if youre sitting in a chair. Keep your chest up and your back straight as you lower yourself until your thighs are parallel to the ground or as low as you can comfortably go Push through your heels to stand back up to the starting position Repeat  10-15 reps, focusing on controlled movement.',
      'Lunges are a great exercise for working the legs, glutes, and core. Start by standing with your feet shoulder-width apart. Step forward with one leg, bending both knees to lower your body until your back knee is close to the ground (about a 90-degree angle). Keep your chest upright and your front knee aligned with your ankle. Push through your front heel to return to the starting position. Alternate legs with each repetition, performing 10-15 reps per leg. For added challenge, you can hold dumbbells in each hand.',
      'The forward lunge strengthens legs and glutes. Step forward with one leg, lowering hips until both knees form 90-degree angles. Push through the front heel to return to the starting position and alternate legs.', // 'Step-ups are a great exercise for strengthening the legs and glutes. Start by standing in front of a bench or sturdy platform, with your feet hip-width apart. Step one foot onto the bench, pressing through your heel to lift your body up, and bring your other leg up to stand fully on the bench. Step back down with the same leg you started with, then repeat with the opposite leg. Perform 10–15 reps per leg, focusing on controlled movements. For added difficulty, hold dumbbells in each hand.',
      'Wall squats strengthen legs and improve endurance. Press your back against a wall, slide down until thighs are parallel to the ground, knees at 90 degrees. Hold the position for the desired time, keeping core engaged.', // 'Glute bridges are an effective exercise for targeting the glutes, hamstrings, and core. Lie on your back with your knees bent and feet flat on the ground, hip-width apart. Place your arms by your sides with palms facing down. Push through your heels to lift your hips towards the ceiling, squeezing your glutes at the top. Keep your back straight and avoid arching it. Lower your hips back down to the ground in a controlled motion. Repeat for 10–15 reps, focusing on engaging your glutes throughout the movement.',
      'Calf raises are a simple but effective exercise for strengthening the calf muscles. Stand with your feet hip-width apart, either on flat ground or with the balls of your feet on an elevated surface like a step. Slowly raise your heels as high as possible, squeezing your calves at the top, then lower your heels back down to the starting position. Perform 15-20 repetitions, keeping your movements controlled. For added difficulty, hold dumbbells in each hand or perform the exercise on one leg at a time.',
    ],
    exercisegiflist: [
      'assets/exercises/squats.gif',
      'assets/exercises/lunges.gif',
      'assets/exercises/forward_lunge.gif',
      'assets/exercises/wall_squats.gif',
      'assets/exercises/calf_raises.gif',
    ],
    exerciseaudiolist: [
      'audio/squats.mp3',
      'audio/lunges.mp3',
      'audio/forwardlunges.mp3',
      'audio/wallsquats.mp3',
      'audio/wallsquats.mp3',
    ],
  ),
  WorkoutModel(
    shortdescription: [
      "The barbell bench press is a compound exercise that targets the chest, shoulders, and triceps.",
      "The incline dumbbell press targets the upper chest, shoulders, and triceps",
      "Push-ups are a classic upper-body exercise that targets the chest, shoulders, triceps, and core.",
      "Chest-focused dips primarily target the chest and triceps.",
      "Incline push-ups are a great variation that targets the lower chest and shoulders"
    ],
    instructions: [
      " 1. Lie on your back, arms at your sides\n2. Lift your legs, bending your knees to 90°.\n3. Use your core to lift your hips off the ground, bringing your knees toward your chest.\n4.Slowly lower back to the starting position.",
      "1. Lie on your back with legs straight and hands under your hips.\n2. Lift your legs off the ground to a 90° angle.\n3. Slowly lower them back without touching the floor.",
      "1. Start in a push-up position, with hands under shoulders and body in a straight line.\n2. Engage your core, keep your hips level, and hold. ",
      "1.Lie on your side, stack your feet, and place your elbow under your shoulder.\n2.Lift your hips off the ground, forming a straight line from head to feet.\n3. Hold and switch sides. ",
      "1. Start in a high plank position, hands slightly wider than shoulders.\n2. Lower your chest to the ground, keeping your body straight.\n3. Push back up to the starting position.",
    ],
    focus_areas: [
      "lower abs:\nTargets the lower abdominal muscles, helping to tone and strengthen the core.",
      "Lower abs and hip flexors:\nEngages the lower abs and hip flexors, improving core stability and strength",
      "Core,shoulders and arms:\nActivates the core, shoulders, and arms, building overall stability and endurance.",
      " Obliques, core, and shoulders:\nStrengthens the obliques and improves core stability while engaging the shoulders.",
      "Chest,shoulders, tricep and core:\nWorks the chest, shoulders, triceps, and core, improving upper body strength.",
    ],
    not_to_do: [
      "1.Avoid using momentum to lift your hips\n2. Do not arch your lower back; keep it pressed against the mat. ",
      "1.Avoid lifting your head or shoulders.\n2. Do not let your lower back arch off the mat. ",
      "1. Avoid letting your hips drop.\n2. Do not lean forward or backward; keep alignment. ",
      "1. Avoid letting your hips drop\n2. Do not lean forward or backward; keep alignment",
      "1.Avoid arching your back or flaring your elbows.\n2. Do not let your hips sag or rise too high.",
    ],
    workoutname: 'Full Body',
    weekwise: [
      WeekDataModel(
          exerciseaudiolist: [
            'audio/jumpingjacks.mp3',
            'audio/mountainclimb.mp3',
            'audio/pushups.mp3',
            'audio/squats.mp3',
            'audio/shoulderplank.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/pushups.gif',
            'assets/exercises/squats.gif',
            'assets/exercises/plank_shoulder_taps.gif',
          ],
          WeekNO: "1.1. days-1,3,5",
          workoutlist: [
            'Push-Ups',
            "BodyWeight Squats",
            'Plank',
            'Mountain Climbers',
            "Glute Bridges"
          ],
          instructions: [
            "1. Start in a high plank position, hands slightly wider than shoulders.\n2. Lower your chest to the ground, keeping your body straight.\n3. Push back up to the starting position.",
            "1. Stand with feet shoulder-width apart, hands in front of you.\n2. Lower your hips, keeping your chest up.\n3. Push through your heels to return to the starting position.",
            "1. Start in a forearm plank position with a straight body.\n2. Engage your core and hold the position.",
            "1. Start in a high plank position.\n2. Bring one knee towards your chest, then switch legs in a running motion.",
            "1. Lie on your back with knees bent and feet flat on the ground.\n2. Push through your heels to lift your hips off the ground.\n3. Lower back down and repeat."
          ],
          focus_areas: [
            "Chest, shoulders, triceps, and core:\nWorks the upper body and improves core stability.",
            "Legs and glutes:\nStrengthens the quadriceps, hamstrings, and glutes.",
            "Core, shoulders, and back:\nImproves core endurance and posture.",
            "Core and legs:\nEngages the core and improves cardiovascular endurance.",
            "Glutes and hamstrings:\nTargets the posterior chain, improving hip strength."
          ],
          not_to_do: [
            "1. Avoid arching your back or flaring your elbows.\n2. Do not let your hips sag or rise too high.",
            "1. Do not let your knees go past your toes.\n2. Avoid rounding your back or looking down.",
            "1. Avoid letting your hips drop.\n2. Do not lean forward or backward; keep alignment.",
            "1. Do not bounce or go too fast.\n2. Avoid lifting your hips too high.",
            "1. Avoid pushing with your lower back.\n2. Keep your knees in line with your feet."
          ],
          shortdesc: [
            "Strengthens chest, shoulders, and triceps.",
            "Builds lower body strength and endurance.",
            "Engages core muscles for stability and strength.",
            "Boosts cardiovascular endurance and core strength.",
            "Activates and strengthens the glutes and hamstrings."
          ]),
      WeekDataModel(
          shortdesc: [
            "Full-body cardio workout to increase heart rate.",
            "Improves agility and burns calories fast.",
            "Strengthens core and improves balance.",
            "Targets abs and obliques for core definition.",
            "Full-body workout for endurance and explosive strength."
          ],
          exerciseaudiolist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/pushups.gif',
            'assets/exercises/squats.gif',
            'audio/burpees.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/pushups.gif',
            'assets/exercises/squats.gif',
            'assets/exercises/burpees.gif',
          ],
          WeekNO: "1.2,days-2,4",
          workoutlist: [
            "Jumping Jacks",
            "High Knees",
            "Plank Shoulder Taps",
            "Bicycle Crunches",
            "Burpees"
          ],
          instructions: [
            "1. Stand upright with feet together, hands by your sides.\n2. Jump, spreading your legs and raising your arms above your head.\n3. Return to the starting position and repeat.",
            "1. Stand with feet hip-width apart.\n2. Run in place by bringing your knees up towards your chest.",
            "1. Start in a high plank position.\n2. Tap your left shoulder with your right hand, then switch sides.",
            "1. Lie on your back, hands behind your head.\n2. Bring one knee toward your chest while twisting your torso to touch the opposite elbow.\n3. Alternate sides in a pedaling motion.",
            "1. Stand with feet shoulder-width apart.\n2. Lower into a squat, place hands on the floor, jump back into a plank, do a push-up, jump forward, and explode up."
          ],
          focus_areas: [
            "Full body, cardio:\nImproves cardiovascular endurance and burns calories.",
            "Legs and core:\nStrengthens lower body muscles while enhancing stamina.",
            "Core, shoulders, and stability:\nEnhances coordination and builds shoulder strength.",
            "Core and obliques:\nEngages the abdominal muscles for core stability.",
            "Full body, explosive strength:\nCombines cardio with strength training for endurance."
          ],
          not_to_do: [
            "1. Avoid shallow jumps.\n2. Do not land too hard on your feet.",
            "1. Avoid leaning back.\n2. Keep your core engaged and move quickly.",
            "1. Do not let your hips sway.\n2. Keep your movements controlled.",
            "1. Avoid pulling on your neck.\n2. Engage your core fully.",
            "1. Do not rush the movement.\n2. Keep your back straight during the squat."
          ]),
      WeekDataModel(
          shortdesc: [
            "Upper body and core strength exercise.",
            "Builds leg muscles and enhances endurance.",
            "Strengthens core and stabilizing muscles.",
            "Engages abs and improves stamina.",
            "Strengthens glutes and lower back."
          ],
          exerciseaudiolist: [
            'audio/jumpingjacks.mp3',
            'audio/mountainclimb.mp3',
            'audio/pushups.mp3',
            'audio/squats.mp3',
            'audio/shoulderplank.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/pushups.gif',
            'assets/exercises/squats.gif',
            'assets/exercises/plank_shoulder_taps.gif',
          ],
          WeekNO: "2.1",
          workoutlist: [
            "Push-Ups",
            "BodyWeight-Squats",
            "Plank with Arm Lift",
            "Mountain Climbers",
            "Glute Bridges",
          ],
          instructions: [
            "1. Stand upright with feet together, hands by your sides.\n2. Jump, spreading your legs and raising your arms above your head.\n3. Return to the starting position and repeat.",
            "1. Stand with feet hip-width apart.\n2. Run in place by bringing your knees up towards your chest.",
            "1. Start in a high plank position.\n2. Tap your left shoulder with your right hand, then switch sides.",
            "1. Start in a high plank position.\n2. Bring one knee towards your chest, then switch legs in a running motion.",
            "1. Lie on your back with knees bent and feet flat on the ground.\n2. Push through your heels to lift your hips off the ground.\n3. Lower back down and repeat."
          ],
          focus_areas: [
            "Full body, cardio:\nImproves cardiovascular endurance and burns calories.",
            "Legs and core:\nStrengthens lower body muscles while enhancing stamina.",
            "Core, shoulders, and stability:\nEnhances coordination and builds shoulder strength.",
            "Core and legs:\nEngages the core and improves cardiovascular endurance.",
            "Glutes and hamstrings:\nTargets the posterior chain, improving hip strength."
          ],
          not_to_do: [
            "1. Avoid shallow jumps.\n2. Do not land too hard on your feet.",
            "1. Avoid leaning back.\n2. Keep your core engaged and move quickly.",
            "1. Do not let your hips sway.\n2. Keep your movements controlled.",
            "1. Do not bounce or go too fast.\n2. Avoid lifting your hips too high.",
            "1. Avoid pushing with your lower back.\n2. Keep your knees in line with your feet."
          ]),
      WeekDataModel(
          shortdesc: [
            "Increases heart rate and warms up the body.",
            "Works core and legs while burning calories.",
            "Enhances balance and core stability.",
            "Engages core and boosts cardiovascular fitness.",
            "Strengthens glutes, hips, and hamstrings."
          ],
          exerciseaudiolist: [
            'audio/jumpingjacks.mp3',
            'audio/mountainclimb.mp3',
            'audio/pushups.mp3',
            'audio/squats.mp3',
            'audio/shoulderplank.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/pushups.gif',
            'assets/exercises/squats.gif',
            'assets/exercises/plank_shoulder_taps.gif',
          ],
          WeekNO: "2,days-9,11",
          workoutlist: [
            "Jumping Jacks",
            "High Knees",
            "Plank Shoulder Taps",
            "Mountain Climbers",
            "Glute Bridges",
          ],
          instructions: [
            "1. Start in a push-up position with hands wider than shoulder-width.\n2. Lower your chest to the floor, keeping elbows at a 45-degree angle.\n3. Push back up to the starting position.",
            "1. Stand with feet shoulder-width apart.\n2. Lower into a squat, then explode upwards into a jump.\n3. Land softly and repeat.",
            "1. Lie on your side with feet stacked and elbow under your shoulder.\n2. Lift your hips off the ground, forming a straight line.\n3. Hold the position and switch sides.",
            "1. Start in a plank position.\n2. Bring your right knee towards your left elbow, then switch sides.",
            "1. Lie on your back, knees bent, and one foot lifted.\n2. Push through the grounded foot to lift your hips.\n3. Lower back down and switch legs."
          ],
          focus_areas: [
            "Chest, shoulders, and arms:\nEngages the upper body with a focus on the chest and triceps.",
            "Legs and glutes:\nStrengthens the lower body and improves explosive power.",
            "Obliques, core, and shoulders:\nTargets the side abdominal muscles and stabilizes the core.",
            "Core and full body coordination:\nImproves core activation and endurance.",
            "Glutes, hamstrings, and lower back:\nStrengthens the posterior chain for better stability."
          ],
          not_to_do: [
            "1. Avoid flaring your elbows too much.\n2. Keep your body in a straight line.",
            "1. Do not let your knees collapse inward.\n2. Land softly to prevent joint strain.",
            "1. Avoid letting your hips drop.\n2. Keep your body aligned.",
            "1. Do not rush the movement.\n2. Keep your core engaged throughout.",
            "1. Avoid pushing with your lower back.\n2. Ensure proper knee alignment."
          ]),
      WeekDataModel(
          shortdesc: [
            "Focuses on chest muscles for upper body strength.",
            "Builds leg power and improves agility.",
            "Strengthens obliques and improves core stability.",
            "Works core and improves endurance.",
            "Strengthens glutes and enhances balance."
          ],
          exerciseaudiolist: [
            'audio/jumpingjacks.mp3',
            'audio/mountainclimb.mp3',
            'audio/pushups.mp3',
            'audio/squats.mp3',
            'audio/shoulderplank.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/pushups.gif',
            'assets/exercises/squats.gif',
            'assets/exercises/plank_shoulder_taps.gif',
          ],
          WeekNO: "3,days-15,17,19",
          workoutlist: [
            "Wide-Arm Push-ups",
            "Jump Squats",
            "Side Plank",
            "Crossbody Mountain Climbers",
            "Single-Leg Glute Bridge",
          ],
          instructions: [
            "1. Run in place, lifting your knees as high as possible.\n2. Pump your arms to maintain momentum.",
            "1. Lie on your back with knees bent.\n2. Curl your upper body up, reaching for your knees.\n3. Lower back down with control.",
            "1. Lie on your back, legs extended.\n2. Lift one leg up while lowering the other, alternating in a flutter motion.",
            "1. Stand tall, lower into a squat, place hands on the ground, jump back into a plank, perform a push-up, jump forward, and explode upwards."
          ],
          focus_areas: [
            "Cardio and core:\nBoosts endurance while engaging core muscles.",
            "Core and abdominal strength:\nTargets upper abdominal muscles for better definition.",
            "Lower abs and hip flexors:\nStrengthens the core and improves control over leg movements.",
            "Full body, explosive power:\nEngages multiple muscle groups for strength and endurance."
          ],
          not_to_do: [
            "1. Avoid landing too hard on your feet.\n2. Keep your posture upright.",
            "1. Do not strain your neck.\n2. Engage your core fully instead of pulling on your head.",
            "1. Do not let your lower back lift off the floor.\n2. Maintain controlled leg movement.",
            "1. Avoid arching your back.\n2. Perform each movement with control."
          ]),
      WeekDataModel(
          shortdesc: [
            "Fast-paced movement to increase heart rate.",
            "Strengthens abs and improves core endurance.",
            "Targets lower abs and improves core strength.",
            "High-intensity exercise for full-body conditioning."
          ],
          exerciseaudiolist: [
            'audio/jumpingjacks.mp3',
            'audio/mountainclimb.mp3',
            'audio/pushups.mp3',
            'audio/squats.mp3',
            'audio/shoulderplank.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/pushups.gif',
            'assets/exercises/squats.gif',
            'assets/exercises/plank_shoulder_taps.gif',
          ],
          WeekNO: "3,days-16,18",
          workoutlist: [
            "High Knees",
            "Sit-Ups",
            "Flutter Kicks",
            "Burpees",
          ],
          instructions: [
            "1. Start in a push-up position with hands close together under your chest.\n2. Lower yourself while keeping your elbows close to your body.\n3. Push back up.",
            "1. Stand a few feet in front of a bench or chair.\n2. Place one foot behind you on the surface.\n3. Lower into a lunge, keeping your front knee aligned with your toes.",
            "1. Start in a plank position.\n2. Bring one knee towards your chest, then switch legs in a running motion.",
            "1. Lie on your back with feet hip-width apart.\n2. Lift your hips while alternating leg lifts."
          ],
          focus_areas: [
            "Chest, triceps, and shoulders:\nTargets the upper body with emphasis on the triceps.",
            "Legs and balance:\nEnhances single-leg strength and coordination.",
            "Core and cardio:\nImproves endurance while strengthening the core.",
            "Glutes and hamstrings:\nEngages posterior chain muscles for stability."
          ],
          not_to_do: [
            "1. Avoid letting your elbows flare out.\n2. Keep your body straight.",
            "1. Do not let your knee extend past your toes.\n2. Maintain control throughout the movement.",
            "1. Do not lift your hips too high.\n2. Keep the motion controlled.",
            "1. Avoid overarching your lower back.\n2. Keep your core engaged."
          ]),
      WeekDataModel(
          shortdesc: [
            "Strengthens triceps and chest.",
            "Works quads, glutes, and balance.",
            "Engages core and improves stamina.",
            "Strengthens glutes and core while enhancing stability."
          ],
          exerciseaudiolist: [
            'audio/jumpingjacks.mp3',
            'audio/mountainclimb.mp3',
            'audio/pushups.mp3',
            'audio/squats.mp3',
            'audio/shoulderplank.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/pushups.gif',
            'assets/exercises/squats.gif',
            'assets/exercises/plank_shoulder_taps.gif',
          ],
          WeekNO: "4,days-22,24,26",
          workoutlist: [
            "Diamond Push-Ups",
            "Bulgarian Split Squats",
            "Mountain Climbers",
            "Glute Bridge March",
          ],
          instructions: [
            "1. Start in a push-up position with hands close together under your chest.\n2. Lower yourself while keeping your elbows close to your body.\n3. Push back up.",
            "1. Stand a few feet in front of a bench or chair.\n2. Place one foot behind you on the surface.\n3. Lower into a lunge, keeping your front knee aligned with your toes.",
            "1. Start in a plank position.\n2. Bring one knee towards your chest, then switch legs in a running motion.",
            "1. Lie on your back with feet hip-width apart.\n2. Lift your hips while alternating leg lifts."
          ],
          focus_areas: [
            "Chest, triceps, and shoulders:\nTargets the upper body with emphasis on the triceps.",
            "Legs and balance:\nEnhances single-leg strength and coordination.",
            "Core and cardio:\nImproves endurance while strengthening the core.",
            "Glutes and hamstrings:\nEngages posterior chain muscles for stability."
          ],
          not_to_do: [
            "1. Avoid letting your elbows flare out.\n2. Keep your body straight.",
            "1. Do not let your knee extend past your toes.\n2. Maintain control throughout the movement.",
            "1. Do not lift your hips too high.\n2. Keep the motion controlled.",
            "1. Avoid overarching your lower back.\n2. Keep your core engaged."
          ]),
      WeekDataModel(
          shortdesc: [
            "Increases heart rate and warms up the body.",
            "Works core and legs while burning calories.",
            "Targets abs and hip flexors for core strength."
                "Full-body workout for endurance and explosive strength.",
          ],
          exerciseaudiolist: [
            'audio/jumpingjacks.mp3',
            'audio/mountainclimb.mp3',
            'audio/pushups.mp3',
            'audio/squats.mp3',
            'audio/shoulderplank.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/pushups.gif',
            'assets/exercises/squats.gif',
            'assets/exercises/plank_shoulder_taps.gif',
          ],
          WeekNO: "3,days-23,25",
          workoutlist: [
            "Jumping Jacks",
            "High Knees",
            "V-Ups",
            "Burpees",
          ],
          instructions: [
            "1. Stand upright with feet together, hands by your sides.\n2. Jump, spreading your legs and raising your arms above your head.\n3. Return to the starting position and repeat.",
            "1. Stand with feet hip-width apart.\n2. Run in place by bringing your knees up towards your chest.",
            "1. Lie on your back, arms extended overhead.\n2. Lift your legs and upper body simultaneously, reaching for your toes.\n3. Lower back down with control.",
            "1. Stand tall, lower into a squat, place hands on the ground, jump back into a plank, perform a push-up, jump forward, and explode upwards."
          ],
          focus_areas: [
            "Full body, cardio:\nBoosts endurance and burns calories.",
            "Legs and core:\nImproves coordination and leg endurance.",
            "Core and abdominal strength:\nEngages the entire core for stability and strength.",
            "Full body, explosive power:\nDevelops endurance and overall fitness."
          ],
          not_to_do: [
            "1. Avoid shallow jumps.\n2. Do not land too hard on your feet.",
            "1. Avoid leaning back.\n2. Keep your core engaged.",
            "1. Do not use momentum to lift yourself.\n2. Engage your core muscles.",
            "1. Avoid arching your back.\n2. Maintain a steady pace."
          ]),
    ],
    image: 'assets/images/fullbody.jpg',
    exercises: '7',
    calories: '650',
    duration: '05:30',
    exerciselist: [
      'Jumping Jacks',
      'Mountain Climbers',
      'Push-Ups',
      'Squats',
      'Plank with Shoulder Tap',
      'Burpees',
      'Lunges',
    ],
    exercisedetaillist: [
      'Jumping jacks are a great cardio warm-up exercise that increases heart rate and warms up the entire body. Start standing with your feet together and arms by your side. Jump while spreading your legs and raising your arms overhead, then return to the starting position. Repeat for 30 seconds to 1 minute.',
      'Mountain climbers are a dynamic core-strengthening exercise. Begin in a high plank position with your hands directly under your shoulders. Drive one knee towards your chest, then quickly switch legs. Keep your core tight and move at a steady pace for 20–30 seconds.',
      'Push-ups are a classic upper-body exercise that targets the chest, shoulders, triceps, and core. Start in a high plank position with your hands slightly wider than shoulder-width apart. Lower your body and push back up, maintaining proper form.',
      'Bodyweight squats strengthen the legs and glutes. Stand with feet shoulder-width apart, lower into a squat by bending your knees and pushing your hips back, then return to standing. Keep your chest lifted and back straight.',
      'The plank with shoulder tap engages the core, shoulders, and stability muscles. Start in a high plank position and alternate tapping each shoulder with the opposite hand while keeping your body stable and aligned.',
      'Burpees are a high-intensity, full-body exercise that combines squats, push-ups, and jumps. Perform a burpee sequence to increase heart rate and burn calories.',
      'Lunges work the legs, glutes, and core. Alternate stepping forward with each leg while maintaining proper alignment and control.',
    ],
    exercisegiflist: [
      'assets/exercises/jumping_jack.gif',
      'assets/exercises/mountain_climb.gif',
      'assets/exercises/pushups.gif',
      'assets/exercises/squats.gif',
      'assets/exercises/plank_shoulder_taps.gif',
      'assets/exercises/burpees.gif',
      'assets/exercises/lunges.gif',
    ],
    exerciseaudiolist: [
      'audio/jumpingjacks.mp3',
      'audio/mountainclimb.mp3',
      'audio/pushups.mp3',
      'audio/squats.mp3',
      'audio/shoulderplank.mp3',
      'audio/burpees.mp3', //
      'audio/lunges.mp3',
    ],
  ), //full body
  WorkoutModel(
    shortdescription: [
      "A high-intensity cardio move that boosts heart rate and burns fat.",
      "A simple warm-up exercise that increases upper body mobility.",
      "A full-body explosive movement that builds strength and endurance.",
      "A lateral movement that improves flexibility and leg strength.",
      "A classic cardio exercise that enhances agility and endurance.",
      "A dynamic core exercise that strengthens the abs and improves speed.",
      "A rotational movement that strengthens the core and arms.",
      "A lower body exercise that activates hamstrings and improves mobility."
    ],
    instructions: [
      "1. 30-40 seconds, 3 sets \n2. Stand tall and run in place, bringing your knees as high as possible.\n3. Pump your arms to maintain momentum.\n4. Keep your core engaged and land softly on your feet.",
      "1. 20 reps, 3 sets \n2. Stand with feet shoulder-width apart and extend both arms forward.\n3. Cross one arm over the other, then return to the starting position.\n4. Repeat while alternating arm positions.",
      "1. 12-15 reps, 3 sets \n2. Start in a standing position, then squat down and place your hands on the floor.\n3. Jump your feet back into a push-up position, perform a push-up, then jump your feet forward.\n4. Explode upwards into a jump, landing softly and repeating.",
      "1. 15-20 reps per side, 3 sets \n2. Stand with feet wider than shoulder-width.\n3. Shift your weight to one side, bending your knee while keeping the other leg straight.\n4. Push back to the center and switch sides.",
      "1. 30-40 seconds, 3 sets \n2. Stand with feet together and arms at your sides.\n3. Jump up while spreading your legs and raising your arms overhead.\n4. Jump back to the starting position and repeat.",
      "1. 30-40 seconds, 3 sets \n2. Start in a high plank position, hands under shoulders.\n3. Quickly drive one knee toward your chest, then switch legs in a running motion.\n4. Maintain a steady pace while keeping your core tight.",
      "1. 15-20 reps per side, 3 sets \n2. Stand with feet shoulder-width apart and fists up.\n3. Twist your torso and punch across your body.\n4. Return to center and repeat with the other arm.",
      "1. 20 reps per leg, 3 sets \n2. Stand with feet hip-width apart.\n3. Bring one heel toward your glutes, then lower it back.\n4. Repeat with the other leg in a controlled motion."
    ],
    focus_areas: [
      "Cardio, endurance:\nImproves cardiovascular fitness and burns calories.",
      "Shoulders, chest, arms:\nWarms up the upper body and enhances flexibility.",
      "Full body, strength, cardio:\nEngages multiple muscle groups and boosts endurance.",
      "Lower body, flexibility:\nImproves hip mobility and leg strength.",
      "Cardio, agility:\nEnhances coordination and cardiovascular endurance.",
      "Core, shoulders, legs:\nStrengthens core and increases agility.",
      "Core, arms, obliques:\nImproves rotational power and strengthens the core.",
      "Hamstrings, glutes:\nStrengthens hamstrings and improves leg flexibility."
    ],
    not_to_do: [
      "1. Avoid landing too hard on your feet.\n2. Do not lean backward; keep your posture upright.",
      "1. Do not rush the movement; keep it controlled.\n2. Avoid shrugging your shoulders.",
      "1. Do not skip the push-up or jump.\n2. Avoid arching your lower back during the movement.",
      "1. Keep your chest up and avoid rounding your back.\n2. Do not let your knees extend too far over your toes.",
      "1. Do not let your arms drop too low.\n2. Avoid locking your knees while jumping.",
      "1. Avoid bouncing your hips too much.\n2. Do not let your hands move out of position.",
      "1. Do not overextend your punches.\n2. Keep your core engaged for better balance.",
      "1. Avoid using momentum; focus on controlled movement.\n2. Do not let your knees move outward too much."
    ],
    workoutname: 'Cardio Blast',
    image: 'assets/images/arms_side_cut.jpg',
    exercises: '8',
    calories: '700',
    duration: '07:00',
    exerciselist: [
      'High Knees',
      'Arms Crossover',
      'Burpees',
      'Slopes',
      'Jumping Jack',
      'Mountain Climbers',
      'Punch Twist',
      'Hamstring Curls',
    ],
    exercisedetaillist: [
      'High knees are a cardio-intensive exercise that improves agility and heart rate. Run in place while lifting your knees as high as possible.',
      'Arms crossover stretches shoulders and improves flexibility. Stand straight, swing arms outward, then cross them in front of your chest. Alternate arm positions with each repetition and maintain a steady rhythm.', // 'Butt kicks strengthen the hamstrings and boost heart rate. Run in place while kicking your heels towards your glutes.',
      'Burpees are a high-intensity full-body exercise for building strength and endurance. Perform a sequence of squats, push-ups, and jumps.',
      'Slopes strengthen obliques and improve core flexibility. Stand straight, bend sideways at the waist, reaching one hand toward your ankle while the other stays at your side. Return upright and alternate sides.', // 'Jump squats combine the strength benefits of squats with explosive power. Perform a squat, then jump upwards, landing softly to avoid strain.',
      'Jumping jacks are a great cardio warm-up exercise that increases heart rate and warms up the entire body. Start standing with your feet together and arms by your side. Jump while spreading your legs and raising your arms overhead, then return to the starting position. Repeat for 30 seconds to 1 minute.',
      'Mountain climbers are a core-strengthening exercise performed in a high plank position with alternating knee drives.',
      'Punch twist targets the core and engages the upper body. Stand with feet hip-width apart, punch forward with one arm while twisting your torso in the opposite direction.', // 'Plank jacks combine core stability with cardio. Begin in a plank position and jump your feet apart and back together.',
      'Hamstring curls target the hamstrings. Lie on your stomach, bend your knees, and bring your heels toward your glutes. Slowly lower back down and repeat', // 'Jumping lunges are a plyometric variation of lunges. Jump and switch legs mid-air to alternate lunges.',
    ],
    exercisegiflist: [
      'assets/exercises/high_knee.gif',
      'assets/exercises/arms_crossover.gif',
      'assets/exercises/burpees.gif',
      'assets/exercises/slopes.gif',
      'assets/exercises/jumping_jack.gif',
      'assets/exercises/mountain_climb.gif',
      'assets/exercises/punch_twist.gif',
      'assets/exercises/hamstring_curls.gif',
    ],
    exerciseaudiolist: [
      'audio/highknees.mp3',
      'audio/armscrossover.mp3',
      'audio/burpees.mp3', //
      'audio/slopes.mp3',
      'audio/jumpingjacks.mp3',
      'audio/mountainclimb.mp3',
      'audio/punchtwist.mp3',
      'audio/hamstringcurls.mp3',
    ],
  ),
  WorkoutModel(
      shortdescription: [
        "The barbell bench press is a compound exercise that targets the chest, shoulders, and triceps.",
        "The incline dumbbell press targets the upper chest, shoulders, and triceps",
        "Push-ups are a classic upper-body exercise that targets the chest, shoulders, triceps, and core.",
        "Chest-focused dips primarily target the chest and triceps.",
        "Incline push-ups are a great variation that targets the lower chest and shoulders"
      ],
      instructions: [
        " 1. Lie on your back, arms at your sides\n2. Lift your legs, bending your knees to 90°.\n3. Use your core to lift your hips off the ground, bringing your knees toward your chest.\n4.Slowly lower back to the starting position.",
        "1. Lie on your back with legs straight and hands under your hips.\n2. Lift your legs off the ground to a 90° angle.\n3. Slowly lower them back without touching the floor.",
        "1. Start in a push-up position, with hands under shoulders and body in a straight line.\n2. Engage your core, keep your hips level, and hold. ",
        "1.Lie on your side, stack your feet, and place your elbow under your shoulder.\n2.Lift your hips off the ground, forming a straight line from head to feet.\n3. Hold and switch sides. ",
        "1. Start in a high plank position, hands slightly wider than shoulders.\n2. Lower your chest to the ground, keeping your body straight.\n3. Push back up to the starting position.",
      ],
      focus_areas: [
        "lower abs:\nTargets the lower abdominal muscles, helping to tone and strengthen the core.",
        "Lower abs and hip flexors:\nEngages the lower abs and hip flexors, improving core stability and strength",
        "Core,shoulders and arms:\nActivates the core, shoulders, and arms, building overall stability and endurance.",
        " Obliques, core, and shoulders:\nStrengthens the obliques and improves core stability while engaging the shoulders.",
        "Chest,shoulders, tricep and core:\nWorks the chest, shoulders, triceps, and core, improving upper body strength.",
      ],
      not_to_do: [
        "1.Avoid using momentum to lift your hips\n2. Do not arch your lower back; keep it pressed against the mat. ",
        "1.Avoid lifting your head or shoulders.\n2. Do not let your lower back arch off the mat. ",
        "1. Avoid letting your hips drop.\n2. Do not lean forward or backward; keep alignment. ",
        "1. Avoid letting your hips drop\n2. Do not lean forward or backward; keep alignment",
        "1.Avoid arching your back or flaring your elbows.\n2. Do not let your hips sag or rise too high.",
      ],
      weekwise: [
        WeekDataModel(
          exerciseaudiolist: [
            'audio/highknees.mp3',
            'audio/armscrossover.mp3',
            'audio/burpees.mp3', //
            'audio/slopes.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/high_knee.gif',
            'assets/exercises/arms_crossover.gif',
            'assets/exercises/burpees.gif',
            'assets/exercises/slopes.gif',
          ],
          WeekNO: "1 Strength",
          workoutlist: [
            "BodyWeight Squats",
            "Glute Bridges",
            "Plank",
            'Wide-arm Push-Ups',
          ],
          shortdesc: [
            "A high-intensity cardio move that boosts heart rate and burns fat.",
            "A simple warm-up exercise that increases upper body mobility.",
            "A full-body explosive movement that builds strength and endurance.",
            "A lateral movement that improves flexibility and leg strength.",
          ],
          instructions: [
            "1. 30-40 seconds, 3 sets \n2. Stand tall and run in place, bringing your knees as high as possible.\n3. Pump your arms to maintain momentum.\n4. Keep your core engaged and land softly on your feet.",
            "1. 20 reps, 3 sets \n2. Stand with feet shoulder-width apart and extend both arms forward.\n3. Cross one arm over the other, then return to the starting position.\n4. Repeat while alternating arm positions.",
            "1. 12-15 reps, 3 sets \n2. Start in a standing position, then squat down and place your hands on the floor.\n3. Jump your feet back into a push-up position, perform a push-up, then jump your feet forward.\n4. Explode upwards into a jump, landing softly and repeating.",
            "1. 15-20 reps per side, 3 sets \n2. Stand with feet wider than shoulder-width.\n3. Shift your weight to one side, bending your knee while keeping the other leg straight.\n4. Push back to the center and switch sides.",
          ],
          focus_areas: [
            "Cardio, endurance:\nImproves cardiovascular fitness and burns calories.",
            "Shoulders, chest, arms:\nWarms up the upper body and enhances flexibility.",
            "Full body, strength, cardio:\nEngages multiple muscle groups and boosts endurance.",
            "Lower body, flexibility:\nImproves hip mobility and leg strength.",
          ],
          not_to_do: [
            "1. Avoid landing too hard on your feet.\n2. Do not lean backward; keep your posture upright.",
            "1. Do not rush the movement; keep it controlled.\n2. Avoid shrugging your shoulders.",
            "1. Do not skip the push-up or jump.\n2. Avoid arching your lower back during the movement.",
            "1. Keep your chest up and avoid rounding your back.\n2. Do not let your knees extend too far over your toes.",
          ],
        ),
        WeekDataModel(
          exerciseaudiolist: [
            'audio/highknees.mp3',
            'audio/armscrossover.mp3',
            'audio/burpees.mp3', //
            'audio/slopes.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/high_knee.gif',
            'assets/exercises/arms_crossover.gif',
            'assets/exercises/burpees.gif',
            'assets/exercises/slopes.gif',
          ],
          WeekNO: "2 cardio and core",
          workoutlist: [
            "Mountain Climbers",
            "Jumping Jacks",
            "Plank Shoulder",
            "Bicycle Crunches",
          ],
          shortdesc: [
            "A high-intensity cardio move that boosts heart rate and burns fat.",
            "A simple warm-up exercise that increases upper body mobility.",
            "A full-body explosive movement that builds strength and endurance.",
            "A lateral movement that improves flexibility and leg strength.",
          ],
          instructions: [
            "1. 30-40 seconds, 3 sets \n2. Stand tall and run in place, bringing your knees as high as possible.\n3. Pump your arms to maintain momentum.\n4. Keep your core engaged and land softly on your feet.",
            "1. 20 reps, 3 sets \n2. Stand with feet shoulder-width apart and extend both arms forward.\n3. Cross one arm over the other, then return to the starting position.\n4. Repeat while alternating arm positions.",
            "1. 12-15 reps, 3 sets \n2. Start in a standing position, then squat down and place your hands on the floor.\n3. Jump your feet back into a push-up position, perform a push-up, then jump your feet forward.\n4. Explode upwards into a jump, landing softly and repeating.",
            "1. 15-20 reps per side, 3 sets \n2. Stand with feet wider than shoulder-width.\n3. Shift your weight to one side, bending your knee while keeping the other leg straight.\n4. Push back to the center and switch sides.",
          ],
          focus_areas: [
            "Cardio, endurance:\nImproves cardiovascular fitness and burns calories.",
            "Shoulders, chest, arms:\nWarms up the upper body and enhances flexibility.",
            "Full body, strength, cardio:\nEngages multiple muscle groups and boosts endurance.",
            "Lower body, flexibility:\nImproves hip mobility and leg strength.",
          ],
          not_to_do: [
            "1. Avoid landing too hard on your feet.\n2. Do not lean backward; keep your posture upright.",
            "1. Do not rush the movement; keep it controlled.\n2. Avoid shrugging your shoulders.",
            "1. Do not skip the push-up or jump.\n2. Avoid arching your lower back during the movement.",
            "1. Keep your chest up and avoid rounding your back.\n2. Do not let your knees extend too far over your toes.",
          ],
        ),
        WeekDataModel(
          exerciseaudiolist: [
            'audio/highknees.mp3',
            'audio/armscrossover.mp3',
            'audio/burpees.mp3', //
            'audio/slopes.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/high_knee.gif',
            'assets/exercises/arms_crossover.gif',
            'assets/exercises/burpees.gif',
            'assets/exercises/slopes.gif',
          ],
          WeekNO: "2 Strength",
          workoutlist: [
            "Jump Squats",
            "Side Plank",
            "Single-Leg Glute Bridge",
            "Push-Ups",
          ],
          shortdesc: [
            "A high-intensity cardio move that boosts heart rate and burns fat.",
            "A simple warm-up exercise that increases upper body mobility.",
            "A full-body explosive movement that builds strength and endurance.",
            "A lateral movement that improves flexibility and leg strength.",
          ],
          instructions: [
            "1. 30-40 seconds, 3 sets \n2. Stand tall and run in place, bringing your knees as high as possible.\n3. Pump your arms to maintain momentum.\n4. Keep your core engaged and land softly on your feet.",
            "1. 20 reps, 3 sets \n2. Stand with feet shoulder-width apart and extend both arms forward.\n3. Cross one arm over the other, then return to the starting position.\n4. Repeat while alternating arm positions.",
            "1. 12-15 reps, 3 sets \n2. Start in a standing position, then squat down and place your hands on the floor.\n3. Jump your feet back into a push-up position, perform a push-up, then jump your feet forward.\n4. Explode upwards into a jump, landing softly and repeating.",
            "1. 15-20 reps per side, 3 sets \n2. Stand with feet wider than shoulder-width.\n3. Shift your weight to one side, bending your knee while keeping the other leg straight.\n4. Push back to the center and switch sides.",
          ],
          focus_areas: [
            "Cardio, endurance:\nImproves cardiovascular fitness and burns calories.",
            "Shoulders, chest, arms:\nWarms up the upper body and enhances flexibility.",
            "Full body, strength, cardio:\nEngages multiple muscle groups and boosts endurance.",
            "Lower body, flexibility:\nImproves hip mobility and leg strength.",
          ],
          not_to_do: [
            "1. Avoid landing too hard on your feet.\n2. Do not lean backward; keep your posture upright.",
            "1. Do not rush the movement; keep it controlled.\n2. Avoid shrugging your shoulders.",
            "1. Do not skip the push-up or jump.\n2. Avoid arching your lower back during the movement.",
            "1. Keep your chest up and avoid rounding your back.\n2. Do not let your knees extend too far over your toes.",
          ],
        ),
        WeekDataModel(
          exerciseaudiolist: [
            'audio/highknees.mp3',
            'audio/armscrossover.mp3',
            'audio/burpees.mp3', //
            'audio/slopes.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/high_knee.gif',
            'assets/exercises/arms_crossover.gif',
            'assets/exercises/burpees.gif',
            'assets/exercises/slopes.gif',
          ],
          WeekNO: "2 Cardio & Core",
          workoutlist: [
            "High Knees",
            "Russian Twists",
            'Sit-Ups',
            "Plank jacks",
          ],
          shortdesc: [
            "A high-intensity cardio move that boosts heart rate and burns fat.",
            "A simple warm-up exercise that increases upper body mobility.",
            "A full-body explosive movement that builds strength and endurance.",
            "A lateral movement that improves flexibility and leg strength.",
          ],
          instructions: [
            "1. 30-40 seconds, 3 sets \n2. Stand tall and run in place, bringing your knees as high as possible.\n3. Pump your arms to maintain momentum.\n4. Keep your core engaged and land softly on your feet.",
            "1. 20 reps, 3 sets \n2. Stand with feet shoulder-width apart and extend both arms forward.\n3. Cross one arm over the other, then return to the starting position.\n4. Repeat while alternating arm positions.",
            "1. 12-15 reps, 3 sets \n2. Start in a standing position, then squat down and place your hands on the floor.\n3. Jump your feet back into a push-up position, perform a push-up, then jump your feet forward.\n4. Explode upwards into a jump, landing softly and repeating.",
            "1. 15-20 reps per side, 3 sets \n2. Stand with feet wider than shoulder-width.\n3. Shift your weight to one side, bending your knee while keeping the other leg straight.\n4. Push back to the center and switch sides.",
          ],
          focus_areas: [
            "Cardio, endurance:\nImproves cardiovascular fitness and burns calories.",
            "Shoulders, chest, arms:\nWarms up the upper body and enhances flexibility.",
            "Full body, strength, cardio:\nEngages multiple muscle groups and boosts endurance.",
            "Lower body, flexibility:\nImproves hip mobility and leg strength.",
          ],
          not_to_do: [
            "1. Avoid landing too hard on your feet.\n2. Do not lean backward; keep your posture upright.",
            "1. Do not rush the movement; keep it controlled.\n2. Avoid shrugging your shoulders.",
            "1. Do not skip the push-up or jump.\n2. Avoid arching your lower back during the movement.",
            "1. Keep your chest up and avoid rounding your back.\n2. Do not let your knees extend too far over your toes.",
          ],
        ),
        WeekDataModel(
          exerciseaudiolist: [
            'audio/highknees.mp3',
            'audio/armscrossover.mp3',
            'audio/burpees.mp3', //
            'audio/slopes.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/high_knee.gif',
            'assets/exercises/arms_crossover.gif',
            'assets/exercises/burpees.gif',
            'assets/exercises/slopes.gif',
          ],
          WeekNO: "2 Cardio & Core",
          workoutlist: [
            "Bulgarian Split Squats",
            "Side Plank",
            "Glute Bridge March",
            "Diamond Push-Ups"
          ],
          shortdesc: [
            "A high-intensity cardio move that boosts heart rate and burns fat.",
            "A simple warm-up exercise that increases upper body mobility.",
            "A full-body explosive movement that builds strength and endurance.",
            "A lateral movement that improves flexibility and leg strength.",
          ],
          instructions: [
            "1. 30-40 seconds, 3 sets \n2. Stand tall and run in place, bringing your knees as high as possible.\n3. Pump your arms to maintain momentum.\n4. Keep your core engaged and land softly on your feet.",
            "1. 20 reps, 3 sets \n2. Stand with feet shoulder-width apart and extend both arms forward.\n3. Cross one arm over the other, then return to the starting position.\n4. Repeat while alternating arm positions.",
            "1. 12-15 reps, 3 sets \n2. Start in a standing position, then squat down and place your hands on the floor.\n3. Jump your feet back into a push-up position, perform a push-up, then jump your feet forward.\n4. Explode upwards into a jump, landing softly and repeating.",
            "1. 15-20 reps per side, 3 sets \n2. Stand with feet wider than shoulder-width.\n3. Shift your weight to one side, bending your knee while keeping the other leg straight.\n4. Push back to the center and switch sides.",
          ],
          focus_areas: [
            "Cardio, endurance:\nImproves cardiovascular fitness and burns calories.",
            "Shoulders, chest, arms:\nWarms up the upper body and enhances flexibility.",
            "Full body, strength, cardio:\nEngages multiple muscle groups and boosts endurance.",
            "Lower body, flexibility:\nImproves hip mobility and leg strength.",
          ],
          not_to_do: [
            "1. Avoid landing too hard on your feet.\n2. Do not lean backward; keep your posture upright.",
            "1. Do not rush the movement; keep it controlled.\n2. Avoid shrugging your shoulders.",
            "1. Do not skip the push-up or jump.\n2. Avoid arching your lower back during the movement.",
            "1. Keep your chest up and avoid rounding your back.\n2. Do not let your knees extend too far over your toes.",
          ],
        )
      ],
      workoutname: "Upper Body",
      image: "",
      exercises: "5",
      calories: "500",
      duration: "3:0",
      exerciselist: [
        "Push Ups",
        "Bench Press",
        "Shoulder Press",
        "Biceps Curls",
        "Tricep Dips",
      ],
      exercisedetaillist: [
        "A bodyweight exercise that strengthens the chest, shoulders, triceps, and core. Modify intensity with knee push-ups or elevated push-ups.",
        "Focuses on chest, shoulders, and triceps. Use a barbell or dumbbells to push weights while lying on a bench for strength gains.",
        "Targets the deltoid muscles and triceps. Press dumbbells or barbells overhead to build shoulder strength and improve stability.",
        "An isolation exercise that works the biceps. Perform with dumbbells, resistance bands, or barbells for arm muscle toning and strength.",
        "A compound movement focusing on the triceps and shoulders. Use parallel bars, a chair, or a bench for support."
      ],
      exercisegiflist: [
        'assets/exercises/high_knee.gif',
        'assets/exercises/arms_crossover.gif',
        'assets/exercises/burpees.gif',
        'assets/exercises/slopes.gif',
        'assets/exercises/jumping_jack.gif',
      ],
      exerciseaudiolist: []), //upperbody
  WorkoutModel(
      shortdescription: [
        "The barbell bench press is a compound exercise that targets the chest, shoulders, and triceps.",
        "The incline dumbbell press targets the upper chest, shoulders, and triceps",
        "Push-ups are a classic upper-body exercise that targets the chest, shoulders, triceps, and core.",
        "Chest-focused dips primarily target the chest and triceps.",
        "Incline push-ups are a great variation that targets the lower chest and shoulders"
      ],
      instructions: [
        " 1. Lie on your back, arms at your sides\n2. Lift your legs, bending your knees to 90°.\n3. Use your core to lift your hips off the ground, bringing your knees toward your chest.\n4.Slowly lower back to the starting position.",
        "1. Lie on your back with legs straight and hands under your hips.\n2. Lift your legs off the ground to a 90° angle.\n3. Slowly lower them back without touching the floor.",
        "1. Start in a push-up position, with hands under shoulders and body in a straight line.\n2. Engage your core, keep your hips level, and hold. ",
        "1.Lie on your side, stack your feet, and place your elbow under your shoulder.\n2.Lift your hips off the ground, forming a straight line from head to feet.\n3. Hold and switch sides. ",
        "1. Start in a high plank position, hands slightly wider than shoulders.\n2. Lower your chest to the ground, keeping your body straight.\n3. Push back up to the starting position.",
      ],
      focus_areas: [
        "lower abs:\nTargets the lower abdominal muscles, helping to tone and strengthen the core.",
        "Lower abs and hip flexors:\nEngages the lower abs and hip flexors, improving core stability and strength",
        "Core,shoulders and arms:\nActivates the core, shoulders, and arms, building overall stability and endurance.",
        " Obliques, core, and shoulders:\nStrengthens the obliques and improves core stability while engaging the shoulders.",
        "Chest,shoulders, tricep and core:\nWorks the chest, shoulders, triceps, and core, improving upper body strength.",
      ],
      not_to_do: [
        "1.Avoid using momentum to lift your hips\n2. Do not arch your lower back; keep it pressed against the mat. ",
        "1.Avoid lifting your head or shoulders.\n2. Do not let your lower back arch off the mat. ",
        "1. Avoid letting your hips drop.\n2. Do not lean forward or backward; keep alignment. ",
        "1. Avoid letting your hips drop\n2. Do not lean forward or backward; keep alignment",
        "1.Avoid arching your back or flaring your elbows.\n2. Do not let your hips sag or rise too high.",
      ],
      workoutname: "Lower body ",
      image: "",
      weekwise: [
        WeekDataModel(
          WeekNO: "Strength",
          exerciseaudiolist: [
            'audio/highknees.mp3',
            'audio/armscrossover.mp3',
            'audio/burpees.mp3', //
            'audio/slopes.mp3',
          ],
          exercisegiflist: [
            'assets/exercises/high_knee.gif',
            'assets/exercises/arms_crossover.gif',
            'assets/exercises/burpees.gif',
            'assets/exercises/slopes.gif',
          ],
          workoutlist: [
            "Bodyweight Squats",
            "Glute Bridges",
            "Plank",
            "Wide-Arm Push-Ups"
          ],
          instructions: [
            "Perform 3 sets of 12-15 reps of squats.",
            "Do 3 sets of 12-15 reps of glute bridges.",
            "Hold plank for 20-30 seconds, repeat 3 times.",
            "Do 3 sets of 8-12 reps of wide-arm push-ups."
          ],
          focus_areas: [
            "Legs",
            "Glutes",
            "Core",
            "Upper Body",
          ],
          not_to_do: [
            "Avoid locking knees",
            "Keep core engaged",
            "Avoid locking knees",
            "Keep core engaged"
          ],
          shortdesc: ["Squats", "Bridges", "Plank", "Push-Ups"],
        ),
        WeekDataModel(
          WeekNO: "Cardio & Core",
          exerciseaudiolist: [
            'audio/highknees.mp3',
            'audio/armscrossover.mp3',
            'audio/burpees.mp3', //
            'audio/slopes.mp3'
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/punch_twist.gif',
            'assets/exercises/hamstring_curls.gif',
          ],
          workoutlist: [
            "Mountain Climbers",
            "Jumping Jacks",
            "Plank Shoulder Taps",
            "Bicycle Crunches"
          ],
          instructions: [
            "Perform mountain climbers for 20 seconds, 3 sets.",
            "Jumping jacks for 30 seconds, 3 sets.",
            "Do 15 plank shoulder taps per side, 3 sets.",
            "Do 12-15 reps of bicycle crunches, 3 sets.",
          ],
          focus_areas: ["Cardio", "Core", "Legs"],
          not_to_do: [
            "Avoid bouncing knees",
            "Maintain stable core",
            "Avoid bouncing knees",
            "Maintain stable core"
          ],
          shortdesc: ["Climbers", "Jumping Jacks", "Plank Taps", "Crunches"],
        ),
        WeekDataModel(
          exerciseaudiolist: [
            'audio/highknees.mp3',
            'audio/armscrossover.mp3',
            'audio/burpees.mp3', //
            'audio/slopes.mp3'
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/punch_twist.gif',
            'assets/exercises/hamstring_curls.gif',
          ],
          WeekNO: " 1,Strength",
          workoutlist: [
            "Jump Squats",
            "Side Plank",
            "Single-Leg Glute Bridge",
            "Push-Ups",
          ],
          instructions: [
            "Perform mountain climbers for 20 seconds, 3 sets.",
            "Jumping jacks for 30 seconds, 3 sets.",
            "Do 15 plank shoulder taps per side, 3 sets.",
            "Do 12-15 reps of bicycle crunches, 3 sets.",
          ],
          focus_areas: ["Cardio", "Core", "Legs"],
          not_to_do: [
            "Avoid bouncing knees",
            "Maintain stable core",
            "Avoid bouncing knees",
            "Maintain stable core"
          ],
          shortdesc: ["Climbers", "Jumping Jacks", "Plank Taps", "Crunches"],
        ), // false data here
        WeekDataModel(
          exerciseaudiolist: [
            'audio/highknees.mp3',
            'audio/armscrossover.mp3',
            'audio/burpees.mp3', //
            'audio/slopes.mp3'
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/punch_twist.gif',
            'assets/exercises/hamstring_curls.gif',
          ],
          WeekNO: "1,Cardio and Core",
          workoutlist: [
            "High knees",
            "Russian Twists",
            "Sit-Ups",
            "Plank Jacks",
          ],
          instructions: [
            "Perform mountain climbers for 20 seconds, 3 sets.",
            "Jumping jacks for 30 seconds, 3 sets.",
            "Do 15 plank shoulder taps per side, 3 sets.",
            "Do 12-15 reps of bicycle crunches, 3 sets.",
          ],
          focus_areas: ["Cardio", "Core", "Legs"],
          not_to_do: [
            "Avoid bouncing knees",
            "Maintain stable core",
            "Avoid bouncing knees",
            "Maintain stable core"
          ],
          shortdesc: ["Climbers", "Jumping Jacks", "Plank Taps", "Crunches"],
        ),
        WeekDataModel(
          exerciseaudiolist: [
            'audio/highknees.mp3',
            'audio/armscrossover.mp3',
            'audio/burpees.mp3',
            'audio/slopes.mp3'
          ],
          exercisegiflist: [
            'assets/exercises/jumping_jack.gif',
            'assets/exercises/mountain_climb.gif',
            'assets/exercises/punch_twist.gif',
            'assets/exercises/hamstring_curls.gif',
          ],
          WeekNO: "1 Strength",
          workoutlist: [
            "Bulgarian Split Squats",
            "Side Plank",
            "Glute Bridge March",
            "Diamond Push-ups"
          ],
          instructions: [
            "Perform mountain climbers for 20 seconds, 3 sets.",
            "Jumping jacks for 30 seconds, 3 sets.",
            "Do 15 plank shoulder taps per side, 3 sets.",
            "Do 12-15 reps of bicycle crunches, 3 sets.",
          ],
          focus_areas: ["Cardio", "Core", "Legs"],
          not_to_do: [
            "Avoid bouncing knees",
            "Maintain stable core",
            "Avoid bouncing knees",
            "Maintain stable core"
          ],
          shortdesc: ["Climbers", "Jumping Jacks", "Plank Taps", "Crunches"],
        )
      ],
      exercises: "5",
      calories: "500",
      duration: "05:00",
      exerciselist: [
        "Squats",
        "Lunges",
        "Deadlifts",
        "Step-ups",
        "Calf-raises"
      ],
      exercisedetaillist: [
        "A compound movement that strengthens quads, glutes, and hamstrings. Perform bodyweight squats or add resistance with dumbbells or barbells.",
        "A unilateral exercise to target quads, hamstrings, and glutes. Enhance balance and strength with forward, reverse, or walking lunges.",
        "Builds hamstrings, glutes, and lower back. Perform with a barbell or dumbbells to develop power and posterior chain strength.",
        "Strengthen quads, glutes, and calves. Step onto a bench or elevated surface with added resistance for functional lower-body training.",
        "Focuses on calf muscle endurance and strength. Perform bodyweight or weighted versions for ankle stability and power."
      ],
      exercisegiflist: [
        'assets/exercises/jumping_jack.gif',
        'assets/exercises/mountain_climb.gif',
        'assets/exercises/punch_twist.gif',
        'assets/exercises/hamstring_curls.gif',
        'assets/exercises/hamstring_curls.gif',
      ],
      exerciseaudiolist: [""]), //lowebody
  WorkoutModel(
      workoutname: "Butt Workout",
      image: "",
      exercises: "7",
      calories: "500",
      duration: "10",
      exerciselist: [],
      exercisedetaillist: [],
      exercisegiflist: [],
      exerciseaudiolist: [],
      instructions: [],
      focus_areas: [],
      not_to_do: [],
      shortdescription: [])
];

class AllWorkoutModel {
  final String workoutname;
  final String calories;
  final String duration;

  final String exerciseimg;
  final List<String> exercises;
  final List<String> exerciseDetails;
  final List<String> exerciseImages; // Paths for exercise images or GIFs
  final List<String> exercisegifs;
  final List<String> exerciseaudios;
  final List<String> instructions;
  final List<String> focuss_area;
  final List<String> not_to_do;
  final List<String> short_description;

  AllWorkoutModel({
    required this.exerciseDetails,
    required this.exerciseImages,
    required this.exercisegifs,
    required this.exerciseaudios,
    required this.duration,
    required this.calories,
    required this.exercises,
    required this.instructions,
    required this.workoutname,
    required this.exerciseimg,
    required this.focuss_area,
    required this.not_to_do,
    required this.short_description,
  });
}

List<AllWorkoutModel> allworkoutlist = [
  AllWorkoutModel(
      workoutname: "Reverse Crunches",
      exerciseimg: 'assets/images/chest2.jpeg',
      duration: '00:05',
      calories: '30',
      exercises: [
        "Reverse Crunches"
      ],
      instructions: [
        " 1. Lie on your back, arms at your sides\n2. Lift your legs, bending your knees to 90°.\n3. Use your core to lift your hips off the ground, bringing your knees toward your chest.\n4.Slowly lower back to the starting position.",
      ],
      focuss_area: [
        "lower abs:\nTargets the lower abdominal muscles, helping to tone and strengthen the core.",
      ],
      not_to_do: [
        "1.Avoid using momentum to lift your hips\n2. Do not arch your lower back; keep it pressed against the mat. ",
      ],
      short_description: [
        "Reverse Crunches target the lower abdominal muscles, helping to strengthen and tone the core.  ",
      ],
      exerciseDetails: [
        "Reverse Crunches target the lower abdominal muscles, helping to strengthen and tone the core. To perform them, lie on your back with your knees bent and feet flat on the floor. Raise your legs towards your chest and lift your hips off the ground, then lower back down slowly. Benefits include improved core strength, reduced belly fat, and enhanced overall stability.",
      ],
      exerciseImages: [],
      exercisegifs: [
        "assets/exercises/reverse_crunch.gif"
      ],
      exerciseaudios: [
        "audio/reversecrunches.mp3"
      ]),
  AllWorkoutModel(
      exerciseDetails: [
        "A bodyweight exercise that targets the chest, shoulders, and triceps by lowering and raising the body in a plank position."
      ],
      exerciseImages: ["assets/exercises/pushups.gif"],
      exercisegifs: ["assets/exercises/pushups.gif"],
      exerciseaudios: ["assets/audio/pushups.mp3"],
      duration: "0.5",
      calories: "100",
      exercises: ["Push-Ups"],
      instructions: [
        "1.	Start in a plank position with hands placed slightly wider than shoulder-width apart. \n2.	Lower your body by bending your elbows, keeping your body in a straight line \n3. Push back up to the starting position"
      ],
      workoutname: "Push-Up ",
      exerciseimg: "assets/exercises/pushups.gif",
      focuss_area: [
        "1. 	Primary: Chest (pectorals), shoulders (deltoids), triceps. \n2. Secondary: Core (abs, obliques). "
      ],
      not_to_do: [
        "1. Letting the hips sag or lift too high. \n2. Flaring the elbows outward too much. \n3.	Not lowering the chest deep enough."
      ],
      short_description: [
        "A bodyweight exercise that targets the chest, shoulders, and triceps by lowering and raising the body in a plank position."
      ]),
  AllWorkoutModel(
    exerciseDetails: [
      "A bodyweight exercise that targets the chest, shoulders, and triceps by lowering and raising the body in a plank position."
    ],
    exerciseImages: ["assets/exercises/squats.gif"],
    exercisegifs: ["assets/exercises/squats.gif"],
    exerciseaudios: ["assets/audio/squats.mp3"],
    duration: "0.5",
    calories: "100",
    exercises: [" Bodyweight Squats"],
    instructions: [
      "1.	Stand with your feet shoulder-width apart. \n2. Lower your body by pushing your hips back and bending your knees, as if sitting in a chair. \n 3.	Keep your chest up and lower until your thighs are parallel to the ground."
    ],
    workoutname: "Bodyweight Squats",
    exerciseimg: "assets/exercises/squats.gif",
    focuss_area: [
      "1. Primary: Quadriceps, glutes, hamstrings. \n2. Secondary: Calves, core."
    ],
    not_to_do: [
      "1.	Knees caving in or extending beyond toes. \n2. Leaning forward with your torso. \n3.	Not squatting deep enough."
    ],
    short_description: [
      "A bodyweight exercise that targets the chest, shoulders, and triceps by lowering and raising the body in a plank position."
    ],
  ),
  AllWorkoutModel(
    exerciseDetails: [
      "A core exercise where you hold a push-up position, engaging the abs, shoulders, and glutes."
    ],
    exerciseImages: ["assets/exercises/side_plank.png"],
    exercisegifs: ["assets/exercises/side_plank.png"],
    exerciseaudios: ["assets/audio/sideplank.mp3"],
    duration: "1",
    calories: "200",
    exercises: ["Plank "],
    instructions: [
      "Start in a push-up position but with elbows bent and resting on the floor.\n2. 	Keep your body in a straight line from head to heels. \n3. 	Engage your core, glutes, and legs, holding this position for as long as you can."
    ],
    workoutname: "Plank",
    exerciseimg: "assets/exercises/side_plank.png",
    focuss_area: [
      "1. Primary: Core (abs, obliques), shoulders.\n2. Secondary:Glutes, lower back"
    ],
    not_to_do: [
      "1. Allowing the hips to sage or pike upward. \n2. Note engaging the core properly"
    ],
    short_description: [
      "A core exercise where you hold a push-up position, engaging the abs, shoulders, and glutes."
    ],
  ),
  AllWorkoutModel(
      exerciseDetails: ["Lying on your back, you lift your hips to activate the glutes and hamstrings while keeping your feet flat on the floor"],
      exerciseImages: [""],
      exercisegifs: ["assets/exercises/squats.gif"],
      exerciseaudios: ["assets/audio/sideplank.mp3"],
      duration: "1",
      calories: "120",
      exercises: ["Glute Bridges"],
      instructions: ["1. 	Lie on your back with knees bent and feet flat on the floor, hip-width apart. \n2.	Squeeze your glutes and lift your hips toward the ceiling. \n3. 	Hold for a moment and slowly lower back down."],
      workoutname: "Glute Bridge",
      exerciseimg: "assets/exercises/squats.gif",
      focuss_area: ['1.Primary : Glutes, hamstrings \n2. Secondary:Lower back'],
      not_to_do: ["1. Overarching of the lower back \n2. Letting the knees fall inward"],
      short_description: ["Lying on your back, you lift your hips to activate the glutes and hamstrings while keeping your feet flat on the floor"],
  ),
  AllWorkoutModel(
    exerciseDetails: ["A variation of push-ups with hands placed wider apart to emphasize the chest and shoulders."],
    exerciseImages: [""],
    exercisegifs: ["assets/exercises/wide_arm_pushups.gif"],
    exerciseaudios: ["assets/audio/wide_arm_pushups.mp3"],
    duration: "1",
    calories: "100",
    exercises: ["Wide-Arm Push-Ups"],
    instructions: ["1. Start in a regular push-up position, but place your hands wider than shoulder-width apart. \n2. Lower your body by bending your elbows at 45 degrees, then push back up."],
    workoutname: "Wide-Arm Push-Ups",
    exerciseimg: "assets/exercises/wide_arm_pushups.gif",
    focuss_area: ['1. Primary: Chest, shoulders (deltoids), triceps \n2. Secondary: Core'],
    not_to_do: ["1. Elbows flaring out too much \n2. Not engaging the core or allowing hips to sag"],
    short_description: ["A variation of push-ups with hands placed wider apart to emphasize the chest and shoulders."],
  ),

  AllWorkoutModel(
    exerciseDetails: ["A plyometric variation of squats, where you explode upwards after squatting to engage the legs and glutes."],
    exerciseImages: [""],
    exercisegifs: ["assets/exercises/jump_squats.gif"],
    exerciseaudios: ["assets/audio/jump_squats.mp3"],
    duration: "1",
    calories: "120",
    exercises: ["Jump Squats"],
    instructions: ["1. Perform a bodyweight squat, but when coming back up, explode into a jump. \n2. Land softly back into a squat position and repeat."],
    workoutname: "Jump Squats",
    exerciseimg: "assets/exercises/jump_squats.gif",
    focuss_area: ['1. Primary: Quadriceps, glutes, hamstrings \n2. Secondary: Calves, core'],
    not_to_do: ["1. Landing with knees caving inward \n2. Not controlling the landing, which can lead to injury"],
    short_description: ["A plyometric variation of squats, where you explode upwards after squatting to engage the legs and glutes."],
  ),

  AllWorkoutModel(
    exerciseDetails: ["A core exercise performed on one side to target the obliques and shoulders while maintaining a straight body."],
    exerciseImages: [""],
    exercisegifs: ["assets/exercises/side_plank.gif"],
    exerciseaudios: ["assets/audio/side_plank.mp3"],
    duration: "1",
    calories: "80",
    exercises: ["Side Plank"],
    instructions: ["1. Lie on your side with your elbow under your shoulder. \n2. Lift your hips to form a straight line from head to heels. \n3. Hold this position while keeping your core tight."],
    workoutname: "Side Plank",
    exerciseimg: "assets/exercises/side_plank.gif",
    focuss_area: ['1. Primary: Obliques, shoulders \n2. Secondary: Core'],
    not_to_do: ["1. Letting the hips sag or over-rotating \n2. Not aligning your body properly"],
    short_description: ["A core exercise performed on one side to target the obliques and shoulders while maintaining a straight body."],
  ),

  AllWorkoutModel(
    exerciseDetails: ["A cardio exercise involving a plank position where you alternate bringing your knees across your body toward the opposite elbows."],
    exerciseImages: [""],
    exercisegifs: ["assets/exercises/crossbody_mountain_climbers.gif"],
    exerciseaudios: ["assets/audio/crossbody_mountain_climbers.mp3"],
    duration: "1",
    calories: "110",
    exercises: ["Crossbody Mountain Climbers"],
    instructions: ["1. Start in a plank position. \n2. Bring your right knee towards your left elbow while keeping your core engaged. \n3. Alternate legs in a controlled, cross-body motion."],
    workoutname: "Crossbody Mountain Climbers",
    exerciseimg: "assets/exercises/crossbody_mountain_climbers.gif",
    focuss_area: ['1. Primary: Core, shoulders \n2. Secondary: Hip flexors, quads'],
    not_to_do: ["1. Letting the hips drop or rise \n2. Rushing through the movement with poor form"],
    short_description: ["A cardio exercise involving a plank position where you alternate bringing your knees across your body toward the opposite elbows."],
  ),
  AllWorkoutModel(
    exerciseDetails: ["Similar to the glute bridge but performed one leg at a time to further activate the glutes and hamstrings."],
    exerciseImages: [""],
    exercisegifs: ["assets/exercises/single_leg_glute_bridge.gif"],
    exerciseaudios: ["assets/audio/single_leg_glute_bridge.mp3"],
    duration: "1",
    calories: "120",
    exercises: ["Single-Leg Glute Bridge"],
    instructions: [
      "1. Lie on your back with one knee bent and the other leg extended.",
      "2. Push through the heel of the bent leg to raise your hips, then lower slowly.",
      "3. Switch legs after a set number of repetitions."
    ],
    workoutname: "Single-Leg Glute Bridge",
    exerciseimg: "assets/exercises/single_leg_glute_bridge.gif",
    focuss_area: ["1. Primary: Glutes, hamstrings", "2. Secondary: Core"],
    not_to_do: ["1. Letting the hips drop", "2. Arching the back instead of using the glutes"],
    short_description: ["Similar to the glute bridge but performed one leg at a time to further activate the glutes and hamstrings."],
  ),

  AllWorkoutModel(
    exerciseDetails: ["A variation of push-ups with hands close together to target the triceps and inner chest."],
    exerciseImages: [""],
    exercisegifs: ["assets/exercises/diamond_pushups.gif"],
    exerciseaudios: ["assets/audio/diamond_pushups.mp3"],
    duration: "1",
    calories: "150",
    exercises: ["Diamond Push-Ups"],
    instructions: [
      "1. Place your hands close together under your chest, forming a diamond shape with your fingers.",
      "2. Lower your body and push back up."
    ],
    workoutname: "Diamond Push-Ups",
    exerciseimg: "assets/exercises/diamond_pushups.gif",
    focuss_area: ["1. Primary: Triceps, chest", "2. Secondary: Shoulders"],
    not_to_do: ["1. Elbows flaring out to the sides", "2. Not lowering deep enough or using momentum"],
    short_description: ["A variation of push-ups with hands close together to target the triceps and inner chest."],
  ),

  AllWorkoutModel(
    exerciseDetails: ["A single-leg squat where one foot is elevated behind you, focusing on quads, glutes, and hamstrings."],
    exerciseImages: [""],
    exercisegifs: ["assets/exercises/bulgarian_split_squats.gif"],
    exerciseaudios: ["assets/audio/bulgarian_split_squats.mp3"],
    duration: "1",
    calories: "180",
    exercises: ["Bulgarian Split Squats"],
    instructions: [
      "1. Place one foot on a chair or elevated surface behind you.",
      "2. Lower your hips into a lunge while keeping the front knee aligned with your toes.",
      "3. Return to standing, and repeat for both legs."
    ],
    workoutname: "Bulgarian Split Squats",
    exerciseimg: "assets/exercises/bulgarian_split_squats.gif",
    focuss_area: ["1. Primary: Quadriceps, glutes", "2. Secondary: Hamstrings"],
    not_to_do: ["1. Letting the knee go past the toes", "2. Not going low enough into the lunge"],
    short_description: ["A single-leg squat where one foot is elevated behind you, focusing on quads, glutes, and hamstrings."],
  ),

  AllWorkoutModel(
    exerciseDetails: ["A side plank variation where you lift your hips up and down to target the obliques and glutes."],
    exerciseImages: [""],
    exercisegifs: ["assets/exercises/side_plank_hip_lift.gif"],
    exerciseaudios: ["assets/audio/side_plank_hip_lift.mp3"],
    duration: "1",
    calories: "130",
    exercises: ["Side Plank with Hip Lift"],
    instructions: [
      "1. From a side plank position, lower your hips to the floor, then lift them back up.",
      "2. Repeat for both sides."
    ],
    workoutname: "Side Plank with Hip Lift",
    exerciseimg: "assets/exercises/side_plank_hip_lift.gif",
    focuss_area: ["1. Primary: Obliques, glutes", "2. Secondary: Core"],
    not_to_do: ["1. Not lifting the hips high enough", "2. Allowing the hips to sag"],
    short_description: ["A side plank variation where you lift your hips up and down to target the obliques and glutes."],
  ),

  AllWorkoutModel(
    exerciseDetails: ["A glute bridge variation where you alternate lifting one leg at a time while keeping your hips elevated."],
    exerciseImages: [""],
    exercisegifs: ["assets/exercises/glute_bridge_march.gif"],
    exerciseaudios: ["assets/audio/glute_bridge_march.mp3"],
    duration: "1",
    calories: "140",
    exercises: ["Glute Bridge March"],
    instructions: [
      "1. Perform a glute bridge, but alternate lifting one leg at a time while keeping your hips level."
    ],
    workoutname: "Glute Bridge March",
    exerciseimg: "assets/exercises/glute_bridge_march.gif",
    focuss_area: ["1. Primary: Glutes, hamstrings", "2. Secondary: Core"],
    not_to_do: ["1. Letting the hips drop when lifting a leg", "2. Arching the back instead of using the glutes"],
    short_description: ["A glute bridge variation where you alternate lifting one leg at a time while keeping your hips elevated."],
  ),
  AllWorkoutModel(
      exerciseDetails: ["A high-intensity exercise where you alternate bringing your knees to your chest from a plank position, targeting the core and shoulders."],
      exerciseImages: [""],
      exercisegifs: ["assets/exercises/mountain_climbers.gif"],
      exerciseaudios: ["assets/audio/mountain_climbers.mp3"],
      duration: "1",
      calories: "100",
      exercises: ["Mountain Climbers"],
      instructions: ["1. Start in a plank position.", "2. Alternate driving your knees towards your chest at a quick pace."],
      workoutname: "Mountain Climbers",
      exerciseimg: "assets/exercises/mountain_climbers.gif",
      focuss_area: ["Primary: Core, shoulders", "Secondary: Quads, hip flexors"],
      not_to_do: ["Letting the hips drop", "Rushing through the exercise without engaging the core"],
      short_description: ["A high-intensity exercise where you alternate bringing your knees to your chest from a plank position, targeting the core and shoulders."]
  ),

  AllWorkoutModel(
      exerciseDetails: ["A full-body cardio exercise involving jumping with legs and arms moving out and in."],
      exerciseImages: [""],
      exercisegifs: ["assets/exercises/jumping_jacks.gif"],
      exerciseaudios: ["assets/audio/jumping_jacks.mp3"],
      duration: "1",
      calories: "90",
      exercises: ["Jumping Jacks"],
      instructions: ["1. Stand tall, then jump to spread your legs while raising your arms overhead.", "2. Return to the starting position and repeat."],
      workoutname: "Jumping Jacks",
      exerciseimg: "assets/exercises/jumping_jacks.gif",
      focuss_area: ["Primary: Full body (cardio), shoulders, legs", "Secondary: Core"],
      not_to_do: ["Slouching or leaning forward", "Not fully extending arms or legs"],
      short_description: ["A full-body cardio exercise involving jumping with legs and arms moving out and in."]
  ),

  AllWorkoutModel(
      exerciseDetails: ["Jog in place while lifting your knees as high as possible to engage the core and hip flexors."],
      exerciseImages: [""],
      exercisegifs: ["assets/exercises/high_knees.gif"],
      exerciseaudios: ["assets/audio/high_knees.mp3"],
      duration: "1",
      calories: "110",
      exercises: ["High Knees"],
      instructions: ["1. Jog in place while raising your knees as high as possible towards your chest."],
      workoutname: "High Knees",
      exerciseimg: "assets/exercises/high_knees.gif",
      focuss_area: ["Primary: Core, hip flexors, quads", "Secondary: Shoulders, calves"],
      not_to_do: ["Slouching or leaning forward", "Not engaging the core to help lift the knees"],
      short_description: ["Jog in place while lifting your knees as high as possible to engage the core and hip flexors."]
  ),

  AllWorkoutModel(
      exerciseDetails: ["A plank exercise where you alternate tapping your shoulders with the opposite hand, engaging the core and shoulders."],
      exerciseImages: [""],
      exercisegifs: ["assets/exercises/plank_shoulder_taps.gif"],
      exerciseaudios: ["assets/audio/plank_shoulder_taps.mp3"],
      duration: "1",
      calories: "80",
      exercises: ["Plank Shoulder Taps"],
      instructions: ["1. Start in a plank position.", "2. Tap your left shoulder with your right hand, then tap your right shoulder with your left hand, alternating taps."],
      workoutname: "Plank Shoulder Taps",
      exerciseimg: "assets/exercises/plank_shoulder_taps.gif",
      focuss_area: ["Primary: Core, shoulders", "Secondary: Chest, triceps"],
      not_to_do: ["Hips twisting or rocking", "Letting the body sag"],
      short_description: ["A plank exercise where you alternate tapping your shoulders with the opposite hand, engaging the core and shoulders."]
  )


];
