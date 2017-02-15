/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author Victor Vallecillo Morilla
 */
public abstract class BadConsequence
{
    String text; // para representar lo que dice un mal rollo
    int levels=Player.MAXLEVEL;    
    
    public BadConsequence(String text, int levels){
        this.text=text;
        this.levels=levels;
    }
   
    public BadConsequence(String text, int levels, int nVisible, int nHidden)
    {  
    }
    
    public BadConsequence(String text, int levels, ArrayList<TreasureKind> tVisible,
            ArrayList<TreasureKind> tHidden)
    {
    }
    
    public BadConsequence(String text, boolean death)
    {
    }
   
    public String getText()
    {
        return text;
    }
    public int getLevels()
    {
        return levels;
    }
    
    
    public void substractVisibleTreasure(Treasure t){}
    
    public void substractHiddenTreasure(Treasure t){}
    
    public boolean isEmpty(){
        return false;
    }
    
    public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v ,ArrayList<Treasure> h )
    {
        return null;
    }
  
    
    public String toString(){
        return " Text = " + text +
               " Levels = " + Integer.toString(levels);
    }
    
}
