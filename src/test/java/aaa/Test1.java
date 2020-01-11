package aaa;

import org.json.JSONArray;
import org.junit.Test;

public class Test1 {
    @org.junit.Test
    public void test(){
        //
        String a ="1999-6-11";
        String[] split = a.split("-");
        for (String s : split) {
            System.out.println(s);
        }

    }



}
