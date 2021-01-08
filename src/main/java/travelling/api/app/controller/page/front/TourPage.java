package travelling.api.app.controller.page.front;

import lombok.Data;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import travelling.api.app.model.response.tour.TourDetailResponse;
import travelling.api.app.model.response.tour.TourResponse;
import travelling.api.app.service.admin.TourService;

@Controller
@Data
public class TourPage {

    private final TourService tourService;

    @GetMapping("/tour/{id}")
    public ModelAndView getById(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("tour-detail");
        TourDetailResponse tour = tourService.findTourById(id);
        TourResponse tourResponse = tourService.getById(id);
        mav.addObject("tours",tour);
        mav.addObject("tour",tourResponse);
        return mav;
    }

    @RequestMapping(value = "/tours", method = RequestMethod.GET)
    public String tour(){
        return "tour-home";
    }

    @GetMapping("/tour-list")
    public ModelAndView tourList(){
        ModelAndView mav = new ModelAndView("tour-list");
        return mav;
    }
}
