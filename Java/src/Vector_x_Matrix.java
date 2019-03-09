import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Vector_x_Matrix {
    static private ArrayList<String> read_data(String name) {
        ArrayList<String> arrayList = new ArrayList<>();
        try {
            FileReader fr = new FileReader(name);
            BufferedReader bf = new BufferedReader(fr);
            String str;
            while ((str = bf.readLine()) != null) {
                arrayList.add(str);
            }
            bf.close();
            fr.close();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        return arrayList;
    }

    static private int[] String2IntList(String line) {
        int n = 4096;
        int[] ans = new int[n];
        String[] nums = line.split(" ");
        for(int i = 0; i < n; i++) {
            ans[i] = Integer.parseInt(nums[i]);
        }
        return ans;
    }

    static private void v_x_m(int[] v, int[][] m) {
        int n = 4096;
        int[] c = new int[n];

        for(int j = 0; j < n; j++) {
            c[j] = 0;
            for(int i = 0; i < n; i++) {
                c[j] += v[i] * m[i][j];
            }
        }
    }

    public static void main(String[] args) {
        ArrayList<String> vct = read_data("../../Data/4096vector.data");
        ArrayList<String> mtx = read_data("../../Data/4096matrix.data");
        int nn = 4096;
        int[] aa = String2IntList(vct.get(0));
        int[][] bb = new int[nn][nn];
        for(int i = 0; i < nn; i++) {
            bb[i] = String2IntList(mtx.get(i));
        }

        double average_time = 0;
        long startTime=System.nanoTime();
        v_x_m(aa, bb);
        long endTime=System.nanoTime();
        average_time = (endTime - startTime) / 1e6;
        String result = String.format("%.2f", average_time);
        System.out.print("Java time ");
        System.out.print(result);
        System.out.println(" ms");
    }
}
