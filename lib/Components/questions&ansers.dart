class Qeustions{
 late String question;
  late int qNum ;
  Qeustions(this.qNum,this.question);
}
List<List<Qeustions>>questionsList=[
 [
   Qeustions(1, "Who is the Dev this program? :)"),
  Qeustions(2, "how old is he"),
  Qeustions(3, "what is his major?")
 ],
];
class Answers {
  late bool correct ;
  late String answer;
  Answers(this.answer,this.correct);
}
List<List<Answers>>answer=[
  [
    Answers("Kareem", false),
     Answers("Kareem", false),
      Answers("Kareem", false),
       Answers("All of the above", true),
  ],
  [
    Answers("20", false),
    Answers("19", false),
    Answers("21", true),
    Answers("30", false),
  ],
  [
    Answers("CS", true),
    Answers("IT", false),
    Answers("IS", false),
    Answers("AI", false)
  ]
];