//Model class

class Quote {

  final String quote;
  final String category;
  final String author;

  //parameterized constructor

Quote({
    required this.quote,
    required this.author,
    required this.category,
});

//factory constructor
 factory Quote.fromMap({required Map data}){
   return Quote(
       quote: data['quote'],
       author: data['author'],
       category: data['category'],
   );
 }

}