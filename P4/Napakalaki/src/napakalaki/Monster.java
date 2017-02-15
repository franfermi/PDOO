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
    private BadConsequence badConsequence; //Segun el diagrama sería "badConsequence"
    private Prize prize; //Segun el diagrama sería "prize"
    private int levelChangeAgainstCultistPlayer=0;
    
    public Monster(String n, int l, BadConsequence b, Prize p)
    {
        this.name=n;
        this.combatLevel=l;
        this.badConsequence=b;
        this.prize=p;
    }
    
    public Monster(String n, int l, BadConsequence badConsequence, Prize p, int IC){ 
        this.name=n;
        this.combatLevel=l;
        this.badConsequence=badConsequence;
        this.prize=p;
        this.levelChangeAgainstCultistPlayer=IC; //Duda de si se asigna a esta variable!
    }
    
    public int getCombatLevelAgainstCultistPlayer(){
        return this.levelChangeAgainstCultistPlayer + this.getCombatLevel();
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
   
   
   
   @Override
   public String toString(){
        return "Name = " + this.name + " CombatLevel = " + Integer.toString(this.combatLevel);
    }      
}

