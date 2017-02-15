/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;

/**
 *
 * @author pako
 */
public class DeathBadConsequence extends NumericBadConsequence{
    private boolean death;   // para representar un mal rollo de tipo muerte
    
    public DeathBadConsequence(String text, int levels, boolean death)
    {
        super(text, levels, MAXTREASURES, MAXTREASURES);
        this.death=true;
    }
    
    public boolean getDeath()
    {
        return death;
    }
    
    @Override
    public String toString(){
        return "Muerte = " + this.death;
    } 
}
