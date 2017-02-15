/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;
/**
 *
 * @author Francisco Fernandez Millan
 */
public class Napakalaki {
    private static final Napakalaki instance = null;
    private Monster currentMonster;
    private CardDealer dealer; //Preguntar si son clases privadas.
    private ArrayList<Player> players=new ArrayList();
    private Player currentPlayer;
    
    private Napakalaki(){    
    }
    
    public static Napakalaki getInstance() {
        return instance;
    }
    
    private void initPlayers(ArrayList<String> names){
        players = new ArrayList();
        
        for(String n : names)
            players.add(new Player(n));
    }
    
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
            int currentPlayerIndex = this.players.indexOf(this.currentPlayer); //Duda
            
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
    
    private boolean nextTurnAllowed(){
        boolean allowed;
        
        if(this.currentPlayer == null){
            allowed = true;
        }
        else{
            allowed = this.currentPlayer.validState();
        }
        return allowed;
    }
    
    private void setEnemies(){  //Completar!!!
        Random rnd = new Random();
        int indexEnemy;
        int totalPlayers=this.players.size();
        
        for(Player p : players){
            indexEnemy = rnd.nextInt(totalPlayers);
            if(p == players.get(indexEnemy))
        }
    }
    
    public CombatResult developCombat(){
        return null;
    }
    
    public void discardVisibleTreasures(ArrayList<Treasure> treasures){ 
        
    }

    public void discardHiddenTreasures(ArrayList<Treasure> treasures){ 
        
    }
    
    public void makeTreasuresVisible(ArrayList<Treasure> treasures){
        
    }
    
    public void initGame(ArrayList<String> players){
        
    }

    public Monster getCurrentMonster() {
        return this.currentMonster;
    }

    public CardDealer getDealer() {
        return dealer;
    }

    public Player getCurrentPlayer() {
        return this.currentPlayer;
    }
    
    public boolean nextTurn(){
        return false;
    }
    
    public boolean endOfGame(CombatResult result){
        boolean end = false;
        
        if(result == CombatResult.WINGAME){
            end = true;
        }
       
       return end;     
    }
}
