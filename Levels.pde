
class Levels{
  
//declaring an array list for the platforms
ArrayList<Platform> platformList;

//declaring an array list for fire puddles
ArrayList<Puddle> puddleList;

//declaring an array list for water puddles
ArrayList<waterPuddle> wPuddleList;

  Levels(){
  //intialize my array list for platforms
 platformList = new ArrayList<Platform>();
  
  //intialize my array list for the puddles
 puddleList = new ArrayList<Puddle>();
 
  //initialize array list for water puddles
 wPuddleList = new ArrayList<waterPuddle>();
  
  }
  
  
 void render(){
  for(Platform aPlatform : platformList){
  aPlatform.render();

 }

//making the fire puddles appear
 for(Puddle aPuddle : puddleList){
  aPuddle.render();

 }
 
//making the water puddles appear
  for(waterPuddle aPuddle : wPuddleList){
  aPuddle.render();
}
   
 }
}
