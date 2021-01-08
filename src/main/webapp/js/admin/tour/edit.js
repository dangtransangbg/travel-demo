jQuery(function ($) {
    $(document).ready(function (){
        getTour();

        $(document).on('click','#btnAdd',function () {
            var data = getDataForm();
            $.ajax({
                url: "/admin/tour",
                type: "POST",
                headers:{"X-AUTH-TOKEN": localStorage.getItem("access-token")},
                data: JSON.stringify(data),
                dataType: "JSON",
                contentType: "application/json",
                beforeSend: function () {
                    $(".loader").css("display", "block");
                },
                success: function (response) {
                    $(".loader").css("display", "none");
                    alert("Thêm mới thành công");
                    window.location.href = "/admin/tour-list";
                },
                error: function (response) {
                    alert("Thất bại");
                    // window.location.href = "/admin/course-plan/list";
                    console.log(response);
                }

            })



        });
        function getTour() {
            var idTour = $('#idTour').val();
            if (idTour) {
                $.ajax({
                    url: "/admin/tour/"+idTour,
                    type: "GET",
                    headers:{"X-AUTH-TOKEN": localStorage.getItem("access-token")},
                    contentType: "application/json",
                    beforeSend: function () {
                        $(".loader").css("display", "block");
                    },
                    success: function (response) {
                        console.log(response);
                        var dt = response.data;
                        $('#thumbnail').val(dt.thumbnail);
                        // $('#tourCategoryId').val(dt.tourCategoryId);
                        $('#tourType').val(dt.tourType);
                        $('#title').val(dt.title);
                        $('#keyword').val(dt.keyword);
                        $('#price').val(dt.price);
                        $('#status').val(dt.status);
                        $('#description').val(dt.description);
                        $('#startPlace').val(dt.startPlace);
                        $('#destinationPlace').val(dt.destinationPlace);
                        $('#content').val(dt.content);
                        $('#name').val(dt.name);
                        $('#vehicle').val(dt.vehicle);

                    },
                    error: function (response) {
                        alert("Thất bại");
                        console.log(response);
                    }

                })
            }
        }
        $(document).on('click','.btnUpdate',function () {
                var data = getDataForm();
                $.ajax({
                    url: "/admin/tour",
                    type: "POST",
                    headers:{"X-AUTH-TOKEN": localStorage.getItem("access-token")},
                    data: JSON.stringify(data),
                    dataType: "JSON",
                    contentType: "application/json",
                    beforeSend: function () {
                        $(".loader").css("display", "block");
                    },
                    success: function (response) {
                        $(".loader").css("display", "none");
                        alert("Cập nhật  thành công");
                        window.location.href = "/admin/tour-list";
                    },
                    error: function (response) {
                        alert("Thất bại");
                        console.log(response);
                    }

                })

        });
        $(document).on('click','#tourCategoryId',function () {
            $.ajax({
                url: "/admin/tourCategory-list",
                type: "GET",
                headers:{"X-AUTH-TOKEN": localStorage.getItem("access-token")},
                contentType: "application/json",
                beforeSend: function () {
                    $(".loader").css("display", "block");
                },
                success: function (response) {
                    $(".loader").css("display", "none");
                    var s = '';
                    $(response).each(function (index, v) {
                        if ($('#tourType').val() == 1) {
                            if (v.categoryType == 1) {
                                s +='<option value="'+v.id+'">'+v.name+'</option>'
                            }
                        }else {
                            if (v.categoryType == 2) {
                                s +='<option value="'+v.id+'">'+v.name+'</option>'
                            }
                        }

                    });
                    $('#tourCategoryId').html(s);

                },
                error: function (response) {
                    alert("Thất bại");
                    console.log(response);
                }

            })
        })

        function getDataForm() {
            var data = {};
            var formData = $('#formSubmit').serializeArray();
            $.each(formData, function (i, v) {
                data[""+v.name+""] = v.value;
            });
            data["content"] = editor.getData();
            console.log(data);
            return data;
        }
        // $("#formSubmit").validate({
        //     rules: {
        //         name: {
        //             required: true,
        //             maxlength:500
        //         },
        //         startPlace:{
        //             required: true
        //         },
        //         destinationPlace: {
        //             required: true
        //         },
        //         description: {
        //             required: true
        //         },
        //         content: {
        //             required: true
        //         }
        //
        //     },
        //     messages: {
        //         name: {
        //             required: "Chưa nhập tên",
        //             maxlength:"Tên không được vượt quá 500 kí tự"
        //         },
        //         startPlace:{
        //             required: "Chưa nhập điểm xuất phát"
        //         },
        //         destinationPlace: {
        //             required: "Chưa nhập điểm đến"
        //         },
        //         description: {
        //             required: "Chưa nhập mô tả"
        //         },
        //         content: {
        //             required: "Chưa nhập nội dung"
        //         }
        //     },
        //
        // });
    })
})