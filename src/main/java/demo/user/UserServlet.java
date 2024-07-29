package demo.user;

import demo.dao.UserDao;
import demo.pojo.User;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    UserDao dao = new UserDao();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        if (action != null && action.equals("delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            boolean b = dao.deleteUser(id);
            if (b) {
                resp.sendRedirect("UserServlet");
            } else {
                resp.sendRedirect("error.jsp");
            }
        } else if (action != null && action.equals("delete2")) {
            int id = Integer.parseInt(req.getParameter("id"));
            boolean b = dao.deleteUser(id);
            if (b) {
                resp.sendRedirect("userlist.jsp");
            } else {
                resp.sendRedirect("error.jsp");
            }
        } else if (action != null && action.equals("edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            User user = dao.getUserById(id);
            session.setAttribute("u", user);
            resp.sendRedirect("updateuser.jsp");
        } else if (action != null && action.equals("edit2")) {
            int id = Integer.parseInt(req.getParameter("id"));
            User user = dao.getUserById(id);
            session.setAttribute("u", user);
            resp.sendRedirect("updateuser.jsp");
        }
        else {
            List<User> ulist = dao.getUsersList();
            session.setAttribute("users", ulist);
            resp.sendRedirect("userlist2.jsp");
        }
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session=req.getSession();
        String action = req.getParameter("action");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String contact = req.getParameter("contact");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        User user = new User(name, email, contact, address, password);
        if (action != null && action.equals("addUser")) {
            boolean b = dao.addUser(user);
            if (b) {
                resp.sendRedirect("index.jsp");
            } else {
                resp.sendRedirect("error.jsp");
            }
        }
        if (action != null && action.equals("updateUser")) {
            int id = Integer.parseInt(req.getParameter("id"));
            user.setId(id);
            boolean b =dao.updateUser(user);
            if(b) {
                resp.sendRedirect("UserServlet");
            }else {
                System.out.println("error.jsp");
            }
        }else if (action!=null && action.equals("search")){
            String search=req.getParameter("search");
            List<User> ul =dao.getUsersByName(search);
            session.setAttribute("users",ul);
            resp.sendRedirect("userlist2.jsp");
        }
    }

}
