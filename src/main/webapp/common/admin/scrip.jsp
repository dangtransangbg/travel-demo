<script src="<c:url value='/templates/ckeditor/ckeditor.js'/>"></script>
<script src="<c:url value='/ckfinder/ckfinder.js'/>"></script>

<script src="<c:url value='/plugins/jquery/jquery.min.js'/>"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<c:url value='/plugins/jquery-ui/jquery-ui.min.js'/>"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<c:url value='/plugins/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<!-- ChartJS -->
<script src="<c:url value='/plugins/chart.js/Chart.min.js'/>"></script>
<!-- Sparkline -->
<script src="<c:url value='/plugins/sparklines/sparkline.js'/>"></script>
<!-- JQVMap -->
<script src="<c:url value='/plugins/jqvmap/jquery.vmap.min.js'/>"></script>
<script src="<c:url value='/plugins/jqvmap/maps/jquery.vmap.usa.js'/>"></script>
<!-- jQuery Knob Chart -->
<script src="<c:url value='/plugins/jquery-knob/jquery.knob.min.js'/>"></script>
<!-- daterangepicker -->
<script src="<c:url value='/plugins/moment/moment.min.js'/>"></script>
<script src="<c:url value='/plugins/daterangepicker/daterangepicker.js'/>"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="<c:url value='/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js'/>"></script>
<!-- Summernote -->
<%--<script src="<c:url value='/plugins/summernote/summernote-bs4.min.js'/>"></script>--%>
<!-- overlayScrollbars -->
<script src="<c:url value='/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js'/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/js/admin/adminlte.js'/>"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value='/js/admin/demo.js'/>"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<c:url value='/js/admin/dashboard.js'/>"></script>

<script>

    $( document ).ready(function() {
        header();

        function header() {
            var navbar_dark_skins = [
                'navbar-primary',
                'navbar-secondary',
                'navbar-info',
                'navbar-success',
                'navbar-danger',
                'navbar-indigo',
                'navbar-purple',
                'navbar-pink',
                'navbar-navy',
                'navbar-lightblue',
                'navbar-teal',
                'navbar-cyan',
                'navbar-dark',
                'navbar-gray-dark',
                'navbar-gray'
            ];

            var navbar_light_skins = [
                'navbar-light',
                'navbar-warning',
                'navbar-white',
                'navbar-orange'
            ];

            var navbar_all_colors = navbar_dark_skins.concat(navbar_light_skins);
            if (getCookie("color_header") || getCookie("color_header") != '-1'){
                var color = getCookie("color_header")
            }


            var $main_header = $('.main-header')
            $main_header.removeClass('navbar-dark').removeClass('navbar-light')
            navbar_all_colors.forEach(function (color) {
                $main_header.removeClass(color)
            })
            if (navbar_dark_skins.indexOf(color) > -1) {
                $main_header.addClass('navbar-dark')
            } else {
                $main_header.addClass('navbar-light')
            }

            $main_header.addClass(color);


        }

    });

</script>
</body>
</html>
