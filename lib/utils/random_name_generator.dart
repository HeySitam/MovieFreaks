import 'dart:math';

class RandomNameGenerator
{
  final _namesList = <String>[];
  final groupNamesMap = <String, List<String>>{};
  get getNameList => _namesList;
  RandomNameGenerator(){
    _generateName(100);
    _generateGroupOfNames();
  }

   _generateName(int numOfName) {
    print(_firstName.length);
    print(_lastName.length);
    for(var i = 0; i < numOfName; i++){
      int rFirst = Random().nextInt(33);
      int rLast =  Random().nextInt(150);
      _namesList.add("${_firstName[rFirst]} ${_lastName[rLast]}");
    }

  }

   _generateGroupOfNames(){
    _namesList.forEach((name) {
      final key = name[0];
      if(groupNamesMap.containsKey(key)){
        groupNamesMap[key]?.add(name);
      } else {
        final groupList = [name];
        groupNamesMap[key] = groupList;
      }
    });
    final sortedByKeyMap = Map.fromEntries(
        groupNamesMap.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
    groupNamesMap.clear();
    groupNamesMap.addAll(sortedByKeyMap);
  }

  final _firstName = ["Adam", "Alex", "Aaron", "Ben", "Carl", "Dan", "David", "Edward", "Fred", "Frank", "George", "Hal", "Hank", "Ike", "John", "Jack", "Joe", "Larry", "Monte", "Matthew", "Mark", "Nathan", "Otto", "Paul", "Peter", "Roger", "Roger", "Steve", "Thomas", "Tim", "Ty", "Victor", "Walter"];
  final _lastName = ["Anderson", "Ashwoon", "Aikin", "Bateman", "Bongard", "Bowers", "Boyd", "Cannon", "Cast", "Deitz", "Dewalt", "Ebner", "Frick", "Hancock", "Haworth", "Hesch", "Hoffman", "Kassing", "Knutson", "Lawless", "Lawicki", "Mccord", "McCormack", "Miller", "Myers", "Nugent", "Ortiz", "Orwig", "Ory", "Paiser", "Pak", "Pettigrew", "Quinn", "Quizoz", "Ramachandran", "Resnick", "Sagar", "Schickowski", "Schiebel", "Sellon", "Severson", "Shaffer", "Solberg", "Soloman", "Sonderling", "Soukup", "Soulis", "Stahl", "Sweeney", "Tandy", "Trebil", "Trusela", "Trussel", "Turco", "Uddin", "Uflan", "Ulrich", "Upson", "Vader", "Vail", "Valente", "Van Zandt", "Vanderpoel", "Ventotla", "Vogal", "Wagle", "Wagner", "Wakefield", "Weinstein", "Weiss", "Woo", "Yang", "Yates", "Yocum", "Zeaser", "Zeller", "Ziegler", "Bauer", "Baxster", "Casal", "Cataldi", "Caswell", "Celedon", "Chambers", "Chapman", "Christensen", "Darnell", "Davidson", "Davis", "DeLorenzo", "Dinkins", "Doran", "Dugelman", "Dugan", "Duffman", "Eastman", "Ferro", "Ferry", "Fletcher", "Fietzer", "Hylan", "Hydinger", "Illingsworth", "Ingram", "Irwin", "Jagtap", "Jenson", "Johnson", "Johnsen", "Jones", "Jurgenson", "Kalleg", "Kaskel", "Keller", "Leisinger", "LePage", "Lewis", "Linde", "Lulloff", "Maki", "Martin", "McGinnis", "Mills", "Moody", "Moore", "Napier", "Nelson", "Norquist", "Nuttle", "Olson", "Ostrander", "Reamer", "Reardon", "Reyes", "Rice", "Ripka", "Roberts", "Rogers", "Root", "Sandstrom", "Sawyer", "Schlicht", "Schmitt", "Schwager", "Schutz", "Schuster", "Tapia", "Thompson", "Tiernan", "Tisler" ];
}