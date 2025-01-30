class WorkoutModel {
  final String workoutname;
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
  WorkoutModel({
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

List<WorkoutModel> workoutlist = [
  WorkoutModel(
    shortdescription: [
      "Reverse crunches effectively target the lower abdominal muscles and improve core strength.",
      "Leg raises are a simple and effective exercise to strengthen your lower abdominal muscles.",
      "The high plank is a foundational core-strengthening exercise that also engages your shoulders",
      "The side plank is an excellent exercise to strengthen your obliques, core, and stabilizing muscles.",
      "Push-ups are a classic upper-body exercise that targets the chest, shoulders, triceps, and core."
    ],
    workoutname: 'Abs Workout',
    image: 'assets/images/abs.jpg',
    exercises: '5',
    calories: '400',
    duration: '03:00',
    exerciselist: [
      'Reverse Crunches',
      'Leg Raises',
      'High Plank',
      'Side Plank',
      'Push Ups',
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
    ],
    exerciseaudiolist: [
      'audio/reversecrunches.mp3',
      'audio/legraises.mp3',
      'audio/highplank.mp3',
      'audio/sideplank.mp3',
      'audio/pushups.mp3',
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
  ),
  WorkoutModel(
    shortdescription: [
      "The dumbbell bent-over row strengthens your back, shoulders, and arms.",
      "Burpees are a full-body exercise that builds strength and endurance.",
      "Reverse crunches effectively target the lower abdominal muscles and improve core strength.",
      "The dumbbell extension targets the triceps. Hold a dumbbell overhead with both hands, elbows close to ears.",
      "Chest-focused dips primarily target the chest and triceps."
          "Push-ups are a classic upper-body exercise that targets the chest, shoulders, triceps, and core."
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
    workoutname: 'Arms Workout',
    image: 'assets/images/shoulder2.jpg',
    exercises: '6',
    calories: '500',
    duration: '04:00',
    exerciselist: [
      'Dumbbell Bent-Over Row',
      'Burpees',
      'Reverse Crunches',
      'Dumbbel_Extension',
      'Dips(Bench Press)',
      'Push Ups',
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
      "The barbell bench press is a compound exercise that targets the chest, shoulders, and triceps.",
      "The incline dumbbell press targets the upper chest, shoulders, and triceps",
      "Push-ups are a classic upper-body exercise that targets the chest, shoulders, triceps, and core.",
      "Chest-focused dips primarily target the chest and triceps.",
      "Incline push-ups are a great variation that targets the lower chest and shoulders"
    ],
    instructions: [],
    focus_areas: [],
    not_to_do: [],
    workoutname: 'Chest Workout',
    image: 'assets/images/chest.jpg',
    exercises: '5',
    calories: '700kcal',
    duration: '05:00',
    exerciselist: [
      'Dumbell Bench Press',
      'Incline Dumbbell Press',
      'Push-Ups (Bodyweight)',
      'Dips (Chest-Focused)',
      'Incline Push-Ups',
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
    workoutname: 'Legs Workout',
    image: 'assets/images/legs.jpg',
    exercises: '5',
    calories: '800',
    duration: '06:00',
    exerciselist: [
      'Squats (Bodyweight)',
      'Lunges',
      'Forward Lunges',
      'Wall Squats',
      'Calf Raises',
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
      exercisegiflist: [""],
      exerciseaudiolist: []),
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
      exercisegiflist: [""],
      exerciseaudiolist: [""])
];

class AllWorkoutModel {
  final String workoutname;
  final String calories;
  final String duration;

  final String excerciseaudio;
  final String excercisedetails;
  final String excercisegif;
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

  AllWorkoutModel(
    {
      required  this.exerciseDetails,
      required this.exerciseImages,
     required this.exercisegifs,
     required this.exerciseaudios,
    required this.duration,
    required this.calories,
    required this.exercises,
    required this.instructions,
    required this.workoutname,
    required this.excercisedetails,
    required this.excercisegif,
    required this.excerciseaudio,
    required this.exerciseimg,
    required this.focuss_area,
    required this.not_to_do,
    required this.short_description,
  });
}

List<AllWorkoutModel> allworkoutlist = [
  AllWorkoutModel(
      workoutname: "Reverse Crunches",
      excerciseaudio: "audio/reversecrunches.mp3",
      excercisedetails:
          "Reverse Crunches target the lower abdominal muscles, helping to strengthen and tone the core. To perform them, lie on your back with your knees bent and feet flat on the floor. Raise your legs towards your chest and lift your hips off the ground, then lower back down slowly. Benefits include improved core strength, reduced belly fat, and enhanced overall stability.",
      excercisegif: "assets/exercises/reverse_crunch.gif",
      exerciseimg: 'assets/images/chest2.jpeg',
      duration: '00:05',
      calories: '30',
      exercises: ["Reverse Crunches"],
      instructions: [ " 1. Lie on your back, arms at your sides\n2. Lift your legs, bending your knees to 90°.\n3. Use your core to lift your hips off the ground, bringing your knees toward your chest.\n4.Slowly lower back to the starting position.",
      ],
      focuss_area: ["lower abs:\nTargets the lower abdominal muscles, helping to tone and strengthen the core.",],
      not_to_do: ["1.Avoid using momentum to lift your hips\n2. Do not arch your lower back; keep it pressed against the mat. ",],
      short_description: ["Reverse Crunches target the lower abdominal muscles, helping to strengthen and tone the core.  ",
      ], exerciseDetails: [    "Reverse Crunches target the lower abdominal muscles, helping to strengthen and tone the core. To perform them, lie on your back with your knees bent and feet flat on the floor. Raise your legs towards your chest and lift your hips off the ground, then lower back down slowly. Benefits include improved core strength, reduced belly fat, and enhanced overall stability.",
  ], exerciseImages: [], exercisegifs: ["assets/exercises/reverse_crunch.gif"], exerciseaudios: [ "audio/reversecrunches.mp3"]),
  AllWorkoutModel(
      duration: '',
      calories: '',
      exercises: [],
      instructions: [],
      focuss_area: [],
      not_to_do: [],
      short_description: [], exerciseDetails: [], exerciseImages: [], exercisegifs: [], exerciseaudios: [],
      exerciseimg: 'assets/images/chest2.jpeg',
      workoutname: "Legs Raises",
      excercisedetails:
          "Leg Raises primarily work the lower abdominals and hip flexors. Lie on your back with your legs straight and slowly raise them towards the ceiling while keeping them together. Slowly lower them back down without letting your feet touch the ground. This exercise helps strengthen the core and improve lower body strength and flexibility.",
      excerciseaudio: "audio/legraises.mp3",
      excercisegif: "assets/exercises/leg_raises.gif"),
  AllWorkoutModel(
      duration: '',
      calories: '',
      exercises: [],
      instructions: [],
      focuss_area: [],
      not_to_do: [],
      short_description: [], exerciseDetails: [], exerciseImages: [], exercisegifs: [], exerciseaudios: [],
      exerciseimg: 'assets/images/chest2.jpeg',
      workoutname: "High Plank",
      excerciseaudio: "audio/highplank.mp3",
      excercisedetails:
          "High Plank is an effective full-body exercise that focuses on the core, shoulders, and arms. Start in a push-up position with your hands under your shoulders and your body in a straight line. Hold this position while engaging your core to prevent sagging in your back. High Planks enhance stability, strength, and endurance.",
      excercisegif: "assets/exercises/high_plank.png"),
  AllWorkoutModel(
      duration: '',
      calories: '',
      exercises: [],
      instructions: [],
      focuss_area: [],
      not_to_do: [],
      short_description: [], exerciseDetails: [], exerciseImages: [], exercisegifs: [], exerciseaudios: [],
      exerciseimg: 'assets/images/chest2.jpeg',
      workoutname: "Side Plank",
      excerciseaudio: "audio/sideplank.mp3",
      excercisedetails:
          "Side Plank targets the obliques, helping to improve core stability and posture. Lie on your side with your legs straight and prop yourself up on one elbow, lifting your hips to create a straight line from head to heels. Holding this position strengthens the sides of the core, improves balance, and tones the midsection.",
      excercisegif: "assets/exercises/side_plank.png"),
  AllWorkoutModel( duration: '',
      calories: '',
      exercises: [],
      instructions: [],
      focuss_area: [],
      not_to_do: [],
      short_description: [], exerciseDetails: [], exerciseImages: [], exercisegifs: [], exerciseaudios: [],
      exerciseimg: 'assets/images/chest2.jpeg',
      workoutname: "Push Ups",
      excerciseaudio: "audio/pushups.mp3",
      excercisedetails:
          "Push-Ups work the chest, shoulders, triceps, and core. Start in a plank position with your hands slightly wider than shoulder-width apart and lower your body until your chest almost touches the ground. Push back up to the starting position. Push-ups build upper body strength, improve posture, and enhance overall endurance.",
      excercisegif: "assets/exercises/pushups.gif"),
  AllWorkoutModel( duration: '',
      calories: '',
      exercises: [],
      instructions: [],
      focuss_area: [],
      not_to_do: [],
      short_description: [], exerciseDetails: [], exerciseImages: [], exercisegifs: [], exerciseaudios: [],
      exerciseimg: 'assets/images/chest2.jpeg',
      excerciseaudio: "audio/dumbellbentoverrow.mp3",
      workoutname: "Dumbell Bent-Over Row",
      excercisedetails:
          "Dumbbell Bent-Over Row strengthens the upper back, shoulders, and arms. Hold a dumbbell in each hand, bend your knees slightly, and hinge at the hips. With your back straight, pull the dumbbells towards your torso, then lower them back down. This exercise improves posture, builds back strength, and enhances muscular endurance.",
      excercisegif: "assets/exercises/dumbell_bench_over_row.gif"),
  AllWorkoutModel(
      duration: '',
      calories: '',
      exercises: [],
      instructions: [],
      focuss_area: [],
      not_to_do: [],
      short_description: [], exerciseDetails: [], exerciseImages: [], exercisegifs: [], exerciseaudios: [],
      exerciseimg: 'assets/images/chest2.jpeg',
      workoutname: "Burpees",
      excerciseaudio: "audio/burpees.mp3",
      excercisedetails:
          "Burpees are a full-body exercise that combines strength and cardio. Begin standing, squat down, jump your feet back into a plank, perform a push-up, jump your feet forward, and explosively jump into the air. Burpees boost cardiovascular fitness, burn fat, and improve muscle strength, especially in the legs, arms, and core.",
      excercisegif: "assets/exercises/burpees.gif"),
  AllWorkoutModel(
      duration: '',
      calories: '',
      exercises: [],
      instructions: [],
      focuss_area: [],
      not_to_do: [],
      short_description: [], exerciseDetails: [], exerciseImages: [], exercisegifs: [], exerciseaudios: [],
      exerciseimg: 'assets/images/chest2.jpeg',
      workoutname: "Dumbell Extension",
      excerciseaudio: "audio/dumbellextension.mp3",
      excercisedetails:
          "Dumbbell Extension targets the triceps and helps improve arm strength. Hold a dumbbell in both hands, extend your arms overhead, and slowly lower the dumbbell behind your head by bending your elbows. Extend your arms back to the starting position. This exercise builds triceps strength and definition.",
      excercisegif: "assets/exercises/dumbell_extension.gif"),
  AllWorkoutModel(
      duration: '',
      calories: '',
      exercises: [],
      instructions: [],
      focuss_area: [],
      not_to_do: [],

      short_description: [], exerciseDetails: [], exerciseImages: [], exercisegifs: [], exerciseaudios: [],
      exerciseimg: 'assets/images/chest2.jpeg',
      workoutname: "Dips",
      excerciseaudio: "audio/dips.mp3",
      excercisedetails:
          "Dips (Bench Press) focus on the triceps, shoulders, and chest. Sit on a bench with your hands beside your hips, slide forward, and lower your body until your elbows are at a 90-degree angle, then push back up. Dips enhance upper body strength, particularly in the triceps and chest.",
      excercisegif: "assets/exercises/dips.gif")
];
