//Napisz metodę findMissingElement, która jako argument przyjmuje tablicę liczb
//całkowitych z zakresu od 0 do n. Liczby w tablicy nie powtarzają się.
//W tablicy brakuje jednego elementu z zakresu <0, n>.
//Metoda findMissingElement powinna zwrócić brakujący element.

package TasksCareerLab;

import java.util.Arrays;

public class Task01 {
    public static void main(String[] args) {
        int[] someArray = {0, 1, 2, 3, 9, 8, 7, 6, 5, 10};

        System.out.println(findMissingElement(someArray));
    }

    public static Integer findMissingElement(int[] array) {

        int missingEl = 0;

        Arrays.sort(array);
        System.out.println(Arrays.toString(array));

//Sortowanie babelkowe:

//        for (int i = 0; i < array.length - 1; i++) {
//            for (int j = 0; j < array.length - 1; j++) {
//                if (array[j] > array[j + 1]) {
//                    int higher = array[j];
//                    array[j] = array[j + 1];
//                    array[j + 1] = higher;
//                }
//            }
//        }

        for (int i = 0; i < array.length; i++) {
            if (array[i] + 1 != array[i + 1]){
                missingEl = array[i] + 1;
                break;
            }
        }


        return missingEl;
    }
}
