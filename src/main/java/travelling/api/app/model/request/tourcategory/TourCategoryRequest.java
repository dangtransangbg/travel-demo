package travelling.api.app.model.request.tourcategory;

import lombok.Data;

@Data
public class TourCategoryRequest {
    private Long id;
    private String name;
    private Integer categoryType;
}
