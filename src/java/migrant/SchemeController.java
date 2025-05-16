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
public class SchemeController {
    Connection con;
    PreparedStatement ps;

    public SchemeController() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_hospitrax", "root", "");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    @RequestMapping(value = "/newscheme", method = RequestMethod.GET)
    public ModelAndView viewStudentForm() {
        return new ModelAndView("scheme", "command", new Scheme());
    }
    
    @RequestMapping(value = "/addScheme", method = RequestMethod.POST)
    public String addPatientInfo(@ModelAttribute("springmvc") Scheme s1, ModelMap model) {
        try {
            ps = con.prepareStatement("insert into Schemes values(?,?,?,?)");
            ps.setString(1, s1.getScheme());
            ps.setString(2, s1.getCategory());
            ps.setString(3, s1.getDescription());
            ps.setFloat(4, s1.getAmount());
            ps.executeUpdate();
            ps.close();
        } catch (Exception exp) {
            System.out.println(exp);
        }
        model.addAttribute("msg", "Scheme Details Stored...!");
        return "result";
    }
}
