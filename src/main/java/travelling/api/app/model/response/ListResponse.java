package travelling.api.app.model.response;

import lombok.*;
import travelling.api.app.common.constant.MessageConstant;

import java.io.Serializable;
import java.util.List;

@Data
public class ListResponse<T> {
    private long totalItem;
    private List<T> data;
    private ResponseStatus responseStatus;

    private ListResponse(long totalItem, List<T> data) {
        this.totalItem = totalItem;
        this.data = data;
        ResponseStatus responseStatus = new ResponseStatus();
        responseStatus.setCode(MessageConstant.SUCCESS.value());
        responseStatus.setMessage("Thành Công");
        responseStatus.setStatusCode(200);
    }

    public static <T> ListResponse<T> of(long totalItem, List<T> data){
        return new ListResponse<>(totalItem, data);
    }

    @Getter
    @Setter
    public static class ResponseStatus{
        private String code;
        private String message;
        private int statusCode;
    }
}
