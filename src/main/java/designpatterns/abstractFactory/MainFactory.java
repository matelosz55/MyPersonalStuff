package designpatterns.abstractFactory;

public class MainFactory {

    public static void main(String[] args) {
        Company msi = new MsiManufacturer();
        Gpu msiGpu = msi.createGpu();
        Monitor msiMonitor = msi.createMonitor();

        Company asus = new AsusManufacturer();
        Gpu asusGpu = asus.createGpu();
        Monitor asusMonitor = asus.createMonitor();

        msiGpu.assemble();
        msiMonitor.assemble();

        asusGpu.assemble();
        asusMonitor.assemble();

    }

}
