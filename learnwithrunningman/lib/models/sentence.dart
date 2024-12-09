class Sentence {
    final int? id;
    final String sentence;
    final String translation;
    final String mandarin;

    Sentence({
        this.id,
        required this.sentence,
        required this.translation,
        required this.mandarin,
    });

    factory Sentence.fromMap(Map<String, dynamic> map) {
        return Sentence(
            id: map['id'],
            sentence: map['sentence'],
            translation: map['translation'],
            mandarin: map['mandarin'],
        );
    }
}