package designpatterns.factoryMethod;

public class BeefBurger implements Burger{
    private String type;

    public BeefBurger(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "BeefBurger{" +
                "type='" + type + '\'' +
                '}';
    }

    @Override
    public Burger prepare() {
        return new BeefBurger(type);
    }
}
