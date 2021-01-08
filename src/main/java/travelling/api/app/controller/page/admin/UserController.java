package travelling.api.app.controller.page.admin;

import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import travelling.api.app.common.role.ADMIN;
import travelling.api.app.model.response.user.UserResponse;
import travelling.api.app.service.admin.UserService;

import java.util.List;

@Controller("adminUser")
@RequestMapping("/admin")
public class UserController {

    private UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/user-list")
    public ModelAndView tourPage(){
        ModelAndView mav = new ModelAndView("admin/user/list");
        List<UserResponse> user = userService.getAll();
        mav.addObject("data",user);
        return mav;
    }

    @GetMapping("/user-create")
    public String create(){
        return "admin/user/edit";
    }
}
