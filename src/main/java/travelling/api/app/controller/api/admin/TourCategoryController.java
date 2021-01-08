package travelling.api.app.controller.api.admin;

import lombok.Data;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import travelling.api.app.controller.BaseController;
import travelling.api.app.model.request.tourcategory.TourCategoryRequest;
import travelling.api.app.model.request.tourcategory.TourCategorySaveRequest;
import travelling.api.app.model.response.ObjectResponse;
import travelling.api.app.model.response.tourcategory.TourCategoryResponse;
import travelling.api.app.service.admin.TourCategoryService;

import java.util.List;

@RestController
@Data
@RequestMapping("/admin")
public class TourCategoryController extends BaseController {

    private final TourCategoryService tourCategoryService;


    @PostMapping("/tourCategory")
    public ResponseEntity<ObjectResponse> save(@RequestBody TourCategorySaveRequest tourCategorySaveRequest) {
        return success(tourCategorySaveRequest, tourCategoryService::save);
    }

    @GetMapping("/tourCategory-list")
    public ResponseEntity<List<TourCategoryResponse>> getAll(){
        return new ResponseEntity<>(tourCategoryService.getAll(), HttpStatus.OK);
    }

}
