package napakalaki;

/**
 *
 * @author Francisco Fernández
 */
public class Prize {
    private int treasures;
    private int level;
    
    public Prize(int treasures, int level){
        this.treasures=treasures;
        this.level=level;
    }
    public int getLevel(){
        return this.level;
    }
    public int getTreasures(){
        return this.treasures;
    }
    public String toString(){
        return "Treasures = " + Integer.toString(treasures) + "Niveles = " + Integer.toString(level);
    }
}
