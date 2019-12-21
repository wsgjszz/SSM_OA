package OJ;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * 求最长重复子串的长度，输入:ababa 输出:3
 */
public class Main {

    public void GetMaxStr(String str){
        long star = System.currentTimeMillis();
        Runtime r = Runtime.getRuntime();
        r.gc();
        long startMem = r.totalMemory()-r.freeMemory(); // 开始时的剩余内存
        int maxLen=0;
        Map<String, Integer> map = new HashMap<>();
        for (int i = 0; i < str.length(); i++) {
            for (int j = i+1; j <= str.length(); j++) {
                if (maxLen>j-i) continue;
                String s = str.substring(i, j);
                if (map.containsKey(s)){
                    //存在相同的子串
                    map.put(s,map.get(s)+1);
                    maxLen=s.length();
                }else {
                    map.put(s,1);
                }
            }
        }
        /*for (String key:map.keySet()){
            System.out.println(key+":"+map.get(key));
        }*/
        System.out.println(map.size());
        System.out.println("maxLen:"+maxLen);
        long end = System.currentTimeMillis();
        System.out.println("共耗时："+(end-star)+"毫秒");
        long endMem = r.totalMemory()-r.freeMemory();
        long orz = (endMem - startMem)/1024/1024; // 剩余内存 现在
        System.out.println("开始内存："+startMem);
        System.out.println("结束内存："+endMem);
        System.out.println("消耗内存："+orz+"M");
    }

    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String str = sc.next();
        new Main().GetMaxStr(str);
    }
}
