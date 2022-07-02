package designpatterns.singleton;

public class SingletonTest {
    public static void main(String[] args) {
        Singleton sA = Singleton.INSTANCE;
        sA.name = "SingletonA";

        Singleton sB = Singleton.INSTANCE;
        sB.name = "SingletonB";

        System.out.println(sA.name);
        System.out.println(sB.name);

        Singleton2 sC = Singleton2.getInstance();
        sC.name = "SingletonC";

        Singleton2 sD = Singleton2.getInstance();
        sD.name = "SingletonD";


        System.out.println(sC.name);
        System.out.println(sD.name);
    }
}
