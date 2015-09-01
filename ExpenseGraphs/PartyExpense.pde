class PartyExpense
{
  
  String name;
  
  float total;
  
  color colour;
  
  PartyExpense(String name, float total)
  {
    this.name = name;
    
    this.total = total;
    
    colour = color((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  }
  
}
