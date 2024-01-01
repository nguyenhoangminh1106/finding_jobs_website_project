<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Work CV</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">

  <!-- CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/open-iconic-bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/animate.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/magnific-popup.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/aos.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/ionicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/jquery.timepicker.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/css/bootstrap-reboot.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/css/mixins/_text-hide.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/flaticon.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/icomoon.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/bootstrap/bootstrap-grid.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Frontend/assets/css/bootstrap/bootstrap-reboot.css">

  <!-- JS -->
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/Frontend/assets/js/main.js"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid px-md-4	">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/">Work CV</a>
      
          <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
    			<li class="nav-item active"><a href="${pageContext.request.contextPath}/" class="nav-link">Trang chủ</a></li>
            	<c:if test="${user.role_id == 2}">
              		<li class="nav-item cta mr-md-1"><a href="${pageContext.request.contextPath}/recruitment/post" class="nav-link">Đăng tuyển</a></li>
              		<li class="nav-item cta mr-md-1" ><a href="${pageContext.request.contextPath}/user/list-post" class="nav-link" >Danh sách bài đăng</a></li>
              		<li class="nav-item cta mr-md-1"><a href="${pageContext.request.contextPath}/profile" class="nav-link" >Hồ Sơ</a></li>
				</c:if>
			
				<c:if test="${user.role_id == 1}">
	                <li class="nav-item cta mr-md-1" ><a href="${pageContext.request.contextPath}/save-job/get-list" class="nav-link" >Công việc đã lưu</a></li>
	                <li class="nav-item cta mr-md-1" ><a href="${pageContext.request.contextPath}/user/get-list-apply" class="nav-link" >Công việc đã ứng tuyển</a></li>
	                <li class="nav-item cta mr-md-1" ><a href="${pageContext.request.contextPath}/user/get-list-company" class="nav-link" >Công ty đã theo dõi</a></li>	                
	                <li class="nav-item cta mr-md-1"><a href="${pageContext.request.contextPath}/profile" class="nav-link" >Hồ Sơ</a></li>	                  		
				</c:if>                                              	
                
                <c:if test="${!msg_register_success}">
    				<li class="nav-item cta cta-colored"><a href="${pageContext.request.contextPath}/auth/login" class="nav-link">Đăng nhập</a></li>
				</c:if>
				<c:if test="${msg_register_success}">
    				<li class="nav-item cta cta-colored"><a href="${pageContext.request.contextPath}/auth/logout" class="nav-link">Đăng xuất</a></li>
				</c:if>              	
            </ul>
          </div>
        </div>
      </nav>
<!-- END nav -->
<c:if test="${success}">
    <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Xóa thành công!',
                /* text: 'Redirecting...', */
                icon: 'success',
                timer: 3000,
                buttons: true,
                type: 'success'
            })
        </script>
    </div>
</c:if>

<!-- END nav -->
<c:if test="${user.role_id == 1}">
    <div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-start">
                <div class="col-md-12 text-center mb-5">
                    <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${pageContext.request.contextPath}/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span></p>
                    <h1 class="mb-3 bread">Danh sách công việc đã ứng tuyển</h1>
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${user.role_id == 2}">
    <div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-start">
                <div class="col-md-12 text-center mb-5">
                    <h1 class="mb-3 bread">Không tìm thấy trang yêu cầu</h1>
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${user.role_id == 1}">
    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 pr-lg-5">
                    <c:if test="${not empty applyJobList}">
                        <div class="row">
                            <c:forEach var="applyJob" items="${applyJobList}" varStatus="index">
                                <div class="col-md-12 ">
		                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
									    <div class="one-third mb-4 mb-md-0">
									        <div class="job-post-item-header align-items-center">
									            <span class="subadge">${applyJob.type}</span>
									            <h2 class="mr-3 text-black"><a href="${pageContext.request.contextPath}/recruitment/detail?id=${applyJob.id}&company_id1=${applyJob.company_id}">${applyJob.title}</a></h2>
									        </div>
									        <div class="job-post-item-body d-block d-md-flex">
									            <div class="mr-3"><span class="icon-layers"></span> <a href="#">${applyCompanyList.get(index.index).nameCompany}</a></div>
									            <div><span class="icon-my_location"></span> <span>${applyJob.address}</span></div>
									        </div>
									    </div>
									    <input type="hidden" value="${applyJob.id}">
									    <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
									        <c:if test="${approveStatusList.get(index.index) == true}">
									            <p style="color: #1e7e34;font-weight: bold;margin-top: 10px">Đã duyệt</p>
									        </c:if>
									        <c:if test="${approveStatusList.get(index.index) == false}">
									            <p style="color: red;font-weight: bold;margin-top: 10px">Đợi duyệt</p>
									        </c:if>
									    </div>
									</div>
		
		                        </div><!-- end -->
		                        
		                        
                            </c:forEach>
                        </div>
                    </c:if>
                    
                    <c:if test="${empty applyJobList}">
					    <div style="text-align: center">
					        <p style="color:red;">Danh sách trống</p>
					    </div>
					</c:if>
                </div>
            </div>
        </div>
    </section>
</c:if>



<script>
    function apply(id){
        var name = "#idRe" +id;
        var nameModal = "#exampleModal" +id;
        var nameFile = "#fileUpload"+id;
        var nameText = "#text" +id;
        var idRe = $(name).val();
        var textvalue = $(nameText).val();
        var fileUpload = $(nameFile).get(0);
        var files = fileUpload.files;
        var formData = new FormData();
        formData.append('file', files[0]);
        formData.append('idRe', idRe);
        formData.append('text', textvalue);
        if(files[0] == null){
            swal({
                title: 'Bạn cần phải chọn cv!',
                /* text: 'Redirecting...', */
                icon: 'error',
                timer: 3000,
                buttons: true,
                type: 'error'
            })
        } else {
            $.ajax(
                {
                    type: 'POST',
                    url: '/user/apply-job/',
                    contentType: false,
                    processData: false,
                    data: formData,
                    success: function (data) {
                        if(data == "false"){
                            swal({
                                title: 'Bạn cần phải đăng nhập!',
                                /* text: 'Redirecting...', */
                                icon: 'error',
                                timer: 3000,
                                buttons: true,
                                type: 'error'
                            })
                        }else if(data == "true"){
                            swal({
                                title: 'Ứng tuyển thành công!',
                                /* text: 'Redirecting...', */
                                icon: 'success',
                                timer: 3000,
                                buttons: true,
                                type: 'success'
                            })
                            $(nameModal).modal('hide');
                            $('#fileUpload').val("");
                        }else{
                            swal({
                                title: 'Bạn đã ứng tuyển công việc này!',
                                /* text: 'Redirecting...', */
                                icon: 'error',
                                timer: 3000,
                                buttons: true,
                                type: 'error'
                            })
                            $(nameModal).modal('hide');
                            $('#fileUpload').val("");
                        }
                    },
                    error: function (err) {
                        alert(err);
                    }
                }
            )
        }

    }
    function save(id){
        var name = "#idRe" +id;
        var idRe = $(name).val();
        var formData = new FormData();
        formData.append('idRe', idRe);
        $.ajax(
            {
                type: 'POST',
                url: '/save-job/save/',
                contentType: false,
                processData: false,
                data: formData,
                success: function (data) {
                    if(data == "false"){
                        swal({
                            title: 'Bạn cần phải đăng nhập!',
                            /* text: 'Redirecting...', */
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                    }else if(data == "true"){
                        swal({
                            title: 'Lưu thành công!',
                            /* text: 'Redirecting...', */
                            icon: 'success',
                            timer: 3000,
                            buttons: true,
                            type: 'success'
                        })
                    }else{
                        swal({
                            title: 'Bạn đã lưu bài này rồi!',
                            /* text: 'Redirecting...', */
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                    }
                },
                error: function (err) {
                    alert(err);
                }
            }
        )
    }
</script>

<footer class="footer mt-auto py-3 bg-light">
    <div class="container">
        <span class="text-muted">&copy; 2023 Your Company Name. All rights reserved.</span>
        <div class="float-end">
            <a href="#" class="text-muted">Terms of Service</a> |
            <a href="#" class="text-muted">Privacy</a> |
            <a href="#" class="text-muted">Support</a>
        </div>
    </div>
</footer>

</body>
</html>