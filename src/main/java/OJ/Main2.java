package OJ;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * 求最长重复子串，输入:ababa 输出:aba/3
 */
public class Main2 {

    public void GetMaxStr(String str){
        long star = System.currentTimeMillis();
        Runtime r = Runtime.getRuntime();
        r.gc();
        long startMem = r.totalMemory()-r.freeMemory(); // 开始时的剩余内存
        String maxStr = "";
        int maxLen=0;
        Map<String, Integer> map = new HashMap<>();
        for (int i = 0; i < str.length(); i++) {
            for (int j = i+1; j <= str.length(); j++) {
                String s = str.substring(i, j);
                if (map.containsKey(s)){
                    //存在相同的子串
                    map.put(s,map.get(s)+1);
                }else {
                    map.put(s,1);
                }
            }
        }
        /*Set<String> keySet = map.keySet();
        String[] keys = (String[]) keySet.toArray();*/
        for (String key:map.keySet()){
            if (map.get(key)>1){
                if (key.length()>maxLen){
                    maxStr=key;
                    maxLen=key.length();
                }
            }
            System.out.println(key+":"+map.get(key));
        }
        System.out.println(map.size());
        System.out.println("maxStr:"+maxStr);
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
        new Main2().GetMaxStr(str);
    }
}
