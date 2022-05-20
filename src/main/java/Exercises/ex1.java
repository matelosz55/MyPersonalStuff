package Exercises;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;
import java.util.Set;

public class ex1 {
    public static void main(String[] args) {
        int[] tab = {33, 11, 5, 2, 3, 12};
        for (int i = 0; i < tab.length - 1; i++) {
            for (int j = 0; j < tab.length - 1; j++) {
                if (tab[j] > tab[j + 1]) {
                    int w = tab[j];
                    tab[j] = tab[j + 1];
                    tab[j + 1] = w;
                }
            }
        }

/*
        for (int i = 1; i <= 100; i++) {
            if(i % 3 == 0 & i % 5 != 0){
                System.out.println("fizz");
            } else if(i % 5 == 0 & i % 3 != 0){
                System.out.println("buzz");
            } else if(i % 3 == 0 & i % 5 == 0){
                System.out.println("fizzbuzz");
            } else {
                System.out.println(i);
            }

        }

 */

        int w = 10;
        int silnia = 1;
        for (int i = 1; i <= w; i++) {
            silnia = silnia * i;
        }
        System.out.println(silnia);

        System.out.println(fibonacci(4));
        System.out.println(fibonacci(5));
        System.out.println(fibonacci(6));

    }

    public static int fibonacci(int n) {
        if (n <= 2) {
            return 1;
        }
        return fibonacci(n - 1) + fibonacci(n - 2);
    }



}




