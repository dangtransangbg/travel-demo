package travelling.api.app.controller.api.admin;

import lombok.Data;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import travelling.api.app.common.role.ADMIN;
import travelling.api.app.controller.BaseController;
import travelling.api.app.model.request.tour.TourFilterRequest;
import travelling.api.app.model.request.tour.TourSaveRequest;
import travelling.api.app.model.request.tour.TourUpdateRequest;
import travelling.api.app.model.response.ObjectResponse;
import travelling.api.app.model.response.tour.TourDetailResponse;
import travelling.api.app.model.response.tour.TourResponse;
import travelling.api.app.service.admin.TourService;

@RestController
@Data
@RequestMapping("/admin")
public class TourController extends BaseController {

    private final TourService tourService;



    @PostMapping("/tour")
    @ADMIN
    public ResponseEntity<ObjectResponse> save(@RequestBody TourSaveRequest tourSaveRequest) {
        return success(tourSaveRequest, tourService::save);
    }


    @PatchMapping("/tour/{id}/hot")
    @ADMIN
    public ResponseEntity<ObjectResponse> updateHot(@RequestParam Boolean hot, @PathVariable long id) {
        TourUpdateRequest tourUpdateRequest = TourUpdateRequest
                .builder()
                .id(id)
                .hot(hot)
                .build();
        return success(tourUpdateRequest, tourService::updateTourToHot);
    }

    @PatchMapping("/tour/{id}/status")
    @ADMIN
    public ResponseEntity<ObjectResponse> updateStatus(@RequestParam String status, @PathVariable long id) {
        TourUpdateRequest tourUpdateRequest = TourUpdateRequest
                .builder()
                .id(id)
                .status(status)
                .build();

        return success(tourUpdateRequest, tourService::updateTourStatus);
    }



    @PostMapping("/tours/test")
    public ResponseEntity<ObjectResponse> getAll(@RequestBody TourFilterRequest tourFilterRequest) {
        return success(tourFilterRequest, tourService::getAll);
    }
}
