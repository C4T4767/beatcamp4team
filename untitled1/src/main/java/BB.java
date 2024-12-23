package untitled1.src.main.java;

import com.google.gson.JsonObject;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.InputStream;

public class BB {
    public static void main(String[] args){
        String src = "/student.json";

        InputStream is = BB.class.getResourceAsStream(src);
        if(is == null){
            throw new NullPointerException("파일 찾을 수 없다.");
        }

        JSONTokener tokener = new JSONTokener(is);
        //jsontokener를 사용해 inputstream을 json데이터로 변환
        JSONObject object = new JSONObject(tokener);
        //파싱된 데이터를 java객체로 변환
        JSONArray ary = object.getJSONArray("students");
        //json객체의 키값인 students에 해당하는 데이터 가져옴(데이터가 배열이므로_)

        for(int i=0; i<ary.length(); i++){
            JSONObject j1 = (JSONObject)ary.get(i);
            System.out.println(j1.get("address"));
            System.out.println(j1.get("name"));
            System.out.println(j1.get("phone"));
        }
    }
}
