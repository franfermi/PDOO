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
        this.specificHiddenTreasures=new ArrayList();
        this.specificVisibleTreasures=new ArrayList();
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
    
    @Override
    public String toString(){
        return "Text = " + text +
               " Levels = " + Integer.toString(levels) +
               " vTreasures = " + Integer.toString(nVisibleTreasures) +
               " hTreasures = " + Integer.toString(nHiddenTreasures) +
                "specific visible = "+this.specificVisibleTreasures +
                "specific hidden = "+this.specificHiddenTreasures +
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
   
    public void substractVisibleTreasure(Treasure t)//MODIFICADO    
    {
        specificVisibleTreasures.remove(t.getType());
        nVisibleTreasures--;
    }
    public void substractHiddenTreasure(Treasure t)//MODIFICADO 
    {
        specificHiddenTreasures.remove(t.getType());
        nHiddenTreasures--;
    }
    
    public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v ,ArrayList<Treasure> h )
    {
           System.out.println("Antes de ajustar: "+this.toString());
            //creamos dos nuevos ArrayList para el BadConsequence ¡ADECUADO!
            ArrayList<TreasureKind> treasuresVisible = new ArrayList();
            ArrayList<TreasureKind> treasuresHidden = new ArrayList();
            BadConsequence bad=new BadConsequence("",1,0,0);
            int nVis,nHid;

            if(!this.specificHiddenTreasures.isEmpty()  || !this.specificVisibleTreasures.isEmpty()  )
            {
                if ( !v.isEmpty())
                {
                    for (Treasure t: v)
                    {
                        //Si no contiene el tipo de tesoro t lo agregamos al nuevo ArrayList de visibles
                        if (!treasuresVisible.contains(t.getType()))   //.contains() --> metodo propio de ArrayList
                            treasuresVisible.add(t.getType());           //Agregamos el el nuevo tipo de tesoro al nuevo ArrayList
                    
                     }
                }
                if ( !h.isEmpty())
                {

                    //Recorremos los tesoros ocultos
                    for (Treasure t: h)
                    {
                        //Si no contiene el tipo de tesoro t lo agregamos al nuevo ArrayList de ocultos
                        if (!treasuresHidden.contains(t.getType()))    //.contains() --> metodo propio de ArrayList
                            treasuresHidden.add(t.getType());
                        
                    }

                }
                bad = new BadConsequence(text, 0, treasuresVisible, treasuresHidden);

            }
            
            else if (nVisibleTreasures>0 || nHiddenTreasures>0)
            {
                 if(nVisibleTreasures>v.size())  /*//Si la pérdida de tesoros no supera a los tesoros del jugador
                //se queda con los tesosos originales*/
                    nVis=v.size();
                else
                    nVis=nVisibleTreasures;


                if(nHiddenTreasures>h.size())
                    nHid=h.size();
                else
                    nHid=nHiddenTreasures;

       bad=new BadConsequence(text, 0, nVis,nHid);

            }
        //Actualizamos el nuevo mal rollo
        System.out.println("Después de ajustar: "+bad.toString());
        return bad;
    }
}