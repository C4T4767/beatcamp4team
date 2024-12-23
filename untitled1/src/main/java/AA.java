package untitled1.src.main.java;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kr.bit.Book;

import java.util.ArrayList;
import java.util.List;

public class AA {
    public static void main(String[] args){
//p.860
        //객체 -> json으로 변환
        //Book class 객체 생성
        Book book = new Book("자바",30000,"A출판사",900);
        Gson gson = new Gson();
        String str = gson.toJson(book);
        //book객체를 json문자열로 변환
        //{"title":"자바","price":30000,,,}
        System.out.println(str);


        //json -> 객체
        Book book1 = gson.fromJson(str, Book.class);
        //json문자열을 다시 book객체로 역직렬화 시킴 -> json기반으로 book객체 생성됨
        System.out.println(book1);
        System.out.println(book1.getCompany()+" "+book1.getTitle());


        //객체 -> json
        ArrayList<Book> list = new ArrayList<>();
        list.add(new Book("자바",30000,"A출판사",900));
        list.add(new Book("자바2",50000,"B출판사",600));
        list.add(new Book("자바3",60000,"C출판사",300));
        list.add(new Book("자바4",70000,"D출판사",500));

        //리스트 전체를 json문자열로 변환
        String str2 = gson.toJson(list);
        System.out.println(str2);

        //json -> 리스트객체
        //gson은 제네릭타입을 인식할 수 없음 -> typetoken
        List<Book> list2 = gson.fromJson(str2, new TypeToken<List<Book>>(){}.getType());
        for(Book bo: list2){
            System.out.println(bo);
        }

    }
}
