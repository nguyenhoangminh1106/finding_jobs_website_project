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

<c:if test="${user.role_id == 1}">
    <div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-start">
                <div class="col-md-12 text-center mb-5">
                    <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${pageContext.request.contextPath}/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span></p>
                    <h1 class="mb-3 bread">Danh sách công việc đã lưu</h1>
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${user_role.id == 2}">
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
	            
	            	<c:if test="${not empty saveJobList }">
					    <div class="row">
					        <c:forEach var="saveJob" items="${saveJobList}" varStatus="index">
					            <div class="col-md-12 ">
								    <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
								        <div class="one-third mb-4 mb-md-0">
								            <div class="job-post-item-header align-items-center">
								                <span class="subadge">${saveJob.type}</span>
								                <h2 class="mr-3 text-black"><a href="${pageContext.request.contextPath}/recruitment/detail?id=${recruitment.id}">${saveJob.title}</a></h2>
								            </div>
								            <div class="job-post-item-body d-block d-md-flex">
								                <div class="mr-3"><span class="icon-layers"></span> <a href="#">Company ID: ${saveJob.company_id}</a></div>
								                <div><span class="icon-my_location"></span> <span>${saveJob.address}</span></div>
								            </div>
								        </div>
								        <input type="hidden" id="${'idRe'}${saveJob.id}" value="${saveJob.id}">
								        <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
								            <c:if test="${user.role_id == 1}">
												     <form action="${pageContext.request.contextPath}/user/unsaveJob">
										             	<input type="hidden" name="user_id" value="${user.id }">
										             	<input type="hidden" name="recruitment_id" value="${saveJob.id }">
										             	<input type="hidden" name="currentURL" value="${pageContext.request.contextPath}/recruitment/search">
										                <input type="submit" class="btn btn-secondary" value="Hủy lưu" >  	
										             </form>
								        
								            	<a data-toggle="modal" data-target='#exampleModal<c:out value="${saveJob.id}"/>' class="btn btn-primary m-1">Apply Job</a>
					                        </c:if>	
								        </div>
								    </div>
								</div><!-- end -->
		
		                        <!-- Modal -->
		                        <div class="modal fade" id="exampleModal${saveJob.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								    <div class="modal-dialog" role="document">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h5 class="modal-title" id="exampleModalLabel">Ứng tuyển: <span>${saveJob.title}</span></h5>
								                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                    <span aria-hidden="true">×</span>
								                </button>
								            </div>
								
								            <form method="post" action="${pageContext.request.contextPath}/user/apply-job">
								            	<input type="hidden" name="recruitment_id" value="${saveJob.id }">
								            	<input type="hidden" name="user_id" value="${user.id }">
								                <div class="modal-body">
								                    <div class="row">
								                        <div class="col-12">
								                            <select name="send_cv_option" id='choose${saveJob.id}' onchange='choosed(${saveJob.id})' class="form-control" aria-label="Default select example">
								                                <option selected>Chọn phương thức nộp</option>
								                                <option value="1">Dùng cv đã cập nhật</option>
								                                <option value="2">Nộp cv mới</option>
								                            </select>
								                            <label for="intro_cv" class="col-form-label">Giới thiệu:</label>
								                            <textarea name="intro_cv" rows="10" cols="3" class="form-control"></textarea>
								                        </div>
								                        
								                        <div id='loai2${saveJob.id}' style="display:none" class="col-12">
								                            <label for="fileUpload" class="col-form-label">Chọn cv:</label>
								                            <input name="file" type="file" class="form-control" id='fileUpload${saveJob.id}' name="file">
								                          	
								                            
								                        </div>
								                    </div>
								                    <div class="modal-footer">
								                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
								                        <input type="submit" value="Nộp"  class="btn btn-primary">
								                        
								                    </div>
								                </div>
								            </form>
								        </div>
								    </div>
								</div>
					        </c:forEach>
					    </div>
					</c:if>
	
	                <c:if test="${empty saveJobList }">
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
    function apply1(id){
        var name = "#idRe" +id;
        var nameModal = "#exampleModal" +id;
        var nameFile = "#fileUpload"+id;
        var nameText = "#text" +id;
        var idRe = $(name).val();
        var textvalue = $(nameText).val();
        var formData = new FormData();
        formData.append('idRe', idRe);
        formData.append('text', textvalue);
        $.ajax(
            {
                type: 'POST',
                url: '/user/apply-job1/',
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
    function choosed(id){
        var name = '#choose' + id;
        var name1 = 'loai1' + id;
        var name2 = 'loai2' + id;
        var button1 = 'button1' + id;
        var button2 = 'button2' + id;
        var giaitri = $(name).val();
        if(giaitri == 1){
            document.getElementById(name1).style.display = 'block'
            document.getElementById(name2).style.display = 'none'
            document.getElementById(button1).style.display = 'block'
            document.getElementById(button2).style.display = 'none'
        }else{
            document.getElementById(name2).style.display = 'block'
            document.getElementById(name1).style.display = 'none'
            document.getElementById(button2).style.display = 'block'
            document.getElementById(button1).style.display = 'none'
        }
    }

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