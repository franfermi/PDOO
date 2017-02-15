/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
import java.util.ArrayList;
//MODIFICADO
import java.util.Random;
/**
 *
 * @author 
 */
public class Napakalaki
{
    private static  Napakalaki instance = null;
    private Monster currentMonster;
    private CardDealer dealer=CardDealer.getInstance(); 
    private ArrayList<Player> players;
    private Player currentPlayer;
    
    private Napakalaki()
    {    
        currentPlayer=null;
        currentMonster=null;
        dealer=CardDealer.getInstance();
        players=new ArrayList();
    }
    
    public static Napakalaki getInstance() {
       if(instance==null)
               instance=new Napakalaki();
       return instance;
    }
    //MODIFICADO
    private void initPlayers(ArrayList<String> names){
        players = new ArrayList();
        
        for(String n : names)
            players.add(new Player(n));
    }
    //MODIFICADO
    private Player nextPlayer(){
        int sigIndex;
        int totalPlayers=players.size();
        Player nextPlayer;
                
        if(this.currentPlayer == null){
            Random rnd = new Random();
            sigIndex = rnd.nextInt(totalPlayers);
            nextPlayer=players.get(sigIndex);
        }
        else{
            int currentPlayerIndex = this.players.indexOf(this.currentPlayer); //Duda
            
            /*if(currentPlayerIndex == totalPlayers - 1){
                sigIndex = 0;
            }
            else{
                sigIndex = currentPlayerIndex + 1;
            }*/
            int sig=(currentPlayerIndex+1)%players.size();
              nextPlayer = this.players.get(sig);
        }
        
      
        
       // this.currentPlayer = nextPlayer;
        
        return nextPlayer;       
    }
    //MODIFICADO
    private boolean nextTurnAllowed(){
      
        boolean allowed=true;

       if (this.currentPlayer == null) {
            allowed = true;
        } else {
            allowed = this.currentPlayer.validState();
        }
        
        return allowed;
    }
    //MODIFICADO
    private void setEnemies()
    {  //Modificado
         Random r = new Random();

        int tope=this.players.size();  //tenemos el tope de jugadores
        int indexEnemy ;
        
        for(Player p : players)
        {
            indexEnemy= r.nextInt(tope);   //aqui creamos el random ENTERO
            
            while(p.getName()==players.get(indexEnemy).getName())  // si son iguales, entramos hasta que sean diferente
            {
               indexEnemy= r.nextInt(tope);
                 //p.setEnemy(players.get(indexEnemy)); 
            }
            p.setEnemy(players.get(indexEnemy));  // lo metemos en enemy
                
        }
    }
    
    public CombatResult developCombat()              //S2
    {
        CombatResult combat=currentPlayer.combat(currentMonster);
        //CardDealer.giveMonsterBack();
        dealer.giveMonsterBack(currentMonster);
        
        return combat;
        
    }
    
    public void discardVisibleTreasures(ArrayList<Treasure> treasures)    // MODIFICADO
    {
        for(Treasure t: treasures)
        {
            currentPlayer.discardVisibleTreasure(t);
            dealer.giveTreasureBack(t);
        }
        
    }

    public void discardHiddenTreasures(ArrayList<Treasure> treasures)   // MODIFICADO
    { 
        for(Treasure t: treasures)
        {
            currentPlayer.discardHiddenTreasure(t);
            dealer.giveTreasureBack(t);
        }
    }
    
    public void makeTreasuresVisible(ArrayList<Treasure> treasures)
    {
       for(Treasure t:treasures)
           currentPlayer.makeTreasureVisible(t);             // ESTE DIAGRAMA IMPLICA MODIFICAR PLAYER TB
       
    }
    
    public void initGame(ArrayList<String> players)               // MMODIFICADO
    {
                                                        
        initPlayers(players);
        setEnemies();
       
        dealer.initCards();
        
         nextTurn();
        
        
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
    
    public boolean nextTurn()             //Modificado
    {
        boolean stateOK= nextTurnAllowed();
        
        if(stateOK)
        {
            currentMonster= dealer.nextMonster();
            currentPlayer=nextPlayer();
            boolean dead=currentPlayer.isDead();           // aqui no se porque se crea una variable dead 
                                                            // MIRAR AQUI
           if(dead)
           {
               currentPlayer.initTreasures();
           }
        }
        
        return stateOK;
        
    }
    //MODIFICADO
    public boolean endOfGame(CombatResult result){
        boolean end = false;
        
        if(result == CombatResult.WINGAME)
            end = true;
       
       return end;     
    }
}
