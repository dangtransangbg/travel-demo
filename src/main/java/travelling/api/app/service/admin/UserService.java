package travelling.api.app.service.admin;


import travelling.api.app.model.request.user.UserAuthRequest;
import travelling.api.app.model.request.user.UserChangePasswordRequest;
import travelling.api.app.model.request.user.UserSaveRequest;
import travelling.api.app.model.response.tour.TourDetailResponse;
import travelling.api.app.model.response.user.UserResponse;
import travelling.api.security.jwt.model.JwtPayload;

import java.util.List;

public interface UserService {
    void save(UserSaveRequest userSaveRequest);

    String auth(UserAuthRequest userAuthRequest);

    UserResponse getInfo();

    UserResponse get(Long id);

    List<UserResponse> getAll();


    void changePassword(UserChangePasswordRequest changePassword);

    JwtPayload parseToken();
}
