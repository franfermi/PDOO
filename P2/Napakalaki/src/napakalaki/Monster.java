/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;

/**
 *
 * @author Victor Vallecillo Morilla
 */
public class Monster
{
    private String name;
    private int combatLevel;
    BadConsequence badConsequence; //Segun el diagrama sería "badConsequence"
    Prize prize; //Segun el diagrama sería "prize"
    
    public Monster(String n, int l, BadConsequence b, Prize p)
    {
        this.name=n;
        this.combatLevel=l;
        this.badConsequence=b;
        this.prize=p;
    }
    
    public String getName()
    { 
        return  name; 
    }
    
    public int getCombatLevel()
    {
        return combatLevel; 
    }
    
    public BadConsequence getBadConsequence() {
        return badConsequence;
    }
    
    public Prize getPrize() {
        return prize;
    } 
    
    public int getLevelsGained()
    {
        return prize.getLevels();
    }
    
   public int getTreasuresGained()
   {
       return prize.getTreasures();
   }
   
    public String toString(){
        return "Monster Name = " + name 
                + " CombatLevel = " + Integer.toString(combatLevel) 
                + " Prize = " + prize 
                + " badConsequence = " + badConsequence;
    }      
}

