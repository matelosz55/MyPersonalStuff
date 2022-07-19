package designpatterns.singleton;

public class Singleton2 {
    public static Singleton2 instance = null;
    public String name;

    private Singleton2(){
        System.out.println("Singleton2 created");
    }

    public static synchronized Singleton2 getInstance(){
        if (instance == null){
            instance = new Singleton2();
        }
        return instance;
    }
}
