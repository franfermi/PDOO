/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author Victor Vallecillo Morilla
 */
public class Player 
{
   public static int MAXLEVEL=10;
   private String name;
   private int level;
   private boolean dead=true;
   private boolean canISteal=true;
   private Player enemy;
   private ArrayList<Treasure> visibleTreasures=new ArrayList();
   private ArrayList<Treasure> hiddenTreasures=new ArrayList();
   private BadConsequence pendingBadConsequence=new BadConsequence("",0,0,0);
 
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
   public int getCombatLevel()
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
       if(level> MAXLEVEL)
               level=10;
   }
   private void decrementLevels(int i)
   {
       level-=i;
       
       if(level <0)
           level=0;
   }
   private void setPendingBadConsequence( BadConsequence b)
   {
       pendingBadConsequence=b;
   }  
   
   public void applyPrize(Monster m)   // MODIFICADO
   {
       int nLevels=m.getLevelsGained();
       incrementLevels(nLevels);
       int nTreasures=m.getTreasuresGained();
       
       if(nTreasures>0)
       { 
           CardDealer dealer=CardDealer.getInstance();
           
           for(int i=0;i<nTreasures;i++)
           {
               Treasure treasure=dealer.nextTreasure();
               hiddenTreasures.add(treasure);
           }
       }
   }
   public void applyBadConsequence(Monster m) // MODIFICADO
   {
       BadConsequence badConsequence=m.getBadConsequence();
       int nLevels=badConsequence.getLevels();
       
       decrementLevels(nLevels);
       
       
       BadConsequence pendingBad=badConsequence.adjustToFitTreasureLists(this.visibleTreasures, this.hiddenTreasures);
       
       setPendingBadConsequence(pendingBad);
   }
   private boolean canMakeTreasureVisible(Treasure t)    // MODIFICADO
   {
       boolean resultado = true;
        if (visibleTreasures.size() < 4)
        {
            TreasureKind tipo = t.getType();
            if (tipo != TreasureKind.ONEHAND && tipo != TreasureKind.BOTHHANDS)
            {
                boolean hasOne = false; 
                for (Treasure tv : visibleTreasures)
                {
                    if (tv.getType() == tipo)
                        hasOne = true; 
                }
                return !hasOne; 
            }
            else if (tipo == TreasureKind.ONEHAND)
            {
                int i = 0; 
                boolean hasBothhands = false; 
                for (Treasure Vt : visibleTreasures)
                {
                    if(Vt.getType() == TreasureKind.ONEHAND)
                        i++;
                    else if (Vt.getType() == TreasureKind.BOTHHANDS)
                        hasBothhands = true; 
                }   
                return (i < 2&&!hasBothhands); 
            }     
            else
            {
                boolean Both = false; 
                boolean onehands = false; 
                for (Treasure Vt : visibleTreasures)
                {
                    if(Vt.getType() == TreasureKind.ONEHAND)
                        onehands = true;
                    else if (Vt.getType() == TreasureKind.BOTHHANDS)
                        Both = true; 
                }
                return (!onehands && !Both );
            }
        }
        return resultado;
       
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
       CombatResult combat;
       int myLevel =getCombatLevel();
        int monsterLevel=m.getCombatLevel();
        
        if(myLevel > monsterLevel)
        {
           applyPrize(m);   
           
           if(getLevels()>=MAXLEVEL)
              combat=CombatResult.WINGAME;
           else
               combat=CombatResult.WIN;

        }
        else
        {
            applyBadConsequence(m);
            combat=CombatResult.LOSE;
        }

        return combat;
   }
   public void makeTreasureVisible(Treasure t)     
   {
       boolean CanI=canMakeTreasureVisible(t);
       if(CanI)
       {
           visibleTreasures.add(t);
           hiddenTreasures.remove(t);
       }
          
   }
   public void discardVisibleTreasure(Treasure t)    
   {
       visibleTreasures.remove(t);
       
       if ((this.pendingBadConsequence != null) && (!this.pendingBadConsequence.isEmpty()))
            pendingBadConsequence.substractVisibleTreasure(t);
       
       this.dieIfNoTreasures();
   }
   public void discardHiddenTreasure(Treasure t)   
   {
         hiddenTreasures.remove(t);
         
       if (this.pendingBadConsequence != null && !this.pendingBadConsequence.isEmpty())
             pendingBadConsequence.substractHiddenTreasure(t);
       
       CardDealer.getInstance().giveTreasureBack(t); 
       this.dieIfNoTreasures();
   }
   public boolean validState()
   {
       boolean valido=false;
       
     if(pendingBadConsequence.isEmpty() && hiddenTreasures.size()<=4)
         valido=true;
     
     return valido;
   }
   public void initTreasures()         
   {
       CardDealer dealer=CardDealer.getInstance();
       Dice dice=Dice.getInstance();
       bringToLife();
       
       Treasure treasure=dealer.nextTreasure();
       
       hiddenTreasures.add(treasure);
       int number=dice.nextNumber();
       
       if(number>1 )
       {
           treasure=dealer.nextTreasure();
           hiddenTreasures.add(treasure);
       }
       if(number==6)
        {
             treasure=dealer.nextTreasure();
           hiddenTreasures.add(treasure);
        }
   }
   public int getLevels()
   {
     return level;
   }
   public Treasure stealTreasure()
   {
       Treasure treasure=null;
      canISteal=canISteal();
      if(canISteal)
      {
          boolean canYou=enemy.canYouGiveMeATreasure();
          
          if(canYou)
          {
              treasure=enemy.giveMeATreasure();
              hiddenTreasures.add(treasure);
              haveStolen();
          }
      }
      return treasure;
   }
   public void setEnemy(Player enemy)
   {
        this.enemy=enemy;
   }
   private Treasure giveMeATreasure()   // MODIFICADO
   {
     Random r = new Random();
     int tope=hiddenTreasures.size();
     int valor= r.nextInt(tope);
     
     return hiddenTreasures.get(valor);
   }
   public boolean canISteal() 
   {
    return canISteal;
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
      // if(canISteal()==false)
           canISteal=false;
   }
   public void discardAllTreasures()  // MODIFICADO
   {
       while(!visibleTreasures.isEmpty())
         discardVisibleTreasure(visibleTreasures.get(0));
       
         
       while(!hiddenTreasures.isEmpty())
        discardHiddenTreasure(hiddenTreasures.get(0));
       
       
   } 
   
   @Override
   public String toString()
   {
       return "\n Nombre: "+name+"\n Nivel: "+level ;
   }
    
}
