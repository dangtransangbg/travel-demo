package travelling.api.app.controller.page.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import travelling.api.app.model.response.tour.TourResponse;
import travelling.api.app.service.admin.TourService;

import java.util.List;

@Controller("adminTour")
@RequestMapping("/admin")
public class TourController {


    private TourService tourService;

    public TourController(TourService tourService) {
        this.tourService = tourService;
    }

    @GetMapping("/tour-list")
    public ModelAndView tourPage(){
        ModelAndView mav = new ModelAndView("admin/tour/list");
        List<TourResponse> tours = tourService.findAll();
        mav.addObject("tour",tours);
        return mav;
    }

    @GetMapping("/tour-create")
    public String create(){
        return "admin/tour/edit";
    }

    @GetMapping("/tour-edit/{id}")
    public ModelAndView edit(@PathVariable("id") Long id){
        ModelAndView mav = new ModelAndView("admin/tour/edit");
        mav.addObject("idTour", id);
        return mav;
    }
}
