package kr.bit;

public class Book {
    private String title;
    private int price;
    private String company;
    private int page;

    public Book(String t, int p, String c, int page){
        title = t;
        price = p;
        company = c;
        this.page = page;

    }
    public Book(){}
    //alt+insert

    public String getTitle() {
        return title;
    }

    public int getPrice() {
        return price;
    }

    public String getCompany() {
        return company;
    }

    public int getPage() {
        return page;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public void setPage(int page) {
        this.page = page;
    }

    @Override
    public String toString() {
        return "Book{" +
                "title='" + title + '\'' +
                ", price=" + price +
                ", company='" + company + '\'' +
                ", page=" + page +
                '}';
    }
}


