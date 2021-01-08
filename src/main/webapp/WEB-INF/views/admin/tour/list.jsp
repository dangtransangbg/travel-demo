<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>

<html>

<%@include file="/common/admin/head.jsp" %>
<%@include file="/common/admin/header.jsp" %>

<body>
<%@include file="/common/admin/menu.jsp" %>
<div class="content-wrapper" style="height: 90vh;overflow: auto">
    <div class="card">
        <div class="card-header">
            <div class="caption">
                <i class="fas fa-layer-group font-green"></i>
                <span class="caption-subject font-green sbold uppercase">Danh sách tour</span>

                <div class="form_config_test" style="float: right">
                    <div class="input-group-addon">
                        <div class="tag_action" data-toggle="dropdown">
                            <button>Tác vụ&nbsp;<i class="fa fa-angle-down"></i></button>
                            <%--<i class="fas fa-share"></i></i>&nbsp;Tác vụ&nbsp;<i class="fa fa-angle-down"></i>--%>
                        </div>
                        <ul class="dropdown-menu">
                            <li class="dropdown-item"><a href="/admin/tour-create"><i class="fas fa-plus"></i>&nbsp;Tạo mới</a></li>
                            <li class="dropdown-item"><a id="btnDelete"><i class="fas fa-trash-alt"></i>&nbsp;Xóa</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card-header">
        <div class="container-fluid">

            <form id="search">
                <div class="d-flex justify-content-end">
                    <div class="p-3 flex-grow-1">
                        <input type="text"  class="form-control" id="name" name="name" placeholder="Tên ">
                    </div>
                    <div class="p-3">
                        <select  class="form-control" id="status" name="status">
                            <option selected value="">-Trạng thái-</option>
                            <option value="ON">Công khai</option>
                            <option value="OFF">Ẩn</option>
                        </select>
                    </div>
                    <div class="p-3">
                        <select  class="form-control" id="tourType" name="tourType">
                            <option selected value="">-Loại tour-</option>
                            <option value="1">Trong nước</option>
                            <option value="2">Nước ngoài</option>
                        </select>
                    </div>
                    <%--<div class="p-3">--%>
                        <%--<select  class="form-control" >--%>
                            <%--<option selected value="">-Tìm kiếm-</option>--%>
                            <%--<option value="">Test</option>--%>
                            <%--<option value="">Test</option>--%>
                            <%--<option value="">Test</option>--%>
                            <%--<option value="">Test</option>--%>
                            <%--<option value="">Test</option>--%>
                        <%--</select>--%>
                    <%--</div>--%>

                    <div class="p-3">
                        <button id="btn_search" type="button" title="Tìm kiếm" class="btn btn-outline-info btn-sm" style="font-size: 26px"><i class="fas fa-search"></i></button>
                    </div>

                </div>
            </form>





            <!-- /.card-header -->
            <div class="card-body " style="overflow: auto">
                <table class="table table-hover table_competition table-bordered " id="dtHorizontalVerticalExample" cellspacing="0" style="min-width: 1400px">
                    <thead>
                    <tr>
                        <th style="width: 30px" > <input type='checkbox' value="0" class='check-box-element'></th>
                        <th>Id</th>
                        <th style=>Tên tour</th>
                        <th >Tiêu đề</th>
                        <th style="width: 260px" >Nội dung</th>
                        <th style="width: 100px">Từ khóa</th>
                        <th style="width: 100px">Trạng thái</th>
                        <th style="width: 260px" >Địa điểm bắt đầu</th>
                        <th style="width: 260px" >Nơi đến</th>
                        <th style="width: 120px">Phương tiện</th>
                        <th style="width: 30px"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${tour}" var="tours">
                        <tr>
                            <td><input type='checkbox' class='check-box'></td>
                            <td>${tours.id}</td>
                            <td>${tours.name}</td>
                            <td>${tours.title}</td>
                            <td>${tours.content}</td>
                            <td>${tours.keyword}</td>
                            <td>${tours.status}</td>
                            <td>${tours.startPlace}</td>
                            <td>${tours.destinationPlace}</td>
                            <td>${tours.vehicle}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Lý do từ chối kế hoạch</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <textarea style="width: 100%;" name="changeStatusToNotDoneReason" rows="4" cols="53" ></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" id="btn-refuse">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="col-sm-12 col-xs-12">
        <ul id="pagination-test" class="pagination"></ul>
    </div>



    <div class="position-absolute loader " style="">
    <div class="spinner-border " style="position:fixed;width: 3rem; height: 3rem;top: 50%;left: 50%"
    role="status">
    <span class="sr-only">Loading...</span>
    </div>
    </div>
    <%@include file="/common/admin/footer.jsp" %>
</div>
<%--<script src="https://code.jquery.com/jquery-3.1.1.min.js"/>--%>
<%@include file="/common/admin/scrip.jsp" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="<c:url value='/js/admin/tour/list.js'/> " ></script>
<script>

    $("#checkAllCustomAdd").change(function(){  //"select all" change
        var status = this.checked; // "select all" checked status
        $('#data-list input[type=checkbox]').each(function(){ //iterate all listed checkbox items
            this.checked = status; //change ".checkbox" checked status
        });
    });

    $('#data-list input[type=checkbox]').change(function(){ //".checkbox" change
        //uncheck "select all", if one of the listed checkbox item is unchecked
        if(this.checked == false){ //if this item is unchecked
            $("#checkAllCustomAdd")[0].checked = false; //change "select all" checked status to false
        }
        //check "select all" if all checkbox items are checked
        if ($('#data-list input[type=checkbox]:checked').length == $('#data-list input[type=checkbox]').length ){
            $("#checkAllCustomAdd")[0].checked = true; //change "select all" checked status to true
        }
    });

</script>
</body>
</html>
