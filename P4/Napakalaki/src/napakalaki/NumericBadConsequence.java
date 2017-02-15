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
public class NumericBadConsequence extends BadConsequence{
    final static int MAXTREASURES = 10; //final indica que es de tipo constante.
    private int nVisibleTreasures; //=MAXTREASURES
    private int nHiddenTreasures; 
    
    public NumericBadConsequence(String text, int levels, int nVisible, int nHidden)
    {
        super(text, levels, nVisible, nHidden);
    }
    
    @Override
    public boolean isEmpty(){
        return this.nVisibleTreasures == 0 && this.nHiddenTreasures == 0;
    }
    
    public int getnVisibleTreasures()
    {
        return nVisibleTreasures;
    }
    public int getnHiddenTreasures()
    {
        return nHiddenTreasures;
    }
    
    @Override
    public void substractVisibleTreasure(Treasure t)
    {
        if(this.nVisibleTreasures > 0)
            this.nHiddenTreasures--;
    }

    @Override
    public void substractHiddenTreasure(Treasure t)
    {
        if(this.nHiddenTreasures > 0)
            this.nHiddenTreasures--;
    }
    
    @Override
    public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v ,ArrayList<Treasure> h ){
        ArrayList<TreasureKind> treasuresVisible = new ArrayList();
        ArrayList<TreasureKind> treasuresHidden = new ArrayList();
        NumericBadConsequence bad=new NumericBadConsequence("",1,0,0);
        int nVis,nHid;
        
        if (nVisibleTreasures>0 || nHiddenTreasures>0)
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

        bad=new NumericBadConsequence(text, 0, nVis,nHid);

            }
        return bad;
    }
    
    @Override
    public String toString(){
        return "Tesoros visibles = " + this.nVisibleTreasures +
                "Tesoros ocultos = " + this.nHiddenTreasures;
    }
}
