package demo.user;

import demo.dao.UserDao;
import demo.pojo.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

UserDao userDao=new UserDao();
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
                String email = req.getParameter("email");
        String password = req.getParameter("password");
        User u =userDao.login(email,password);
        if (u!=null && u.getEmail().equals(email)&& u.getPassword().equals(password)){
            session.setAttribute("user",u);
            resp.sendRedirect("index.jsp");
        }else{
            resp.sendRedirect("error.jsp");
        }


    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        session.invalidate();
        resp.sendRedirect("index.jsp");
    }
}
