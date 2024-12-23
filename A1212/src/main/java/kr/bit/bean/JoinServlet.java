package kr.bit.bean;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.PrintWriter;

@WebServlet("/JoinServlet")
public class JoinServlet extends HttpServlet {

    @Override
    protected void service(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException, java.io.IOException {
        String name= req.getParameter("userName");
        String id = req.getParameter("userId");
        String email = req.getParameter("userEmail");

        PrintWriter out = resp.getWriter();
        out.println("<body>");
        out.println("Welcome "+name);

    }

}
