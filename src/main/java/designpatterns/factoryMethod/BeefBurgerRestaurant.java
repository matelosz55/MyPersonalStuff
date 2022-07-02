package designpatterns.factoryMethod;

public class BeefBurgerRestaurant extends Restaurant{
    @Override
    public Burger createBurger() {
        return new BeefBurger("beef");
    }
}
