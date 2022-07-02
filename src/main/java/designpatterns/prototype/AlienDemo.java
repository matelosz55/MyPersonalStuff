package designpatterns.prototype;

public class AlienDemo {
    public static void main(String[] args) {
        Alien alien = new Alien("Karol", 1.80, 77);
        System.out.println(alien);

        Alien alien1 = (Alien) alien.createClone();
        Alien alien2 = (Alien) alien.createClone();
        Alien alien3 = (Alien) alien.createClone();

        alien1.setName("Mati");
        alien2.setName("Pawel");
        alien3.setName("Rafal");

        System.out.println(alien1);
        System.out.println(alien2);
        System.out.println(alien3);
    }
}
