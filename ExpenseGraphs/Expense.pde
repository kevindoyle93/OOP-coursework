class Expense
{
  String name;
  
  String party;
  
  String constituency;
  
  float returned;
  
  float claimed;
  
  float total;
  
  color colour;
  
  Expense(String name, String party, String constituency, float returned, float claimed, float total)
  {
    this.name = name;
    
    this.party = party;
    
    this.constituency = constituency;
    
    this.returned = returned;
    
    this.claimed = claimed;
    
    this.total = total;
    
    colour = color((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  }
  
  //Expense()
  //{
    //this('', '', '', 0.0f, 0.0f, 0.0f);
  //}
  
}
