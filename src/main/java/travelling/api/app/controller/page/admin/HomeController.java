package travelling.api.app.controller.page.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
    @GetMapping("/admin")
    public String homePage(){
        return "admin/home";
    }
}
