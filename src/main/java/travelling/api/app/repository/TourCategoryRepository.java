package travelling.api.app.repository;


import travelling.api.app.entity.TourCategory;

import java.util.List;

public interface TourCategoryRepository extends BaseRepository<TourCategory, Long> {


    List<TourCategory> findAllByCategoryType(Integer id);
}
