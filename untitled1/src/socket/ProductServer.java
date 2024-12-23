package untitled1.src.socket;
//서버
//ProductServer 클래스와 SocketClient 중첩 클래스 선언
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ProductServer {
    //필드
    private ServerSocket serverSocket;
    private ExecutorService threadPool;
    private List<Product> products;
    private int sequence;

    private Gson gson = new Gson(); // Gson 인스턴스 생성

    //메소드: 서버 시작
    public void start() throws IOException {
        serverSocket = new ServerSocket(50001);
        threadPool = Executors.newFixedThreadPool(100);
        products = new Vector<Product>();
        System.out.println("[서버] 시작됨");
        while (true) {
            //연결 수락
            Socket socket = serverSocket.accept();
            //요청 처리용 SocketClient 생성
            SocketClient sc = new SocketClient(socket);
        }
    }

    //메소드: 서버 종료
    public void stop() {
        try {
            serverSocket.close();
            threadPool.shutdownNow();
            System.out.println("[서버] 종료됨 ");
        } catch (IOException e1) {
        }
    }

    //중첩 클래스: 요청 처리
    public class SocketClient {
        //필드
        private Socket socket;
        private DataInputStream dis;
        private DataOutputStream dos;

        //생성자
        public SocketClient(Socket socket) {
            try {
                this.socket = socket;
                this.dis = new DataInputStream(socket.getInputStream());
                this.dos = new DataOutputStream(socket.getOutputStream());
                receive();
            } catch (IOException e) {
                close();
            }
        }

        //메소드: 요청 받기
        public void receive() {
            threadPool.execute(() -> {
                try {
                    while (true) {
                        String receiveJson = dis.readUTF();
                        JsonObject request = gson.fromJson(receiveJson, JsonObject.class);
                        int menu = request.get("menu").getAsInt();
                        switch (menu) {
                            case 0 -> list(request);
                            case 1 -> create(request);
                            case 2 -> update(request);
                            case 3 -> delete(request);
                        }
                    }
                } catch (IOException e) {
                    close();
                }
            });
        }

        public void list(JsonObject request) throws IOException {
            //응답 보내기
            JsonArray data = new JsonArray();
            for (Product p : products) {
                JsonObject product = new JsonObject();
                product.addProperty("no", p.getNo());
                product.addProperty("name", p.getName());
                product.addProperty("price", p.getPrice());
                product.addProperty("stock", p.getStock());
                data.add(product);
            }
            JsonObject response = new JsonObject();
            response.addProperty("status", "success");
            response.add("data", data);
            dos.writeUTF(gson.toJson(response));
            dos.flush();
        }

        public void create(JsonObject request) throws IOException {
            //요청 처리하기
            JsonObject data = request.getAsJsonObject("data");
            Product product = new Product();
            product.setNo(++sequence);
            product.setName(data.get("name").getAsString());
            product.setPrice(data.get("price").getAsInt());
            product.setStock(data.get("stock").getAsInt());
            products.add(product);
            //응답 보내기
            JsonObject response = new JsonObject();
            response.addProperty("status", "success");
            response.add("data", new JsonObject());
            dos.writeUTF(gson.toJson(response));
            dos.flush();
        }

        public void update(JsonObject request) throws IOException {
            //요청 처리하기
            JsonObject data = request.getAsJsonObject("data");
            int no = data.get("no").getAsInt();
            for (int i = 0; i < products.size(); i++) {
                Product product = products.get(i);
                if (product.getNo() == no) {
                    product.setName(data.get("name").getAsString());
                    product.setPrice(data.get("price").getAsInt());
                    product.setStock(data.get("stock").getAsInt());
                }
            }
            //응답 보내기
            JsonObject response = new JsonObject();
            response.addProperty("status", "success");
            response.add("data", new JsonObject());
            dos.writeUTF(gson.toJson(response));
            dos.flush();
        }

        public void delete(JsonObject request) throws IOException {
            //요청 처리하기
            JsonObject data = request.getAsJsonObject("data");
            int no = data.get("no").getAsInt();
            Iterator<Product> iterator = products.iterator();
            while (iterator.hasNext()) {
                Product product = iterator.next();
                if (product.getNo() == no) {
                    iterator.remove();
                }
            }
            //응답 보내기
            JsonObject response = new JsonObject();
            response.addProperty("status", "success");
            response.add("data", new JsonObject());
            dos.writeUTF(gson.toJson(response));
            dos.flush();
        }

        //메소드: 연결 종료
        public void close() {
            try {
                socket.close();
            } catch (Exception e) {
            }
        }
    }

    //메소드: 메인
    public static void main(String[] args) {
        ProductServer productServer = new ProductServer();
        try {
            productServer.start();
        } catch (IOException e) {
            System.out.println(e.getMessage());
            productServer.stop();
        }
    }
}

