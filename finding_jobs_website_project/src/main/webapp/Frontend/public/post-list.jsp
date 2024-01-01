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

<c:if test="${user.role_id == 2}">
    <div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-start">
                <div class="col-md-12 text-center mb-5">
                    <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${pageContext.request.contextPath}/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Danh sách <span></span></p>
                    <h1 class="mb-3 bread">Danh sách bài đăng</h1>
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${success}">
    <div class="toast" data-delay="2500" style="position:fixed; top: 100PX; left: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Thành công!',
                /* text: 'Redirecting...', */
                icon: 'success',
                timer: 3000,
                buttons: true,
                type: 'success'
            })
        </script>
    </div>
</c:if>

<c:if test="${error}">
    <div class="toast" data-delay="2500" style="position:fixed; top: 100PX; left: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Bài đăng đang có người ứng tuyển!',
                /* text: 'Redirecting...', */
                icon: 'error',
                timer: 3000,
                buttons: true,
                type: 'error'
            })
        </script>
    </div>
</c:if>

<c:if test="${user.role_id == 1}">
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

<c:if test="${user.role_id == 2}">
    <section class="ftco-section bg-light">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12 pr-lg-4">
	                <div class="row">
	                    <c:if test="${empty list}">
						    <div class="row form-group">
						        <label for="company-website-tw d-block">Danh sách bài tuyển dụng </label> <br>
						        <div class="col-md-12">
						            <a href="${pageContext.request.contextPath}/recruitment/post" class="btn px-4 btn-primary text-white">Đăng tuyển</a>
						        </div>
						    </div>
						</c:if>
						
						<c:if test="${not empty list}">
						    <c:forEach var="recruitment" items="${list}">
						        <div class="col-md-12 ">
		                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
		                                <div class="one-third mb-4 mb-md-0" onclick="window.location.href='${pageContext.request.contextPath}/recruitment/detail?id=${recruitment.id}'">
		                                    <div class="job-post-item-header align-items-center">
		                                        <span class="subadge">${recruitment.type}</span>
		
		                                        <h2 class="mr-3 text-black"><a href="${pageContext.request.contextPath}/recruitment/detail?id=${recruitment.id}">${recruitment.title}</a></h2>
		
		                                    </div>
		                                    <div class="job-post-item-body d-block d-md-flex">
											    <div class="mr-3"><span class="icon-layers"></span> <a href="#">${company.nameCompany}</a></div>
											    <div><span class="icon-my_location"></span> <span>${recruitment.address}</span></div>
											</div>
		
		                                </div>
		
		                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0" style="width: 330px !important;">
										    <a href="${pageContext.request.contextPath}/recruitment/detail?id=${recruitment.id}" class="btn btn-primary py-2 ml-2">Xem chi tiết</a>
										    <a href="${pageContext.request.contextPath}/recruitment/editpost?id=${recruitment.id}" class="btn btn-warning py-2 ml-2">Cập nhật</a>
										    <a class="btn btn-danger py-2 ml-2" href="" data-toggle="modal" data-target="#exampleModal${recruitment.id}">Xóa</a>
										</div>
		
		                            </div>
		                        </div><!-- end -->
		                        <!-- Modal -->
		                        <div class="modal fade" id="exampleModal${recruitment.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								    <div class="modal-dialog" role="document">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa ?</h5>
								                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                    <span aria-hidden="true">×</span>
								                </button>
								            </div>
								            <div class="modal-body">
								                Bài đăng : <span>${recruitment.title}</span>
								                <form action="${pageContext.request.contextPath}/recruitment/delete" method="post">
								                    <input type="hidden" class="form-control" id="id" name="id" value="${recruitment.id}">
								                    <div class="modal-footer mt-1">
								                    	<input type="hidden" name="page" value="${param.page }">
								                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
								                        <button type="submit" class="btn btn-danger">Xóa</button>
								                    </div>
								                </form>
								            </div>
								        </div>
								    </div>
								</div>
	
	                        <!-- Modal -->
						    </c:forEach>
						</c:if>	
	                </div>
	                <div class="row mt-5">
	                    <div class="col text-center">
	                        <div class="block-27">
							    <ul>
							        
							        <c:forEach begin="1" end="${numberOfPages }" varStatus="state">
							            <li class="${numberPage == state.index ? 'active' : ''}"><a href="${pageContext.request.contextPath}/user/list-post?page=${state.index}">${state.index}</a></li>
							        </c:forEach>
							      
							    </ul>
							</div>
	
	                    </div>
	                </div>
	            </div>
	
	        </div>
	    </div>
	</section>
</c:if>






<script>
    ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
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