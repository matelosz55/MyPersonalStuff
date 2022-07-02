package designpatterns.abstractFactory;

public class AsusGpu implements Gpu {
    @Override
    public void assemble() {
        System.out.println("assemble Asus GPU");
    }
}
