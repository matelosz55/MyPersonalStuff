package DependencyInjection.TraditionalApproach;

import java.util.ArrayList;
import java.util.List;

public class House {

    List<Window> windowList = new ArrayList<>();

    public House(){
        windowList.add(new Window());
        windowList.add(new Window());
        windowList.add(new Window());
        windowList.add(new Window());
    }

    public void look(){
        for(Window window : windowList){
            window.lookOut();
        }
    }

    public static void main(String[] args) {
        House house = new House();
        house.look();
    }
}

