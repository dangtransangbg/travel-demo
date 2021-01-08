package travelling.api.app.service.admin;

import travelling.api.app.model.request.tourcategory.TourCategorySaveRequest;
import travelling.api.app.model.response.tourcategory.TourCategoryResponse;

import java.util.List;

public interface TourCategoryService {
    void save(TourCategorySaveRequest tourCategorySaveRequest);

    List<TourCategoryResponse> getAll();
}
