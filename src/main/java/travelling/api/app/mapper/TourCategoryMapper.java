package travelling.api.app.mapper;

import org.springframework.stereotype.Component;
import travelling.api.app.entity.TourCategory;
import travelling.api.app.model.request.tourcategory.TourCategorySaveRequest;
import travelling.api.app.model.response.tourcategory.TourCategoryResponse;
import travelling.api.app.util.BeanUtils;

@Component
public class TourCategoryMapper implements Mapper {

    public TourCategory convertToEntity(TourCategorySaveRequest tourCategorySaveRequest) {
        TourCategory tourCategory = new TourCategory();
        BeanUtils.refine(tourCategorySaveRequest, tourCategory, BeanUtils::copyNonNull);

        return tourCategory;
    }

    public TourCategoryResponse convertToResponse(TourCategory tourCategory) {
        TourCategoryResponse response = new TourCategoryResponse();
        BeanUtils.refine(tourCategory, response, BeanUtils::copyNonNull);

        return response;
    }

}
