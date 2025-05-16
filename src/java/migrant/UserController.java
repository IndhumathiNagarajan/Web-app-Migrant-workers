/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package migrant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.sql.*;
/**
 *
 * @author Administrator
 */
@Controller
public class UserController {
    Connection con;
    PreparedStatement ps;

    public UserController() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_hospitrax", "root", "");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    @RequestMapping(value = "/newuser", method = RequestMethod.GET)
    public ModelAndView viewStudentForm() {
        return new ModelAndView("user", "command", new User());
    }
    
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addPatientInfo(@ModelAttribute("springmvc") User h1, ModelMap model) {
        try {
            ps = con.prepareStatement("insert into users values(?,?,?,?,?,?,?)");
            ps.setString(1, h1.getName());
            ps.setString(2, h1.getGender());
            ps.setString(3, h1.getAddress());
            ps.setString(4, h1.getState());
            ps.setString(5, h1.getCountry());
            ps.setString(6, h1.getMobile());
            ps.setString(7, h1.getUserid());
            ps.setString(8, h1.getPassword());
            ps.setString(5, h1.getPhoto());
            ps.setString(5, h1.getProof());
            ps.executeUpdate();
            ps.close();
        } catch (Exception exp) {
            System.out.println(exp);
        }
        model.addAttribute("msg", "User Record Stored...!");
        return "result";
    }
}
