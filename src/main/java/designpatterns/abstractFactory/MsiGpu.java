package designpatterns.abstractFactory;

public class MsiGpu implements Gpu {
    @Override
    public void assemble() {
        System.out.println("assemble MSI GPU");
    }
}
