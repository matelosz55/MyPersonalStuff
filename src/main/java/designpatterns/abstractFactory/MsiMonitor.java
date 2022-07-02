package designpatterns.abstractFactory;

public class MsiMonitor implements Monitor{
    @Override
    public void assemble() {
        System.out.println("assemble MSI Monitor");
    }
}
