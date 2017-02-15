/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
import GUI.*;
import java.util.ArrayList;

/**
 *
 * 
 */
public class PruebaNapakalaki {

   public static void main(String[] args)
   {
       
       Napakalaki game=Napakalaki.getInstance();
       NapakalakiView napakalakiView= new NapakalakiView();
       Dice.createInstance(napakalakiView);
       PlayerNamesCapture namesCapture=new PlayerNamesCapture(napakalakiView, true);
       ArrayList<String> names=namesCapture.getNames();
            
       game.initGame(names);
       napakalakiView.setNapakalaki(game);
       
       napakalakiView.setVisible(true);
   }     
}


