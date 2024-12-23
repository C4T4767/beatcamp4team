package kr.bit.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //set, get 함수 들어가있음
@AllArgsConstructor
@NoArgsConstructor
public class BookDTO { //Data Transfer object (javaBean class)
//    private int num; <- auto_increment
    private String title;
    private int price;
    private String author;
    private int page;
}
