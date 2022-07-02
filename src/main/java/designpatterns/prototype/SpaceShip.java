package designpatterns.prototype;

public class SpaceShip implements ProtoType{
    private String type;
    private Integer crew;
    private Double fuel;
    private Alien captain;

    public SpaceShip(String type, Integer crew, Double fuel, Alien captain) {
        this.type = type;
        this.crew = crew;
        this.fuel = fuel;
        this.captain = captain;
    }

    @Override
    public String toString() {
        return "SpaceShip{" +
                "type='" + type + '\'' +
                ", crew=" + crew +
                ", fuel=" + fuel +
                ", captain=" + captain +
                '}';
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getCrew() {
        return crew;
    }

    public void setCrew(Integer crew) {
        this.crew = crew;
    }

    public Double getFuel() {
        return fuel;
    }

    public void setFuel(Double fuel) {
        this.fuel = fuel;
    }

    public Alien getCaptain() {
        return captain;
    }

    public void setCaptain(Alien captain) {
        this.captain = captain;
    }

    @Override
    public ProtoType createClone() {
        return new SpaceShip(type, crew, fuel, (Alien) captain.createClone());
    }
}
