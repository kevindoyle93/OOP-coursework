ArrayList<Expense> expenses;

ArrayList<PartyExpense> partyExpenses;

void setup()
{
  size(800, 500);
  
  expenses = new ArrayList<Expense>();
  
  partyExpenses = new ArrayList<PartyExpense>();
  
  loadExpenses();
  
  showPeople = true;
  
  showParties = false;
}

boolean showPeople;

boolean showParties;

void draw()
{
  background(0);
  
  if(showPeople)
  {
    drawExpenseBars();
  }
  else
  {
    drawPartyExpenseBars();
  }
}

void loadExpenses()
{
  
  String data[] = loadStrings("expenses.txt");
  
  String name, party, constituency;
  
  float returned, claimed, total;
  
  for(int i = 0; i < data.length; i++)
  {
    String line[] = split(data[i], "\t");
    
    name = line[0];
    party = line[1];
    constituency = line[2];
    returned = Float.parseFloat(line[3]);
    claimed = Float.parseFloat(line[4]);
    total = claimed - returned;
    
    expenses.add(new Expense(name, party, constituency, returned, claimed, total));
    
    // This adds the first partyExpense as it wouldn't enter the for loop below otherwise
    if(partyExpenses.size() < 1)
    {
      partyExpenses.add(new PartyExpense(party, total));
    }
    
    boolean partyExists = false;
    
    // partyExists is used here to check whether or not a partyExpenses element exists for this party already.
    // If one doesn't exists, a new element should be created
    
    for(int j = 0; j < partyExpenses.size(); j++)
    {
      if(party.equals(partyExpenses.get(j).name))
      {
        partyExpenses.get(j).total += total;
        partyExists = true;
      }
    }
    
    if(!partyExists)
    {
      partyExpenses.add(new PartyExpense(party, total));
    }
    
  }
}

void drawExpenseBars()
{
  float maxTotal = Float.MIN_VALUE;
  
  for(int i = 0; i < expenses.size(); i++)
  {
    if(expenses.get(i).total > maxTotal)
    {
      maxTotal = expenses.get(i).total;
    }
  }
  
  float scale = (float)height / maxTotal;
  
  float barWidth = (float)width / expenses.size();
  
  for(int i = 0; i < expenses.size(); i++)
  {
    stroke(expenses.get(i).colour);
    
    fill(expenses.get(i).colour);
    
    rect(barWidth * i, height, barWidth, -(expenses.get(i).total * scale));
  }
}

void drawPartyExpenseBars()
{
  float maxTotal = Float.MIN_VALUE;
  
  for(int i = 0; i < partyExpenses.size(); i++)
  {
    if(partyExpenses.get(i).total > maxTotal)
    {
      maxTotal = partyExpenses.get(i).total;
    }
  }
  
  float scale = (float)height / maxTotal;
  
  float barWidth = (float)width / partyExpenses.size();
  
  for(int i = 0; i < partyExpenses.size(); i++)
  {
    stroke(partyExpenses.get(i).colour);
    
    fill(partyExpenses.get(i).colour);
    
    rect(barWidth * i, height, barWidth, -(partyExpenses.get(i).total * scale));
    
    stroke(255);
    
    fill(255);
    
    text(partyExpenses.get(i).name, barWidth * i + barWidth / 3, height / 10);
  }
}


void keyPressed()
{
  if(key == '0')
  {
    showPeople = true;
    
    showParties = false;
  }
  
  if(key == '1')
  {
    showParties = true;
    
    showPeople = false;
  }
}
  
