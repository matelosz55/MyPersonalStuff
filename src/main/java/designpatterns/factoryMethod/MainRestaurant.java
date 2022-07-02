package designpatterns.factoryMethod;

public class MainRestaurant {
    public static void main(String[] args) {
        Restaurant beef = new BeefBurgerRestaurant();
        Burger beefBurger = beef.orderBurger();

        Restaurant veggie = new VeggieBurgerRestaurant();
        Burger veggieBurger = veggie.orderBurger();

        System.out.println(beefBurger);
        System.out.println(veggieBurger);
    }
}
