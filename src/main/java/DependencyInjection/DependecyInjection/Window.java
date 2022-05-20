package DependencyInjection.DependecyInjection;

public class Window {
    private Weather weather;

    public Window(){
        this.weather = new Weather();
    }

    public void lookOut(){
        System.out.println(this.weather.description);
    }

    public Window(Weather weather) {
        this.weather = weather;
    }
}
