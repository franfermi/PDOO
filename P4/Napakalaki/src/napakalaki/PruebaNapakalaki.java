/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package napakalaki;
import java.util.ArrayList;
import java.util.Arrays;
/**
 *
 * @author pako
 */
public class PruebaNapakalaki {

   public static void main(String[] args){
    
      ArrayList<Monster> monstruos=new ArrayList();
      
        BadConsequence bc = new NumericBadConsequence("Pierdes 5 niveles y 3 tesoros visibles",
        5,3,0);
        Prize pz = new Prize(4,2);
        monstruos.add(new Monster("El rey de rosa",13,bc,pz));
      
        ////////////////////////////////////////////////////////////////////////
      
        bc = new SpecificBadConsequence("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta"
          ,0, new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), new ArrayList(Arrays.asList(TreasureKind.ONEHAND)));

        pz=new Prize(4,1);
        monstruos.add(new Monster("Ángeles de la noche ibicenca",14, bc, pz));
           
        
        ////////////////////////////////////////////////////////////////////////
        
        
        bc = new SpecificBadConsequence("Pierdes tu arma visible y otra oculta",
        0,new ArrayList(Arrays.asList(TreasureKind.ARMOR)),new ArrayList(Arrays.asList(TreasureKind.ARMOR)));
        
        pz = new Prize(2,1);
        monstruos.add(new Monster("Byakhees de bonanza", 8, bc, pz));
        
        
        ////////////////////////////////////////////////////////////////////////
        
        bc= new SpecificBadConsequence("Embobados con el lindo primigenio te descartas de tu casco visible",
        0,new ArrayList(Arrays.asList(TreasureKind.HELMET)), new ArrayList());
        
        pz = new Prize(1,1);
        
        monstruos.add(new Monster("Chibithulhu", 2, bc, pz));
        
        
        //////////////////////////////////////////////////////////////////////
        
        bc= new SpecificBadConsequence("El primordial bostezo contagioso. Pierdes el calzado visible",
        0,new ArrayList(Arrays.asList(TreasureKind.SHOES)), new ArrayList());
        
        pz=new Prize(1,1);
        
        monstruos.add(new Monster("El sopor de Dunwich", 2, bc,pz));
        
        
        //////////////////////////////////////////////////////////////////////
        
        bc=new NumericBadConsequence("Pierde todos tus tesoros visibles ", 0, 5,0);
        
        pz=new Prize(3,1);
        
        monstruos.add(new Monster("El gorron en el umbral",10,bc,pz));
        
        ///////////////////////////////////////////////////////////////////////
        
        
        bc=new SpecificBadConsequence("Pierdes la armadura visible",0,new ArrayList(Arrays.asList(TreasureKind.ARMOR)),new ArrayList());
        
        pz=new Prize(2,1);
        
        monstruos.add(new Monster("H.P. Munchcraft", 6, bc, pz));
        
        ////////////////////////////////////////////////////////////////////////
        
        bc=new SpecificBadConsequence("Sientes bichos bajo la ropa. Descarta la armadura visible", 0,new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList());
        pz=new Prize(1,1);
        
        monstruos.add(new Monster("Bichgooth", 2, bc, pz));
        
        ///////////////////////////////////////////////////////////////////////
        
        
        bc=new NumericBadConsequence("Toses los pulmones y pierdes 2 niveles", 2, 0, 0);
        pz=new Prize(1,1);
        monstruos.add(new Monster("La que redacta las tinieblas", 2, bc, pz));
        
     /////////////////////////////////////////////////////////////////////////
        
        bc=new DeathBadConsequence("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto", 0,
        true);
        
        pz=new Prize(2,1);
        monstruos.add(new Monster("Los Hondos",8, bc, pz));
        
        ///////////////////////////////////////////////////////////////////////
        
        bc=new NumericBadConsequence("Pierdes 2 niveles y 2 ocultos.", 0, 0,2);
        
        pz=new Prize(2,1);
        
        monstruos.add(new Monster("Semillas Cthulhu", 4, bc, pz));
        
        /////////////////////////////////////////////////////////////////////
        
        bc=new SpecificBadConsequence("Te intentas escaquear.Pierdes una mano visible.",0,new ArrayList(Arrays.asList(TreasureKind.ONEHAND)),new ArrayList());
        pz=new Prize(2,1);
        
        monstruos.add(new Monster("Dameargo", 1, bc, pz));
        
        
        ///////////////////////////////////////////////////////////////////////
        
        bc=new NumericBadConsequence("Da mucho asquito. Pierdes 3 niveles ",3,0,0 );
        pz=new Prize(1,1);
        
        monstruos.add(new Monster("Pollipolipo volante", 3,bc,pz));
        
        ///////////////////////////////////////////////////////////////////////
        
        bc=new DeathBadConsequence("No le hace gracia que pronuncien mal su nombre. Estas muerto", 0, true);
        pz=new Prize(1,1);
        
        monstruos.add(new Monster("YskhtihyssgGoth", 12, bc, pz));
        
        //////////////////////////////////////////////////////////////////////
        
        bc=new DeathBadConsequence("La familia te atrapa. Estas muerto" , 0, true);
        pz=new Prize(4,1);
        
        monstruos.add(new Monster("La familia feliz", 1, bc, pz));
        
        ///////////////////////////////////////////////////////////////////////
        
        bc=new SpecificBadConsequence("La quinta directiva primaria te obliga a perder 2 niveles un tesoro 2 manos visible", 2
        , new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS)), new ArrayList());
        
        pz=new Prize(2,1);
        
        monstruos.add(new Monster("Roboggoth", 8,bc,pz));
        
        ///////////////////////////////////////////////////////////////////////
        
        bc=new SpecificBadConsequence("Te asusta en la noche. Pierdes un casco visible.", 0,new ArrayList(Arrays.asList(TreasureKind.HELMET))
                ,new ArrayList());
        
        pz=new Prize(1,1);
        monstruos.add(new Monster("El espia", 5,bc,pz));
        
        ///////////////////////////////////////////////////////////////////////
        
        bc=new NumericBadConsequence("Menudo susto te llevas.Pierdes 2 niveles y 5 tesoros visibles.", 2,5,0);
        pz=new Prize(1,1);
        monstruos.add(new Monster("El Lenguas", 20, bc, pz));
        
        /////////////////////////////////////////////////////////////////////
        
        bc=new SpecificBadConsequence("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.",3,
                new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS)), new ArrayList());
        
        pz=new Prize(1,1);
        monstruos.add(new Monster("Bicefalo", 20, bc, pz));
   }     
}


