package designpatterns.factoryMethod;

public class VeggieBurger implements Burger{
    private String type;

    public VeggieBurger(String type) {
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
        return "VeggieBurger{" +
                "type='" + type + '\'' +
                '}';
    }

    @Override
    public Burger prepare() {
        return new VeggieBurger(type);
    }
}
