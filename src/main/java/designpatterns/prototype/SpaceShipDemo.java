package designpatterns.prototype;

public class SpaceShipDemo {
    public static void main(String[] args) {
        SpaceShip ufo = new SpaceShip("round", 125, .99, new Alien("Alien", 2.56, 121));
        System.out.println(ufo);

        SpaceShip ufo2 = (SpaceShip) ufo.createClone();
        ufo2.setType("arrow");
        ufo2.setCrew(144);
        ufo2.setCaptain(new Alien("Master Alien", 3.21, 181));
        System.out.println(ufo2);


        SpaceShip ufo3 = (SpaceShip) ufo.createClone();
        ufo3.getCaptain().setName("regular Alien");
        System.out.println(ufo3);
    }
}
