/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
import java.util.ArrayList;

/**
 *
 * @author Victor Vallecillo Morilla
 */
public class Player 
{
   static final int MAXLEVEL=10;
   private String name;
   private int level;
   private boolean dead=true;
   private boolean canISteal=true;
   private Player enemy;
   private ArrayList<Treasure> visibleTreasures;
   private ArrayList<Treasure> hiddenTreasures;
   private BadConsequence pendingBadConsequence;
 
   public Player(String name)
   {
       this.name=name;
   }
   
   public String getName()
   {
       return name;
   }
   private void bringToLife()
   {
       dead=true;
   }
   private int getCombatLevel()
   {
       int total=0;
       
       for( Treasure t: hiddenTreasures)
           total=total+t.getBonus();
       
       return (total+level);
   }
   
   public static int getMAXLEVEL() {
        return MAXLEVEL;
   }

   public int getLevel() {
        return level;
   }

   public boolean isCanISteal() {
        return canISteal;
   }

   public Player getEnemy() {
        return enemy;
   }
   
   private void incrementLevels(int i)
   {
       level+=i;
   }
   private void decrementLevels(int i)
   {
       level-=i;
   }
   private void setPendingBadConsequence( BadConsequence b)
   {
       pendingBadConsequence=b;
   }  
   
   private void applyPrize(Monster m)
   {
       
   }
   private void applyBadConsequence(Monster m)
   {
       
   }
   private boolean canMakeTreasureVisible(TreasureKind t) 
   {
     return false;   
   }
   private int howManyVisibleTreasures(TreasureKind tKind)
   {
       int contador=0;
       
       for(Treasure t: visibleTreasures)
            if(t.getType()==tKind)
               contador++;
       
       return contador;       
   }
   private void dieIfNoTreasures()
   {
       if(hiddenTreasures.isEmpty() && visibleTreasures.isEmpty())
           dead=true;
   }
   public boolean isDead()
   {
      return dead; 
   } 
   
   public ArrayList<Treasure> getVisibleTreasures() {
        return visibleTreasures;
   }

   public ArrayList<Treasure> getHiddenTreasures() {
        return hiddenTreasures;
   }

   public BadConsequence getPendingBadConsequence() {
        return pendingBadConsequence;
   }

   public CombatResult combat(Monster m)
   {
        return  null;

   }
   public void makeTreasureVisible(Treasure t)
   {
       
   }
   public void iscardVisibleTreasure(Treasure t) 
   {
       
   }
   public void discardHiddenTreasure(Treasure t) 
   {
    
   }
   public boolean validState()
   {
       boolean valido=false;
       
     if(pendingBadConsequence.isEmpty() && hiddenTreasures.size()>4)
         valido=true;
     
     return valido;
   }
   public void initTreasures()
   {
       
   }
   public int getLevels()
   {
     return 0;
   }
   public Treasure stealTreasure()
   {
     return  null;
   }
   public void setEnemy(Player enemy)
   {
        this.enemy=enemy;
   }
   private Treasure giveMeATreasure()
   {
     return  null;
   }
   public boolean canISteal() 
   {
     boolean robado=false;
     if(visibleTreasures.size()==0 && hiddenTreasures.size()==0)
         robado=true;
     return robado;
   }
   private boolean canYouGiveMeATreasure()
   {
     boolean ser_robado=false;
     if(visibleTreasures.size()>0 || hiddenTreasures.size()>0)
         ser_robado=true;
     
     return ser_robado;  
   }
   private void haveStolen()  
   {
       if(canISteal()==false)
           canISteal=false;
   }
   public void discardAllTreasures()
   {
               
   }  
    
}
