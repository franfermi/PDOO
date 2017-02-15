/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
import java.util.ArrayList;
import java.util.Arrays;
//MODIFICADO
import java.util.Random;
/**
 *
 * @author Francisco Fernandez Millan
 */
public class Napakalaki {
    private static Napakalaki instance = null;
    private Monster currentMonster;
    private CardDealer dealer=CardDealer.getInstance();
    private ArrayList<Player> players=new ArrayList();
    private Player currentPlayer;
    
    private Napakalaki(){    
    }

    public static Napakalaki getInstance() {
        if (instance == null) {
            instance = new Napakalaki();
        }
        return instance;
    }
    //MODIFICADO
    private void initPlayers(ArrayList<String> names){
       
        for(String n : names)
            players.add(new Player(n));
    }
    //MODIFICADO
    private Player nextPlayer(){
        int sigIndex;
        int totalPlayers=0;
        Player nextPlayer;
        
        totalPlayers=this.players.size();
        
        if(this.currentPlayer == null){
            Random rnd = new Random();
            sigIndex = rnd.nextInt(totalPlayers);
        }
        else{
            int currentPlayerIndex = this.players.indexOf(this.currentPlayer);
            
            if(currentPlayerIndex == totalPlayers - 1){
                sigIndex = 0;
            }
            else{
                sigIndex = currentPlayerIndex + 1;
            }
        }
        
        nextPlayer = this.players.get(sigIndex);
        
        this.currentPlayer = nextPlayer;
        
        return this.currentPlayer;       
    }
    //MODIFICADO S2
    private boolean nextTurnIsAllowed(){           
        boolean allowed;

        if (this.currentPlayer == null) {
            allowed = true;
        } else {
            allowed = this.currentPlayer.validState();
        }

        return allowed;
    }
    //MODIFICADO
    private void setEnemies(){ 
        Random rnd = new Random();
        int indexEnemy;
        int totalPlayers=this.players.size();
        
        for(Player p : players){
            indexEnemy = rnd.nextInt(totalPlayers);
            while(p == players.get(indexEnemy)){
            	indexEnemy = rnd.nextInt(totalPlayers);
            }
           p.setEnemy(players.get(indexEnemy)); 
        }
    }
    //MODIFICADO S2
    public CombatResult developCombat(){
       CombatResult combat=currentPlayer.combat(currentMonster);
       dealer.giveMonsterBack(currentMonster);
       
       if(combat == CombatResult.LOSEANDCONVERT){
           Cultist cultist=this.dealer.nextCultist();
           CultistPlayer culPlayer=new CultistPlayer(currentPlayer, cultist);
           //Obtenemos el índice del jugador actual
           int currentPlayerIndex=this.players.indexOf(this.currentPlayer);
           //Sustituimos en el array de jugadores, culPlayer en la
           //posicion del jugador actual
           this.players.set(currentPlayerIndex, culPlayer);
           this.currentPlayer=culPlayer;
       }
       
       return combat;
    }
   //MODIFICADO S2
    public void discardVisibleTreasures(ArrayList<Treasure> treasures){ 
        for(Treasure t: treasures){
            currentPlayer.discardVisibleTreasure(t);
            dealer.giveTreasureBack(t);
        }
    }
    //MODIFICADO S2
    public void discardHiddenTreasures(ArrayList<Treasure> treasures){        
        for(Treasure t: treasures){
            currentPlayer.discardHiddenTreasure(t);
            dealer.giveTreasureBack(t);
        }      
    }
    //Modificado S2
    public void makeTreasuresVisible(ArrayList<Treasure> treasures){
        for(Treasure t: treasures){
            currentPlayer.makeTreasureVisible(t);
       }
        
    } 
    //MODIFICADO S2
    public void initGame(ArrayList<String> players){
        this.initPlayers(players);
        this.setEnemies();
        dealer.initCards();
        this.nextTurn();
    }
    //MODIFICADO
    public Monster getCurrentMonster() {
        return this.currentMonster;
    }

    public CardDealer getDealer() {
        return dealer;
    }
    //MODIFICADO
    public Player getCurrentPlayer() {
        return this.currentPlayer;
    }
    //MODIFICADO S2
    public boolean nextTurn(){
        boolean stateOK=this.nextTurnIsAllowed();
        
        if(stateOK){
            currentMonster=dealer.nextMonster();
            currentPlayer=this.nextPlayer();
            boolean dead=currentPlayer.isDead();
            
            if(dead){
                currentPlayer.initTreasures();
            }
        }
        return stateOK;
    }
    //MODIFICADO
    public boolean endOfGame(CombatResult result){
        boolean end = false;
        
        if(result == CombatResult.WINGAME){
            end = true;
        }
       
       return end;     
    }
}
