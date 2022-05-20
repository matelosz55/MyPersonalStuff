package DependencyInjection.DependecyInjection;

import java.util.ArrayList;
import java.util.List;

public class House {

    List<Window> windowList = new ArrayList<>();
    private Weather weather;

    public House(Weather weather){
        windowList.add(new Window(weather));
        windowList.add(new Window(weather));
        windowList.add(new Window(weather));
        windowList.add(new Window(weather));
    }

    public House() {
    }

    public void look(){
        for(Window window : windowList){
            window.lookOut();
        }
    }

    public void setWeather(Weather weather){
        this.weather = weather;
    }

    public static void main(String[] args) {

        Weather weather = new Weather();
        House house = new House(weather);
        house.look();
    }


}

