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
public class Monster implements Card
{
    private String name;
    private int combatLevel;
    private BadConsequence badConsequence; //Segun el diagrama sería "badConsequence"
    private Prize prize; //Segun el diagrama sería "prize"
    private int levelChangeAgainstCultistPlayer;
    
    private String icon;
    
    public Monster(String name, int combatLevel, String icon) {
        this.name = name;
        this.combatLevel = combatLevel;
        this.icon = icon;
    }
    
    public Monster(String n, int l, BadConsequence b, Prize p, String icon)
    {
        this.name=n;
        this.combatLevel=l;
        this.badConsequence=b;
        this.prize=p;
        this.icon=icon;
    }
    
    public Monster(String n, int l, BadConsequence badConsequence, Prize p, int IC, String icon){ 
        this.name=n;
        this.combatLevel=l;
        this.badConsequence=badConsequence;
        this.prize=p;
        this.levelChangeAgainstCultistPlayer=IC;
        this.icon=icon;
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
   
    @Override
    public int getBasicValue() {
        return this.getCombatLevel();
    }

    @Override
    public int getSpecialValue() {
        return this.getCombatLevel() + this.levelChangeAgainstCultistPlayer;
    }

    @Override
    public String getIcon() {
        return "/cartas/monsters/" + this.icon +  ".jpg";
    }
}

