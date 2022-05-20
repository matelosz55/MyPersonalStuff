package DependencyInjection.TraditionalApproach;

import java.util.Random;

public class Weather {
    private static Random random = new Random(System.currentTimeMillis());
    public String description;

    public Weather(){
        switch(random.nextInt(4)){
            case 0:
                this.description = "Raining";
                break;
            case 1:
                this.description = "Sunny";
                break;
            case 2:
                this.description = "Snow";
                break;
            case 3:
                this.description = "Windy";
                break;
        }
    }
}
