void main(){
  String s = "The quick brown fox jumps over the lazy dog.";
  int nCharacters = 0;
  int nWords = 0;
  int nSentences = 0;
  int nArticles = 0;
  List<String> words= s.split(' ');
    nCharacters = s.length;
    for(int i=0;i<nCharacters;i++){
      if(s[i]==' '){
        nWords++;
      }
      if(s[i]=='.'){
        nSentences++;
      }
    }
    nWords++;
    for(String word in words){
      if(word=='a'||word=='A'||word=='The'||word=="the"||word=="an"||word=="An"){
        nArticles++;
      }
    }
  print('Characters:$nCharacters\nWords:$nWords\nSentences:$nSentences\nArticles:$nArticles');
}