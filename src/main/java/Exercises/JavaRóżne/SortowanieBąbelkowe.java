package Exercises.JavaRóżne;

import java.util.Arrays;

public class SortowanieBąbelkowe {

    public static int[] sort(int[] tab) {
        for (int i = 0; i < tab.length - 1; i++) {
            for (int j = 0; j < tab.length - 1; j++) {
                if (tab[j] > tab[j + 1]) {
                    int w = tab[j];
                    tab[j] = tab[j + 1];
                    tab[j + 1] = w;
                }
            }

        }
        return tab;
    }

    public static void main(String[] args) {
        int[] tab = {33, 11, 5, 2, 3, 12};
        System.out.println(Arrays.toString(sort(tab)));
    }

}
