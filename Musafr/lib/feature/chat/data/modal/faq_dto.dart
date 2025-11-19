class FAQDto{
  String? title;
  String? question;
  String? answer;

  FAQDto({this.title, this.answer, this.question});
  factory FAQDto.fromJson(Map<String, dynamic> json) {
    return FAQDto(
      title: json['title'] ,
      question: json['question'] ,
      answer: json['answer'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'question': question,
      'answer': answer,
    };
  }
}