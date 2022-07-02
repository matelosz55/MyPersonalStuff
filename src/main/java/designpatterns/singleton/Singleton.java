package designpatterns.singleton;

public class Singleton {

    public static final Singleton INSTANCE = new Singleton();
    public String name;

    private Singleton(){}
}
