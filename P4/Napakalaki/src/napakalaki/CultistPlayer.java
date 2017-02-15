/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
import java.util.Random;
/**
 *
 * @author pako
 */
public class CultistPlayer extends Player{
    private static int totalCultistPlayers=0;
    private Cultist myCultistCard;
    
    public CultistPlayer(Player p, Cultist c){
        super(p); //Herencia de la superclase, llamada al constructor.
        this.myCultistCard=c;
        totalCultistPlayers++;
    }
    
    @Override
    protected int getCombatLevel(){ 
        double x=(super.getCombatLevel() * 20) / 100;
        int porcentaje=(int)x;
        return super.getCombatLevel() + porcentaje + (myCultistCard.getGainedLevels() * totalCultistPlayers);
    }
    
    @Override
    protected int getOponentLevel(Monster m){
        return m.getCombatLevelAgainstCultistPlayer();
    }
    
    @Override
    protected boolean shouldConvert(){
        return false;
    }
    
    private Treasure giveMeATreasure(){
        Random rnd = new Random();
        int tope=super.visibleTreasures.size();
        int valor= rnd.nextInt(tope);

        return super.visibleTreasures.get(valor);
    }
    
    private boolean canYouGiveMeATreasure(){
        boolean ser_robado=false;
        if(super.visibleTreasures.size()>0)
            ser_robado=true;

        return ser_robado; 
    }
    
    public static int getTotalCultistPlayers(){
        return totalCultistPlayers;
    }
}
