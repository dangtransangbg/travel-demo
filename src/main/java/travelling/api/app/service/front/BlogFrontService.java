package travelling.api.app.service.front;

import travelling.api.app.model.request.BaseFilterRequest;
import travelling.api.app.model.response.ListResponse;
import travelling.api.app.model.response.blog.BlogResponse;

public interface BlogFrontService {
    BlogResponse findById(long id);

    ListResponse<BlogResponse> findAll(BaseFilterRequest baseFilterRequest);
}
