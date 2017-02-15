package napakalaki;
import java.util.ArrayList;
import java.util.Iterator;
/**
 *
 * @author Francisco Fernández
 */
public class BadConsequence {
    private String text;
    private int levels;
    private int nVisibleTreasures;
    private int nHiddenTreasures;
    private boolean death;
        
    private ArrayList<TreasureKind>specificHiddenTreasures=new ArrayList();
    private ArrayList<TreasureKind>specificVisibleTreasures=new ArrayList();
   
    public BadConsequence(String text, int levels, ArrayList<TreasureKind> tVisible, 
            ArrayList<TreasureKind> tHidden){
        this.text=text;
        this.levels=levels;
        this.specificVisibleTreasures=tVisible;
        this.specificHiddenTreasures=tHidden;
    }
    
    public BadConsequence(String text, int levels, int nVisible, int nHidden){
        this.text=text;
        this.levels=levels;
        this.nVisibleTreasures=nVisible;
        this.nHiddenTreasures=nHidden;
    }
    public BadConsequence(String text, boolean death){
        this.text=text;
        this.death=death;
    }
    public String getText(){
        return this.text;
    }
    public int getLevels(){
        return this.levels;
    }
    public int getnVisibleTreasures(){
        return this.nVisibleTreasures;
    }
    public int getnHiddenTreasures(){
        return this.nHiddenTreasures;
    }
    public boolean getDeath(){
        return this.death;
    }
    public String toString(){
        return "Text = " + text + "levels = " + Integer.toString(levels) + "nVisibleTreasures" 
                + Integer.toString(nVisibleTreasures) + "nHiddenTreasures" + Integer.toString(nHiddenTreasures)
                + "death" + death;
    }
}
