package travelling.api.app.controller.api.front;

import lombok.Data;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import travelling.api.app.controller.BaseController;
import travelling.api.app.model.request.BaseFilterRequest;
import travelling.api.app.model.response.ListResponse;
import travelling.api.app.model.response.ObjectResponse;
import travelling.api.app.model.response.blog.BlogResponse;
import travelling.api.app.service.front.BlogFrontService;

@RestController
@Data
public class BlogFrontController extends BaseController {
    private final BlogFrontService blogFrontService;


    @GetMapping("/front/blog/{id}")
    public ResponseEntity<ObjectResponse> getById(@PathVariable Long id) {
        return success(id, blogFrontService::findById);
    }

    @GetMapping("/front/blogs")
    public ResponseEntity<ListResponse<BlogResponse>> getAll(@ModelAttribute BaseFilterRequest baseFilterRequest) {
        return ResponseEntity.ok(blogFrontService.findAll(baseFilterRequest));
    }

}
