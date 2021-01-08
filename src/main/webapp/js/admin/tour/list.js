
jQuery(function ($) {
    $(document).ready(function () {
        getListTour();

        function  getListTour(){

            var data =getDataSearch();
            $.ajax({
                url: '/admin/tours/test',
                type:'POST',
                headers:{"X-AUTH-TOKEN": localStorage.getItem("access-token")},
                data: JSON.stringify(data),
                dataType:'json',
                contentType: "application/json",
                beforeSend: function () {
                    $('.loader').css("display", "block");
                    $('#pagination-test').empty();
                    $('#pagination-test').removeData("twbs-pagination");
                    $('#pagination-test').unbind("page");
                },
                success: function (res){
                    $('.loader').css("display", "none");
                    var dt = res.data;
                    // if (res.totalItem != 0) {
                    //     paging(res.totalPage,res.currentPage);
                    // }
                    showTour(dt.data);
                },
                error: function (e) {
                    alert("false");
                    console.log(e);
                }
            })
        }
        function showTour(data) {
            // console.log(data);
            var s = '';
            if (data.length === 0) {
                var s1 = `<div class="alert alert-warning text-center w-100 mt-3" style="color: #f6821f;  background-color: #fff3cd; border-color: #ffeeba; margin-top: 200px;">
             <i class="fa fa-exclamation-triangle"></i>  
             <a style="color: #f6821f;">Không tìm thấy tour nào !</a>`;
                s += `   <tr style="background-color: white">
                <td colspan="100">` + s1 + `</td>
                </tr> `;
                $("#data-list").html(s1);
            }
            $(data).each(function (index, v) {
                s+= '<tr>'
                    +'<td><input type="checkbox" name="idCoursePlan" id="checkbox_'+v.id+'" value="'+v.id+'"></td>'
                    +'<td>'+v.name+'</td>'
                    +'<td>'+v.content+'</td>'
                    +'<td>'+v.title+'</td>'
                    +'<td>'+v.keyword+'</td>';
                if(v.status == 'ON'){
                    s+='<td>Công khai</td>';
                }else{
                    s+='<td>Ẩn</td>';
                }

                    s+='<td>'+v.destinationPlace+'</td>'
                    +'<td>'+v.startPlace+'</td>'
                    +'<td>'+v.vehicle+'</td>'
                    +'<td><button><a href="http://localhost:8082/admin/tour-edit/'+v.id+'">Chi tiết</a></button></td>'
                        +'</tr>';

            });
            $('#data-list').html(s);

        }

        function paging(totalPage,currentPage) {
            $('#pagination-test').twbsPagination({
                totalPages: totalPage,
                startPage: currentPage,
                visiblePages: 10,
                last:'Cuối cùng',
                next:'Tiếp theo',
                first:'Đầu tiên',
                prev:'Phía trước',
                onPageClick: function (event, page) {
                    if (currentPage != page) {
                        var url = "/admin/tour-list";
                        url += "?page=" + page;
                        getListTour(url);
                    }
                }
            });
        }
        function getDataSearch(){
            var data = {};
            var formSearch = $('#search').serializeArray();
            // var ids = $('tbody input[type=checkbox]:checked').map(function () {
            //     return $(this).val();
            // }).get();

            $.each(formSearch,function (i,v) {
                data[""+v.name+""] = v.value;
            });

            return data;
        }
    })
})