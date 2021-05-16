class Assignment {
  final String title;
  final String dueDate;
  final String subject;
  final String marks;
  final String question;
  final bool hasSubmitted;
  final String subjectCode;

  Assignment({
    this.subjectCode,
    this.hasSubmitted,
    this.title,
    this.dueDate,
    this.subject,
    this.marks,
    this.question,
  });
}
