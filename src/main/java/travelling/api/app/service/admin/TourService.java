package travelling.api.app.service.admin;


import travelling.api.app.model.request.tour.TourFilterRequest;
import travelling.api.app.model.request.tour.TourSaveRequest;
import travelling.api.app.model.request.tour.TourUpdateRequest;
import travelling.api.app.model.response.ListResponse;
import travelling.api.app.model.response.tour.TourDetailResponse;
import travelling.api.app.model.response.tour.TourResponse;

import java.util.List;

public interface TourService {
    void save(TourSaveRequest tourSaveRequest);

    void updateTourToHot(TourUpdateRequest tourUpdateRequest);

    void updateTourStatus(TourUpdateRequest tourUpdateRequest);

    TourResponse getById(Long id);
    List<TourResponse> findAll();

    TourDetailResponse findTourById(Long id);

    ListResponse<TourResponse> getAll(TourFilterRequest tourFilterRequest);
}
