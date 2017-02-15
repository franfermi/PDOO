/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
/**
 *
 * @author 
 */
public class CardDealer {
    private static CardDealer instance=null;
    private ArrayList<Monster> unusedMonsters=new ArrayList();
    private ArrayList<Monster> usedMonsters=new ArrayList();
    private ArrayList<Treasure> unusedTreasures=new ArrayList();
    private ArrayList<Treasure> usedTreasures=new ArrayList();
    
    private CardDealer(){
    }

    public ArrayList<Monster> getUnusedMonsters() {
        return unusedMonsters;
    }

    public ArrayList<Monster> getUsedMonsters() {
        return usedMonsters;
    }

    public ArrayList<Treasure> getUnusedTreasures() {
        return unusedTreasures;
    }

    public ArrayList<Treasure> getUsedTreasures() {
        return usedTreasures;
    }
    
    private void initTreasureCardDeck(){
        unusedTreasures = new ArrayList();
        
        unusedTreasures.add(new Treasure("¡Sí mi amo!", 4, TreasureKind.HELMET));
        unusedTreasures.add(new Treasure("Botas de investigación", 3, TreasureKind.SHOES));
        unusedTreasures.add(new Treasure("Capucha de Cthulhu", 3, TreasureKind.HELMET));
        unusedTreasures.add(new Treasure("A prueba de babas", 2, TreasureKind.ARMOR));
        unusedTreasures.add(new Treasure("Botas de lluvia ácida", 1, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Casco minero", 2, TreasureKind.HELMET));
        unusedTreasures.add(new Treasure("Ametralladora Thompson", 4, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Camiseta de la UGR", 1, TreasureKind.ARMOR));
        unusedTreasures.add(new Treasure("Clavo de rail ferroviario", 3, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Cuchillo de sushi arcano", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Fez alópodo", 3, TreasureKind.HELMET));
        unusedTreasures.add(new Treasure("Hacha prehistórica", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("El aparato del Pr. Tesla", 4, TreasureKind.ARMOR));
        unusedTreasures.add(new Treasure("Gaita", 4, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Insecticida", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Escopeta de 3 cañones", 4, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Garabato Mistico", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("La rebeca metálica", 2, TreasureKind.ARMOR));
        unusedTreasures.add(new Treasure("Lanzallamas", 4, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Necro-comicón", 1, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Necronomicón", 5, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Linterna a 2 manos", 3, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Necro-gnomicón", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Necrotelecom", 2, TreasureKind.HELMET));        
        unusedTreasures.add(new Treasure("Mazo de los antiguos", 3, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Necro-playboycon", 3, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Porra preternatural", 2, TreasureKind.ONEHAND));
        unusedTreasures.add(new Treasure("Shogulador", 1, TreasureKind.BOTHHANDS));
        unusedTreasures.add(new Treasure("Varita de atizamiento", 3, TreasureKind.ONEHAND));       
        unusedTreasures.add(new Treasure("Tentácula de pega", 2, TreasureKind.HELMET));
        unusedTreasures.add(new Treasure("Zapato deja-amigos", 1, TreasureKind.SHOES));

    }
    
    private void initMonsterCardDeck(){
        unusedMonsters = new ArrayList();
        BadConsequence bc;
        Prize pz;
      
        ////////////////////////////////////////////////////////////////////////
      
        bc = new BadConsequence("Pierdes 5 niveles y 3 tesoros visibles", 5,3,0);
        pz = new Prize(4,2);
        unusedMonsters.add(new Monster("El rey de rosa",13,bc,pz ));
      
        ////////////////////////////////////////////////////////////////////////
      
        bc = new BadConsequence("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta"
          ,0, new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), new ArrayList(Arrays.asList(TreasureKind.ONEHAND)));
        
        pz=new Prize(4,1);
        unusedMonsters.add(new Monster("Ángeles de la noche ibicenca",14, bc, pz));
           
        
        ////////////////////////////////////////////////////////////////////////
        
        
        bc = new BadConsequence("Pierdes tu arma visible y otra oculta",
        0,new ArrayList(Arrays.asList(TreasureKind.ARMOR)),new ArrayList(Arrays.asList(TreasureKind.ARMOR)));
        pz = new Prize(2,1);
        unusedMonsters.add(new Monster("Byakhees de bonanza", 8, bc, pz));
        
        
        ////////////////////////////////////////////////////////////////////////
        
        bc= new BadConsequence("Embobados con el lindo primigenio te descartas de tu casco visible",
        0,new ArrayList(Arrays.asList(TreasureKind.HELMET)), new ArrayList());
        pz = new Prize(1,1);
        unusedMonsters.add(new Monster("Chibithulhu", 2, bc, pz));
        
        
        ////////////////////////////////////////////////////////////////////////
        
        bc= new BadConsequence("El primordial bostezo contagioso. Pierdes el calzado visible",
        0,new ArrayList(Arrays.asList(TreasureKind.SHOES)), new ArrayList());
        pz=new Prize(1,1); 
        unusedMonsters.add(new Monster("El sopor de Dunwich", 2, bc,pz));

        ////////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("Pierde todos tus tesoros visibles ", 0, 5,0);
        pz=new Prize(3,1);
        unusedMonsters.add(new Monster("El gorron en el umbral",10,bc,pz));
        
        ////////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("Pierdes la armadura visible",0,new ArrayList(Arrays.asList(TreasureKind.ARMOR)),new ArrayList());
        pz=new Prize(2,1);
        unusedMonsters.add(new Monster("H.P. Munchcraft", 6, bc, pz));
        
        ////////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("Sientes bichos bajo la ropa. Descarta la armadura visible", 0,new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList());
        pz=new Prize(1,1);
        unusedMonsters.add(new Monster("Bichgooth", 2, bc, pz));
        
        ////////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("Toses los pulmones y pierdes 2 niveles", 2, 0, 0);
        pz=new Prize(1,1);
        unusedMonsters.add(new Monster("La que redacta las tinieblas", 2, bc, pz));
        
        ////////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto",
        true);
        pz=new Prize(2,1);
        unusedMonsters.add(new Monster("Los Hondos",8, bc, pz));
        
        ////////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("Pierdes 2 niveles y 2 ocultos.", 0, 0, 2);
        pz=new Prize(2,1);
        unusedMonsters.add(new Monster("Semillas Cthulhu", 4, bc, pz));
        
        ////////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("Te intentas escaquear.Pierdes una mano visible.",0,new ArrayList(Arrays.asList(TreasureKind.ONEHAND)),new ArrayList());
        pz=new Prize(2,1);
        unusedMonsters.add(new Monster("Dameargo", 1, bc, pz));
        
        ////////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("Da mucho asquito. Pierdes 3 niveles ",3,0,0 );
        pz=new Prize(1,1);
        unusedMonsters.add(new Monster("Pollipolipo volante", 3,bc,pz));
        
        ////////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("No le hace gracia que pronuncien mal su nombre. Estas muerto", true);
        pz=new Prize(1,1);
        unusedMonsters.add(new Monster("YskhtihyssgGoth", 12, bc, pz));
        
        ////////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("La familia te atrapa. Estas muerto" ,true);
        pz=new Prize(4,1);
        unusedMonsters.add(new Monster("La familia feliz", 1, bc, pz));
        
        ////////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("La quinta directiva primaria te obliga a perder 2 niveles un tesoro 2 manos visible", 2, 
                new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS)), new ArrayList());
        pz=new Prize(2,1);
        unusedMonsters.add(new Monster("Roboggoth", 8,bc,pz));
        
        ///////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("Te asusta en la noche. Pierdes un casco visible.", 0,new ArrayList(Arrays.asList(TreasureKind.HELMET))
                ,new ArrayList());
        pz=new Prize(1,1);
        unusedMonsters.add(new Monster("El espía", 5,bc,pz));
        
        ///////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("Menudo susto te llevas.Pierdes 2 niveles y 5 tesoros visibles.", 2,5,0);
        pz=new Prize(1,1);
        unusedMonsters.add(new Monster("El Lenguas", 20, bc, pz));
        
        /////////////////////////////////////////////////////////////////////
        
        bc=new BadConsequence("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.",3,
                new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS)), new ArrayList());
        pz=new Prize(1,1);
        unusedMonsters.add(new Monster("Bicéfalo", 20, bc, pz));
        
    }
    
    private void shuffleTreasures(){
        Collections.shuffle(unusedTreasures);
    }
    
    private void shuffleMonsters(){
        Collections.shuffle(unusedMonsters);
    }
    
    public static CardDealer getInstance()
    {
        if(instance==null)
            instance=new CardDealer();
        
        return instance;   
    }
    
    public Treasure nextTreasure(){   // MODIFICADO COPY
        //1- Comprobamos si el mazo de cartas sin usar esta vacio
        if (this.unusedTreasures.isEmpty()) 
        {            
            //Si esta vacio recorremos las cartas usadas y las convertimos a sin usar
            //la agregamos al mazo de cartas -> unusedTreasures
            for (Treasure t: this.usedTreasures) {
                this.unusedTreasures.add(t);
            }            
            //Barajamos el mazo con el metodo siguiente
            shuffleTreasures();
            
            //Limpiamos el mazo de descartes
            this.usedTreasures.clear(); //clear -> Removes all of the elements from this list        
        } 
        //2-
        //Sacamos la primera carta del mazo de cartas sin usar
        Treasure t = this.unusedTreasures.get(0);        
        //Metemos la carta en el mazo de cartas usadas
        this.usedTreasures.add(t);        
        //Eliminamos la carta del mazo de cartas sin usar
        this.unusedTreasures.remove(t);        
        //Mostramos la carta
        return t;
    }
    
    public Monster nextMonster(){   // MODIFICADO COPY
        //Comprobamos si el mazo de cartas sin usar esta vacio
        if (this.unusedMonsters.isEmpty())
        {            
            //Si esta vacio recorremos las cartas usadas y las convertimos a sin usar
            //la agregamos al mazo de cartas -> unusedMonsters
            for (Monster m: this.usedMonsters) {
                this.unusedMonsters.add(m);
            }            
            //Barajamos el mazo con el metodo siguiente
            shuffleMonsters();
            
            //Limpiamos el mazo de descartes
            this.usedMonsters.clear(); ////clear -> Removes all of the elements from this list         
        }        
        //Sacamos la primera carta del mazo de cartas sin usar
        Monster m = this.unusedMonsters.get(0);        
        //Metemos la carta en el mazo de cartas usadas
        this.usedMonsters.add(m);        
        //Eliminamos la carta del mazo de cartas sin usar
        this.unusedMonsters.remove(m);        
        
        return m;
    }
    
    public void giveTreasureBack(Treasure t){
        this.usedTreasures.add(t);
    }
    
    public void giveMonsterBack(Monster m){
        this.usedMonsters.add(m);
    }
    
    public void initCards()
    {
        this.initTreasureCardDeck();
        this.initMonsterCardDeck();
    }
    
    
}
