/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cozcyt.labsol.big_data_dashboard.controller;

import java.math.BigDecimal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author oima
 */
@Controller
public class DashboardLinker {
    
    @RequestMapping(method = RequestMethod.GET, value = "/BigDataServer.labsol")
    public @ResponseBody String goToDashBoard(Model model, String serverIp, String serverPort) {
        model.addAttribute("test", "Jajajaja yeah!");
        return "/DashBoard";
    }
    
}
