package untitled1.src.socket;
////클라이언트
////ProductClient 클래스 선언
//public class ProductClient {
//}
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

public class ProductClient {
    // 필드
    private Socket socket;
    private DataInputStream dis;
    private DataOutputStream dos;
    private Scanner scanner;
    private Gson gson = new Gson(); // Gson 인스턴스 생성

    // 메소드: 서버 연결
    public void start() throws IOException {
        socket = new Socket("localhost", 50001);
        dis = new DataInputStream(socket.getInputStream());
        dos = new DataOutputStream(socket.getOutputStream());
        System.out.println("[클라이언트] 서버에 연결됨");
        scanner = new Scanner(System.in);
        // 상품 목록 보여주기
        list();
    }

    // 메소드: 클라이언트 종료
    public void stop() {
        try {
            socket.close();
            scanner.close();
        } catch (Exception e) {
        }
        System.out.println("[클라이언트] 종료됨");
    }

    // 메소드: 메뉴
    public void menu() throws IOException {
        System.out.println();
        System.out.println("---------------------------------------------------------------");
        System.out.println("메뉴: 1.Create | 2.Update | 3.Delete | 4.Exit");
        System.out.print("선택: ");
        String menuNo = scanner.nextLine();
        System.out.println();
        switch (menuNo) {
            case "1" -> create();
            case "2" -> update();
            case "3" -> delete();
            case "4" -> exit();
        }
    }

    // 메소드: 상품 목록
    public void list() throws IOException {
        // 타이틀 및 컬럼명 출력
        System.out.println();
        System.out.println("[상품 목록]");
        System.out.println("---------------------------------------------------------------");
        System.out.printf("%-6s%-30s%-15s%-10s\n", "no", "name", "price", "stock");
        System.out.println("---------------------------------------------------------------");

        // 상품 목록 요청하기
        JsonObject request = new JsonObject();
        request.addProperty("menu", 0);
        request.add("data", new JsonObject());
        dos.writeUTF(gson.toJson(request));
        dos.flush();

        // 응답 받기
        JsonObject response = gson.fromJson(dis.readUTF(), JsonObject.class);
        if (response.get("status").getAsString().equals("success")) {
            // 상품 목록 출력
            JsonArray data = response.getAsJsonArray("data");
            for (int i = 0; i < data.size(); i++) {
                JsonObject product = data.get(i).getAsJsonObject();
                System.out.printf(
                        "%-6d%-30s%-15d%-10d\n",
                        product.get("no").getAsInt(),
                        product.get("name").getAsString(),
                        product.get("price").getAsInt(),
                        product.get("stock").getAsInt()
                );
            }
        }
        // 메뉴 출력
        menu();
    }

    // 메소드: 상품 생성
    public void create() throws IOException {
        // 상품 정보 입력
        System.out.println("[상품 생성]");
        Product product = new Product();
        System.out.print("상품 이름: ");
        product.setName(scanner.nextLine());
        System.out.print("상품 가격: ");
        product.setPrice(Integer.parseInt(scanner.nextLine()));
        System.out.print("상품 재고: ");
        product.setStock(Integer.parseInt(scanner.nextLine()));

        // 상품 생성 요청하기
        JsonObject data = new JsonObject();
        data.addProperty("name", product.getName());
        data.addProperty("price", product.getPrice());
        data.addProperty("stock", product.getStock());
        JsonObject request = new JsonObject();
        request.addProperty("menu", 1);
        request.add("data", data);
        dos.writeUTF(gson.toJson(request));
        dos.flush();

        // 응답 받기
        JsonObject response = gson.fromJson(dis.readUTF(), JsonObject.class);
        if (response.get("status").getAsString().equals("success")) {
            list();
        }
    }

    // 메소드: 상품 수정
    public void update() throws IOException {
        // 상품 수정 내용 입력
        System.out.println("[상품 수정]");
        Product product = new Product();
        System.out.print("상품 번호: ");
        product.setNo(Integer.parseInt(scanner.nextLine()));
        System.out.print("이름 변경: ");
        product.setName(scanner.nextLine());
        System.out.print("가격 변경: ");
        product.setPrice(Integer.parseInt(scanner.nextLine()));
        System.out.print("재고 변경: ");
        product.setStock(Integer.parseInt(scanner.nextLine()));

        // 상품 수정 요청하기
        JsonObject data = new JsonObject();
        data.addProperty("no", product.getNo());
        data.addProperty("name", product.getName());
        data.addProperty("price", product.getPrice());
        data.addProperty("stock", product.getStock());
        JsonObject request = new JsonObject();
        request.addProperty("menu", 2);
        request.add("data", data);
        dos.writeUTF(gson.toJson(request));
        dos.flush();

        // 응답 받기
        JsonObject response = gson.fromJson(dis.readUTF(), JsonObject.class);
        if (response.get("status").getAsString().equals("success")) {
            list();
        }
    }

    // 메소드: 상품 삭제
    public void delete() throws IOException {
        // 상품 삭제 내용 입력
        System.out.println("[상품 삭제]");
        System.out.print("상품 번호: ");
        int no = Integer.parseInt(scanner.nextLine());

        // 상품 삭제 요청하기
        JsonObject data = new JsonObject();
        data.addProperty("no", no);
        JsonObject request = new JsonObject();
        request.addProperty("menu", 3);
        request.add("data", data);
        dos.writeUTF(gson.toJson(request));
        dos.flush();

        // 응답 받기
        JsonObject response = gson.fromJson(dis.readUTF(), JsonObject.class);
        if (response.get("status").getAsString().equals("success")) {
            list();
        }
    }

    // 메소드: 종료
    public void exit() {
        stop();
    }

    // 메소드: 메인
    public static void main(String[] args) {
        ProductClient productClient = new ProductClient();
        try {
            productClient.start();
        } catch (IOException e) {
            System.out.println(e.getMessage());
            productClient.stop();
        }
    }
}
