package DependencyInjection.TraditionalApproach;

public class Window {
    private Weather weather;

    public Window(){
        this.weather = new Weather();
    }

    public void lookOut(){
        System.out.println(this.weather.description);
    }

}
