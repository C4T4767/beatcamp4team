package untitled1.src.socket;
//공통
//Product 클래스 선언

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok. NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private int no;
    private String name;
    private int price;
    private int stock;
}