  /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
/**
 *
 * @author Victor Vallecillo Morilla
 */
public class Prize 
{
    private int treasures, levels;
    
    Prize(int t, int l)
    {
        this.treasures=t;
        this.levels=l;
        
    }
    public int getTreasures()
    {
        return treasures;
    }
    public int getLevels()
    {
        return levels;
    }
    
    public String toString()
    {
        return "Treasures = " + Integer.toString(treasures) 
                + " Levels = " + Integer.toString(levels);
    }
    
}
