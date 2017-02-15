
package napakalaki;

/**
 *
 * @author Francisco Fernández
 */
public class Monster {
    private String nombre;
    private int combatLevel;
    BadConsequence bc;
    Prize pc;
    
    public Monster(String name, int level, BadConsequence bc, Prize price){
        this.nombre=name;
        this.combatLevel=level;
    }
    public String getNombre(){
        return this.nombre;
    }
    public int getCombatLevel(){
        return this.combatLevel;
    }
    public BadConsequence getBc(){
        return bc;
    }
    public Prize getPc(){
        return pc;
    }
    public String toString(){
        return "Nombre = " + nombre + "CombatLevel = " + Integer.toString(combatLevel);
    }
    
}
