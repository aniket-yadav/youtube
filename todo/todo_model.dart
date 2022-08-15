class TODO {
  int? id;
  String label;
  String desc;
  int isComplete;
  String date;
//  nothing much just id, label desc, iscomplete to check if it;s done or not
// and date which i am not using anywhere but still 
  TODO({
    this.id,
    required this.date,
    required this.desc,
    required this.label,
    this.isComplete = 0,
  });

//  to map function to convert objet to map 
//  okay now let's see db helper 
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'desc': desc,
      'label': label,
      'isComplete': isComplete,
    };
  }
}
