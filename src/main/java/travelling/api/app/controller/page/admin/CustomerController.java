package travelling.api.app.controller.page.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminCustomer")
@RequestMapping("/admin")
public class CustomerController {
    @GetMapping("/customer-list")
    public String blogPage(){
        return "admin/customer/list";
    }

    @GetMapping("/customer-create")
    public String create(){
        return "admin/customer/edit";
    }
}
