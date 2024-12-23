package kr.bit.controller;

import kr.bit.entity.BookDTO;
import kr.bit.repository.BookDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/list")
public class BookController extends HttpServlet{
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        BookDAO dao = new BookDAO();
        List<BookDTO> list = dao.li();
        //Book테이블 전체 조회함 -> list에 담겨져 있음

        //request영역에 list를 담은 후에 페이지 list.jsp 이동
        req.setAttribute("list", list);

        RequestDispatcher dis = req.getRequestDispatcher("list.jsp");
        dis.forward(req, resp);


    }

}
