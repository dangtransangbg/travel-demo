<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>

<html>

    <%@include file="/common/admin/head.jsp" %>
    <%@include file="/common/admin/header.jsp" %>

<body>
<%@include file="/common/admin/menu.jsp" %>
<div id="wrapper" style="width: 100%;height: 90vh;overflow: auto">
    <div class="main-content" style="width: 100%">
        <div class="main-content-inner">
            <div class="page-content container">
                <div class="row">
                    <div class="col-md-12">
                        <c:if test="${not empty message}">
                            <div class="alert alert-${alert}">
                                    ${message}
                            </div>
                        </c:if>
                        <h2>Thêm mới tour</h2>
                        <form id="formSubmit" class="mt-3">
                            <input type="hidden" value="${idTour}" id="idTour" name="id">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="col-sm-12">
                                        <div class="avatar">
                                            <img id="thumbnail"
                                                 src="https://yt3.ggpht.com/-f6NCDKG2Ukw/AAAAAAAAAAI/AAAAAAAAAAA/MqMm3rgmqCY/s48-c-k-no-mo-rj-c0xffffff/photo.jpg"
                                                 class="img-fluid" style="max-width: 300px; max-height: 300px;" />
                                        </div>
                                        <div class="file-field">
                                            <p>
                                                <strong id="Ithumbnail">Chọn ảnh đại diện</strong><br/>
                                                <button
                                                        class="btn btn-primary btn-sm waves-effect waves-light"
                                                        type="button" value="Browse Image"
                                                        onclick="BrowseServer( 'Images:/', 'Ithumbnail' );" >Browse Image</button>
                                            </p>
                                            <input type="hidden" name="thumbnail" id="image_src"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label class="control-label float-right mt-2">Loại tour:</label>
                                        </div>
                                        <div class="col-md-9">
                                            <select class="form-control" id="tourType" name="tourType">
                                                <option disabled>-- Loại tour --</option>
                                                <option value="1">Trong nước</option>
                                                <option value="2">Nước ngoài</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label class="control-label float-right mt-2">Thể loại:</label>
                                        </div>
                                        <div class="col-md-9 mt-2">
                                            <select class="form-control" id="tourCategoryId" name="tourCategoryId">
                                                <option >-- Thể loại --</option>
                                                <option value="">a</option>
                                                <option value="">a</option>
                                                <option value="">a</option>
                                                <option value="">a</option>
                                                <option value="">a</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label class="control-label float-right mt-2">Tên tour:</label>
                                        </div>
                                        <div class="col-md-9 mt-2">
                                            <input type="text" class="form-control" id="name" name="name">
                                        </div>
                                    </div>

                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tiêu đề</label>
                                <div class="col-sm-12">
                                    <textarea type="text" class="form-control" id="title" name="title" ></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="col-sm-3 control-label no-padding-right">Từ khóa</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="keyword" name="keyword" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="col-sm-3 control-label no-padding-right">Chi phí</label>
                                    <div class="col-sm-12">
                                        <input type="number" class="form-control" id="price" name="price" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
                                    <div class="col-sm-12">
                                        <select class="form-control" id="status" name="status">
                                            <option disabled>--Trạng thái --</option>
                                            <option value="ON">Công khai</option>
                                            <option value="OFF">Ẩn</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                                <div class="col-sm-12">
                                    <textarea required class="form-control" id="description" name="description"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="col-sm-12 control-label no-padding-right">Điểm khởi hành</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="startPlace" name="startPlace" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="col-sm-12 control-label no-padding-right">Nơi đến</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="destinationPlace" name="destinationPlace" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="col-sm-12 control-label no-padding-right">Phương tiện</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="vehicle" name="vehicle" />
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Nội dung</label>
                                <div class="col-sm-12">
                                    <textarea required type="text" id="content" name="content"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <c:if test="${idTour == null}">
                                    <div class="col-sm-12">
                                        <button type="button"  class="btn btn-white btn-warning btn-bold" value="Thêm mới" id="btnAdd">Thêm mới</button>
                                    </div>
                                </c:if>
                                <c:if test="${idTour != null}">
                                    <div class="col-sm-12">
                                        <button type="button"  class="btn btn-white btn-warning btn-bold" value="Thêm mới" id="btnUpdate">Cập nhật</button>
                                    </div>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/common/admin/footer.jsp" %>
</div>
<%--<script src="https://code.jquery.com/jquery-3.1.1.min.js"/>--%>
<%@include file="/common/admin/scrip.jsp" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="<c:url value='/js/admin/tour/edit.js'/> " ></script>
<script>
    var editor='';
    $(document).ready(function(){
        editor= CKEDITOR.replace('content',
            {
                filebrowserBrowseUrl : 'ckfinder/ckfinder.html',
                filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?type=Images',
                filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?type=Flash',
                filebrowserUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
                filebrowserImageUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
                filebrowserFlashUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
            });
    });
    /*Avatar start*/
    function BrowseServer(startupPath, functionData) {
        // You can use the "CKFinder" class to render CKFinder in a page:
        var finder = new CKFinder();

        // The path for the installation of CKFinder (default = "/ckfinder/").
        finder.basePath = '../';

        //Startup path in a form: "Type:/path/to/directory/"
        finder.startupPath = startupPath;

        // Name of a function which is called when a file is selected in CKFinder.
        finder.selectActionFunction = SetFileField;

        // Additional data to be passed to the selectActionFunction in a second argument.
        // We'll use this feature to pass the Id of a field that will be updated.
        finder.selectActionData = functionData;

        // Name of a function which is called when a thumbnail is selected in CKFinder. Preview img
        // finder.selectThumbnailActionFunction = ShowThumbnails;

        // Launch CKFinder
        finder.popup();
    }

    function SetFileField(fileUrl, data) {
        document.getElementById(data["selectActionData"]).innerHTML = this
            .getSelectedFile().name;
        document.getElementById("thumbnail").src = fileUrl;
        $('#thumbnail').val(fileUrl);
        $('#image_src').val(fileUrl);

    }


</script>
</body>
</html>

