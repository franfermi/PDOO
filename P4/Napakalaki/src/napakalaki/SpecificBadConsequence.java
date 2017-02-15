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
 * @author pako
 */
public class SpecificBadConsequence extends BadConsequence{
    ArrayList<TreasureKind> specificHiddenTreasures = new ArrayList(); 
    ArrayList<TreasureKind> specificVisibleTreasures = new ArrayList();
    
    public SpecificBadConsequence(String text, int levels, ArrayList<TreasureKind> tVisible, ArrayList<TreasureKind> tHidden)
    {
        super(text, levels, tVisible, tHidden);
    }
    
    public ArrayList<TreasureKind> getSpecificHiddenTreasures(){
        return specificHiddenTreasures;
    }
    
    public ArrayList<TreasureKind> getSpecificVisibleTreasures(){
        return specificVisibleTreasures;
    }
    
    @Override
    public boolean isEmpty()
    {
      return this.specificVisibleTreasures.isEmpty() && this.specificHiddenTreasures.isEmpty();
    }
    
    @Override
    public void substractVisibleTreasure(Treasure t)
    {
      specificVisibleTreasures.remove(t.getType());
    }

    @Override
    public void substractHiddenTreasure(Treasure t)
    {
      specificHiddenTreasures.remove(t.getType());
    }
    
    @Override
    public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v ,ArrayList<Treasure> h ){
        ArrayList<TreasureKind> treasuresVisible = new ArrayList();
        ArrayList<TreasureKind> treasuresHidden = new ArrayList();
        SpecificBadConsequence bad=new SpecificBadConsequence("",1,new ArrayList(),new ArrayList());   
        
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
                bad = new SpecificBadConsequence(text, 0, treasuresVisible, treasuresHidden);
            }
            return bad;
    }
    
    @Override
    public String toString(){
        return "Tesoros visibles especificos =" + this.specificVisibleTreasures +
                "Tesoros ocultos especificos =" + this.specificHiddenTreasures;
    }
}
