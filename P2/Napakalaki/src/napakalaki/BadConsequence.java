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
public class BadConsequence
{
    private String text; // para representar lo que dice un mal rollo
    private int levels, nVisibleTreasures, nHiddenTreasures;  
    /*   levels, de tipo int, para representar los niveles que se pierden.
        • nVisibleTreasures, de tipo int, para representar el número de tesoros visibles que se pierden.
        • nHiddenTreasures, de tipo int, para representar el número de tesoros ocultos que se pierden. */
    private boolean death;   // para representar un mal rollo de tipo muerte
    private ArrayList<TreasureKind> specificHiddenTreasures = new ArrayList();  // vector dinamico
    private ArrayList<TreasureKind> specificVisibleTreasures = new ArrayList();
    static final int MAXTREASURES = 10; //final indica que es de tipo constante.
    
    
    public BadConsequence(String text, int levels, int nVisible, int nHidden)
    {
        this.text=text;
        this.levels=levels;
        this.nVisibleTreasures=nVisible;
        this.nHiddenTreasures=nHidden;        
    }
    public BadConsequence(String text, boolean death)
    {
        this.text=text;
        this.death=death;
    }
    public BadConsequence(String text, int levels, ArrayList<TreasureKind> tVisible,
            ArrayList<TreasureKind> tHidden)
    {
        this.text=text;
        this.levels=levels;
        this.specificVisibleTreasures=tVisible; 
        this.specificHiddenTreasures=tHidden;
    }
    
    public ArrayList<TreasureKind> getSpecificHiddenTreasures(){
        return specificHiddenTreasures;
    }
    
    public ArrayList<TreasureKind> getSpecificVisibleTreasures(){
        return specificVisibleTreasures;
    }    
    
    public String getText()
    {
        return text;
    }
    public int getLevels()
    {
        return levels;
    }
    public int getnVisibleTreasures()
    {
        return nVisibleTreasures;
    }
    public int getnHiddenTreasures()
    {
        return nHiddenTreasures;
    }
    public boolean getDeath()
    {
        return death;
    }
    
    public String toString(){
        return "Text = " + text +
               " Levels = " + Integer.toString(levels) +
               " vTreasures = " + Integer.toString(nVisibleTreasures) +
               " hTreasures = " + Integer.toString(nHiddenTreasures) +
               " Death = " + Boolean.toString(death);
    }
    
    public boolean isEmpty()
    {
      boolean empty=false;
      if(levels==0 && death==false && nVisibleTreasures==0 && nHiddenTreasures==0 && 
              specificVisibleTreasures.size()==0 && specificHiddenTreasures.size()==0)
          empty=true;
      return empty;
    }
   
    public void substractVisibleTreasure(Treasure t)
    {
        
    }
    public void substractHiddenTreasure(Treasure t)
    {
        
    }
    
    public BadConsequence adjustToFitTreasureLists(Treasure [] v ,Treasure [] h )
    {
        return null;
    }
    
    
}
