class Animal{
  String name;
  int age;
  String healthStatus ;
  void displayDetails(){
    print('Name: $name Age: $age HealthStatus: $healthStatus');
  }
  @override
  String toString() {
    return 'name: $name, age: $age, healthStatus: $healthStatus';
  }
  Animal(this.name,this.age,[this.healthStatus = 'Healthy']);
}

class FeedingSchedule{
  String time;
  String foodType;
  String quantity;
  Animal animalName;
  @override
  String toString() {
    String temp = animalName.name;
    return '$temp $time - $foodType - $quantity';
  }
  FeedingSchedule(this.animalName, this.time, this.foodType,this.quantity);
}

class Exhibit{
  String name;
  List<Animal> animals = [];
  List<FeedingSchedule> feedingSchedules = [];
  @override
  String toString() {
    return '$name';
  }
  void addAnimalToExhibit(Animal a){
    animals.add(a);
  }
  void addFeedingSchedule(FeedingSchedule f){
    feedingSchedules.add(f);
  }
  void displayDetails(){
    print('Name: $name\n List of animals: $animals\n List of feeding Schedules: $feedingSchedules');
  }
  Exhibit(this.name);
}

class Visitor{
  String name;
  int age;
  List<Exhibit> visitedExhibits = [];
  @override
  String toString() {
    return '$name (Age:$age)';
  }
  Visitor(this.name,this.age);
  void visitExhibit(Zoo zoo,Exhibit exhibitName){
    visitedExhibits.add(exhibitName);
  }
}

class Zoo{
  List<Animal> animals = [];
  List<FeedingSchedule> feedingSchedules = [];
  List<Exhibit> exhibits = [];
  List<Visitor> visitors = [];
  void addAnimal(Animal a){
    animals.add(a);
  }
  void addExhibit(Exhibit e){
    exhibits.add(e);
  }
  void addFeedingSchedule(FeedingSchedule f){
    feedingSchedules.add(f);
  }
  void transferAnimal(Animal animal,Exhibit fromExhibit,Exhibit toExhibit){
    fromExhibit.animals.remove(animal);
    toExhibit.animals.add(animal);
  }
  void moveAnimalToExhibit(Animal a,Exhibit e){
    e.animals.add(a);
  }
  void displayAllAnimals(){
    print('Details of all animals:\n');
    for(Animal animal in animals){
    print(animal);
    print('\n');
    }
  }
  void displayFeedingSchedule(){
    print('Details of all Feeding Schedules:\n');
    for(FeedingSchedule fs in feedingSchedules){
    print(fs);
    print('\n');
    }
  }
  void displayExhibits(){
    print('Details of all Exhibits:\n');
    for(Exhibit e in exhibits){
    print(e);
    print('\n');
    }
  }
  void displayVisitors(){
    print('Details of all Visitors:\n');
    for(Visitor v in visitors){
    print(v);
    print('\n');
    }
  }
  void updateFeedingSchedule(Animal animal,String time,String foodType,String quantity){
    
  }
}
void main(){
  Zoo myZoo = Zoo();
  Animal lion = Animal('Simba',5);
  Animal giraffe = Animal('Gerald',5);
  Exhibit interactiveExhibit = Exhibit('Savannah Exhibit');
  Exhibit staticExhibit = Exhibit('Rainforest Exhibit');
  FeedingSchedule lionfs = FeedingSchedule(lion, '10:00 AM', 'Meat', '2 kg');
  FeedingSchedule giraffefs = FeedingSchedule(giraffe, '12:30 PM',  'Leaves',  '5 kg');
  Visitor johnDoe = Visitor('John Doe',  25);
  
  myZoo.addAnimal(lion);
  myZoo.addAnimal(giraffe);
  myZoo.addExhibit(interactiveExhibit);
  myZoo.addExhibit(staticExhibit);
  myZoo.addFeedingSchedule(lionfs);
  myZoo.addFeedingSchedule(giraffefs);
  
  
  myZoo.displayAllAnimals();
  myZoo.displayExhibits();
  myZoo.displayFeedingSchedule();
  myZoo.displayVisitors();

}