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



<div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <h1 class="mb-3 bread">Hồ sơ </h1>
                <div style="margin-left: 0px" id="divImage" >
				    <img id="avatar" height="100" width="100" style="border-radius: 50px" src="<c:url value='/user/image' />">
				</div>
            </div>
        </div>
    </div>
</div>

<!-- HOME -->
<c:choose>
    <c:when test="${user.status == 1}">
        <div class="container-fluid" style="text-align: center">
            <p style="font-size: 20px;font-weight: bold;color: #aaa;margin-top: 10px">Xác thực email đăng nhập</p>
            <div style="width: 600px;height: 400px;border-radius: 5px;
            box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;padding: 15px">
                <p style="line-height: 35px;font-size: 16px">Xin chào, <span>${user.fullName}</span> và làm theo hướng dẫn trong email.
                    Trường hợp không nhận được email, bạn vui lòng bấm nút Nhận email xác thực dưới đây.</p>
                <div class="row form-group">
                    <form action="" method="get" class="col-md-12">
                        <input type="hidden" value="${user.email}" name="email" class="btn px-4 btn-primary text-white">
                        <input type="submit" value="Nhận email xác thực" class="btn px-4 btn-primary text-white">
                    </form>
                </div>
                <p>Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br></p>
                - Điện thoại:<span style="color:#5f80ec">(024) 6680 5588</span><br>
                - Email: <a href="" style="color:#5f80ec"> hotro@workcv.vn</a>
            </div>
        </div>
    </c:when>
    <c:when test="${comfirm_await}">
        <div style="width: 600px;height: 400px;border-radius: 5px;
        box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;padding: 15px">
            <p style="line-height: 35px;font-size: 16px">Xin chào, <span>${user.fullName}</span> .Bạn đã gửi yêu cầu xác thực thành công,
                vui lòng kiểm tra mail để xác thực.Cảm ơn bạn!!!
            </p>
            <p>Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br></p>
            - Điện thoại:<span style="color:#5f80ec">(024) 6680 5588</span><br>
            - Email: <a href="#" style="color:#5f80ec"> hotro@workcv.vn</a>
        </div>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${user.status == 1 && user.role_id == 1}">
        <section class="site-section" style="margin-top: 10px">
		    <div class="container">
		        <form action="${pageContext.request.contextPath}/user/update-cv" method="post" enctype="multipart/form-data">
		            <div class="row align-items-center mb-5">
		                <div class="col-lg-8 ">
						    <div class="d-flex align-items-center">						      
						        	<div class="form-group" style="margin-top: 15px">
					                    <label for="image">Cập nhật CV</label> <br>
					                    <input type="file" name="file" class="form-control" placeholder="Upload file"> <br><br>			
					                </div>
					                <div class="m-5">
				                            <button type="submit" class="btn btn-block btn-primary btn-md">Lưu CV</button>
				                    </div>
						    </div>
						    <c:choose>
						        <c:when test="${not empty user.cv}">
						            <p id="cvName">${user.fullName}</p>
						            <a class="btn btn-primary" id="nameCv" target="_blank" href="${pageContext.request.contextPath}/user/cv">Xem cv</a>
						        </c:when>
						    </c:choose>
						</div>
		
		
		                <div class="col-lg-4">
		                    <div class="row">
		                    </div>
		                </div>
		            </div>
		        </form>
		
		        <form action="${pageContext.request.contextPath}/user/update-profile" method="post"  enctype="multipart/form-data">
		            <div class="row align-items-center mb-5">
		                <div class="col-lg-8 mb-4 mb-lg-0">
		                    <div class="d-flex align-items-center">
		                        <div>
		                            <h2>Cập nhật thông tin</h2>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-lg-4">
		                    <div class="row">
		
		                        <div class="col-6">
		                            <button type="submit" class="btn btn-block btn-primary btn-md">Lưu thông tin</button>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="row mb-5">
					    <div class="col-lg-12">
					        <div class="p-4 p-md-5 border rounded">
					        	<div class="form-group">
					                    <label for="image">Cập nhật ảnh đại diện</label> <br>
					                    <input type="file" name="image" class="form-control" placeholder="Insert url"> <br><br>
					            </div>
					        
					            <h3 class="text-black mb-5 border-bottom pb-2">Thông tin chi tiết</h3>
					            
					            <div class="form-group">
					                <label for="email">Email</label>
					                <input type="email" class="form-control" id="email" name="email" value="${empty user.email ? null : user.email}" required placeholder="you@yourdomain.com" readonly>
					            </div>
					            <div class="form-group">
					                <label for="job-title">Full name</label>
					                <input type="text" class="form-control" name="fullName" value="${empty user.fullName ? null : user.fullName}" required id="job-title" placeholder="Full name">
					            </div>
					            <div class="form-group">
					                <label for="job-location">Địa chỉ</label>
					                <input type="text" name="address" value="${empty user.address ? null : user.address}" class="form-control" id="job-location" required placeholder="e.g. New York">
					            </div>
					            <div class="form-group">
					                <label for="job-location">Số điện thoại</label>
					                <input type="text" name="phoneNumber" value="${empty user.phoneNumber ? null : user.phoneNumber}" class="form-control" id="job-location" required placeholder="+ 84">
					            </div>
					            <div class="form-group">
					                <label for="job-location">Mô tả bản thân</label>
					                <textarea name="description" class="form-control" id="editor" placeholder="Mô tả">${empty user.description ? null : user.description}</textarea>
					            </div>
					        </div>
					    </div>
					</div>
		
		        </form>
		    </div>
		</section>
    </c:when>
</c:choose>


<!-- Modal -->
<div class="modal fade"  id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa ?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Cv : <span id="cvXoa" ></span>
                <c:choose>
				    <c:when test="${not empty user.cv}">
				        <span>${user.cv}</span>
				    </c:when>
				</c:choose>
                <form action="/user/deleteCv" method="get">
                    <div class="modal-footer mt-1">
                        <input type="hidden"  name="idCv">
                        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-danger">Xóa</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<c:choose>
    <c:when test="${user.status == 1 && user.role_id == 2}">
        <section class="site-section" style="margin-top: 10px">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-6 mb-5">
	                <h2 class="mb-4">Thông tin cá nhân</h2>
	                <form action="${pageContext.request.contextPath}/user/update-profile" method="post" enctype="multipart/form-data">
	
	                    <div class="row mb-5">
						    <div class="col-lg-12">
						        <div class="p-4 p-md-5 border rounded">
						        	<div class="form-group">
					                    <label for="image">Cập nhật ảnh đại diện</label> <br>
					                    <input type="file" name="image" class="form-control" placeholder="Insert url"> <br><br>
					                    <div id="divLogo">
										    <img id="avatar1" height="100" width="100" style="border-radius: 50px" src="<c:url value='/user/image' />">
										</div>
				
					                </div>
						            <div class="form-group">
						                <label for="email">Email</label>
						                <input type="email" class="form-control" id="email" name="email" value="${empty user.email ? null : user.email}" readonly placeholder="you@yourdomain.com">
						            </div>
						            <div class="form-group">
						                <label for="fullName">Họ và tên</label>
						                <input type="text" class="form-control" name="fullName" value="${empty user.fullName ? null : user.fullName}" id="job-title" required placeholder="Full name">
						            </div>
						            <div class="form-group">
						                <label for="address">Địa chỉ</label>
						                <input type="text" name="address" value="${empty user.address ? null : user.address}" required class="form-control" id="job-location" placeholder="e.g. New York">
						            </div>
						            <div class="form-group">
						                <label for="phoneNumber">Số điện thoại</label>
						                <input type="text" name="phoneNumber" value="${empty user.phoneNumber ? null : user.phoneNumber}" required class="form-control" id="job-location" placeholder="+ 84">
						            </div>
						            <div class="form-group">
						                <label for="description">Mô tả bản thân</label>
						                <textarea name="description" class="form-control" id="editor" placeholder="Mô tả">${empty user.description ? null : user.description}</textarea>
						            </div>
						            <div class="row form-group">
						                <div class="col-md-12">
						                    <input type="submit" value="Lưu thông tin" class="btn px-4 btn-primary text-white">
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
	
	                </form>
	            </div>
	            <div class="col-lg-6">
	                <h2 class="mb-4">Thông tin công ty</h2>
	                
	                <form action="${pageContext.request.contextPath}/user/update-company" method="post" enctype="multipart/form-data" >
	                    <div class="row mb-5">
	                        <div class="col-lg-12">
	                            <div class="p-4 p-md-5 border rounded">
	                            
	                            	<div class="form-group">
					                    <label for="image">Cập nhật logo</label> <br>
					                    <input type="file" name="logo" class="form-control" placeholder="Insert url"> <br><br>
					                    <div id="divLogo">
										    <img id="avatar1" height="100" width="100" style="border-radius: 50px" src="<c:url value='/company/image' />">
										</div>
				
					                </div>
								    <div class="form-group">
								        <label for="email">Email</label>
								        <input type="text" class="form-control" required id="email1" value="${empty company.email ? null : company.email}" name="email" placeholder="${company.email }">
								    </div>
								    <div class="form-group">
								        <label for="job-title">Tên công ty</label>
								        <input type="text" class="form-control" name="nameCompany" value="${empty company.nameCompany ? null : company.nameCompany}" id="job-title"  placeholder="${company.nameCompany }" required>
								        <input type="hidden" class="form-control" name="user_id" value="${user.id}" id="job-title" placeholder="Full name">
								        <input type="hidden" class="form-control" name="id" value="${empty company.id ? null : company.id}" id="job-title" placeholder="Full name">
								    </div>
								    <div class="form-group">
								        <label for="job-location">Địa chỉ</label>
								        <input type="text" name="address" value="${empty company.address ? null : company.address}" required class="form-control" id="job-location" placeholder="${company.address }">
								    </div>
								    <div class="form-group">
								        <label for="job-location">Số điện thoại công ty</label>
								        <input type="text" name="phoneNumber" value="${empty company.phoneNumber ? null : company.phoneNumber}" required class="form-control" id="job-location" placeholder="${company.phoneNumber }">
								    </div>
								    <div class="form-group">
								        <label for="job-location">Mô tả công ty</label>
								        <textarea name="description" class="form-control" id="editorN" placeholder="Mô tả">${empty company.description ? null : company.description}</textarea>
								    </div>
								    <div class="row form-group" >
								        <div class="col-md-12">
								            <input type="submit" value="Lưu thông tin" class="btn px-4 btn-primary text-white">
								        </div>
								    </div>
								</div>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</section>
    </c:when>
</c:choose>


<script>
    ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
    ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
</script>
<script>
    $(function () {
        $('#fileUpload').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload').get(0);
                var files = fileUpload.files;
                var email = $("#email").val();
                var formData = new FormData();
                formData.append('file', files[0]);
                formData.append('email', email);
                if(files[0] == null){
                    // document.getElementById("change").style.backgroundColor = 'red';
                    // $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: '/user/upload/',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "Error"){
                                    document.getElementById("change").style.backgroundColor = 'red';
                                    swal({
                                        title: 'Cập nhật ảnh đại diện thất bại!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    $("#divImage").css("display","block")
                                }else{
                                    $('#avatar').attr('src', urlImage)
                                    swal({
                                        title: 'Cập nhật ảnh đại diện thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function (err) {
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
</script>

<script>
    $(function () {
        $('#fileUpload2').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload2').get(0);
                var files = fileUpload.files;
                var email = $("#email").val();
                var formData = new FormData();
                formData.append('file', files[0]);
                formData.append('email', email);
                if(files[0] == null){
                    // document.getElementById("change").style.backgroundColor = 'red';
                    // $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: '/user/upload-company/',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "Error"){
                                    document.getElementById("change").style.backgroundColor = 'red';
                                    swal({
                                        title: 'Cập nhật logo thất bại!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    $("#divLogo").css("display","block")
                                }else{
                                    $('#avatar1').attr('src', urlImage)
                                    swal({
                                        title: 'Cập nhật logo thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function (err) {
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
</script>

<script>
    $(function () {
        $('#fileUpload1').change(function () {
            if (window.FormData !== undefined) {
                var fileUpload = $('#fileUpload1').get(0);
                var files = fileUpload.files;
                var formData = new FormData();
                formData.append('file', files[0]);
                if(files[0] == null){
                    // document.getElementById("change").style.backgroundColor = 'red';
                    // $('#text').val(" ❌ Cập nhật ảnh thất bại");
                    $(".toast").toast("show");
                } else {
                    $.ajax(
                        {
                            type: 'POST',
                            url: '/user/uploadCv',
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function (urlImage) {
                                console.log(urlImage)
                                if(urlImage == "false"){
                                    // document.getElementById("change").style.backgroundColor = 'red';

                                    swal({
                                        title: 'Cần chọn đúng loại file (PDF)!',
                                        /* text: 'Redirecting...', */
                                        icon: 'error',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'error'
                                    })
                                    // $("#divImage").css("display","block")
                                }else{
                                    // $('#avatar').attr('src', urlImage)
                                    document.getElementById('nameCv').innerHTML = 'Xem cv';
                                    document.getElementById('nameCv').href = "http://localhost:8080/resources/uploads/"+urlImage ; //or grab it by tagname etc
                                    document.getElementById('xoa').innerHTML = 'Xóa cv';
                                    document.getElementById("cvName").innerHTML = urlImage;
                                    document.getElementById("cvXoa").innerHTML = urlImage;

                                    swal({
                                        title: 'Cập nhật CV thành công!',
                                        /* text: 'Redirecting...', */
                                        icon: 'success',
                                        timer: 3000,
                                        buttons: true,
                                        type: 'success'
                                    })
                                }

                            },
                            error: function (err) {
                                alert(err);
                            }
                        }
                    )
                }

            }
        })
    })
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