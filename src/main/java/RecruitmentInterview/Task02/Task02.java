package RecruitmentInterview.Task02;

public class Task02 {

    public static String solve(int width, int length, int height, int mass) {
        int volume = width * length * height;
        String results = null;
        if (volume >= 1000000 || (width >= 150 || length >= 150 || height >= 150) && mass >= 20) {
            results = "rejected";
        } else if (volume >= 1000000 || (width >= 150 || length >= 150 || height >= 150) || mass >= 20){
            results ="special";
        } else {
            results = "standard";
        }

            return results;
    }

    public static void main(String[] args) {

    }
}
