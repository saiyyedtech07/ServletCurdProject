package demo.dao;

import demo.pojo.User;
import demo.util.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    Connection con = DBConnect.getConnection();
    List<User> userList = new ArrayList<>();
    public boolean addUser(User user) {
        String sql = "INSERT INTO user (name, email, contact, address, password) VALUES (?, ?, ?, ?, ?)";
        try (
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getContact());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getPassword());

            int i = ps.executeUpdate();
            if (i > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // You may want to use a logger instead
        }
        return false;
    }


    public List<User> getUsersList() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM user";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setContact(rs.getString("contact"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                userList.add(user);
            }
            return userList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteUser(int id ) {
        String sql = "DELETE FROM user WHERE id = ?";
        try (
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);


            int i = ps.executeUpdate();
            if (i > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // You may want to use a logger instead
        }
        return false;
    }

    public User getUserById(int id) {
        User user = null;
        String sql = "SELECT * FROM user WHERE id = ?";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setContact(rs.getString("contact"));
                    user.setAddress(rs.getString("address"));
                    user.setPassword(rs.getString("password"));
                }
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logger
        }
        return null;
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE user SET name=?, email=?, contact=?, address=?, password=? WHERE id=?";
        try (
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getContact());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getPassword());
            ps.setInt(6,user.getId());

            int i = ps.executeUpdate();
            if (i > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // You may want to use a logger instead
        }
        return false;
    }

    public List<User> getUsersByName(String name ) {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM user WHERE name LIKE '%" + name + "%'";
        System.out.println(sql);
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setContact(rs.getString("contact"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                userList.add(user);
            }
            return userList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public User login(String email,String password) {
        User user = null;
        String sql = "SELECT * FROM user WHERE email=? and password=?";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setContact(rs.getString("contact"));
                    user.setAddress(rs.getString("address"));
                    user.setPassword(rs.getString("password"));
                }
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logger
        }
        return null;
    }
}
