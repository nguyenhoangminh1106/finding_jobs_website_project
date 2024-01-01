<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="finding_jobs_website_project.instance.Company" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Skillhunt - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<!-- END nav -->
<c:if test="${success}">
    <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Duyệt thành công!',
                /* text: 'Redirecting...', */
                icon: 'success',
                timer: 3000,
                buttons: true,
                type: 'success'
            })
        </script>
    </div>
</c:if>

<c:if test="${param.following_success}">
    <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Đã theo dõi!',
                /* text: 'Redirecting...', */
                icon: 'success',
                timer: 3000,
                buttons: true,
                type: 'success'
            })
        </script>
    </div>
</c:if>

<c:if test="${param.following_error or param.unfollowing_error}">
    <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Lưu thất bại!',
                /* text: 'Redirecting...', */
                icon: 'error',
                timer: 3000,
                buttons: true,
                type: 'error'
            })
        </script>
    </div>
</c:if>

<c:if test="${param.unfollowing_success}">
    <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Hủy theo dõi!',
                /* text: 'Redirecting...', */
                icon: 'success',
                timer: 3000,
                buttons: true,
                type: 'success'
            })
        </script>
    </div>
</c:if>

<div class="hero-wrap hero-wrap-2" style="background-image: url('/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${pageContext.request.contextPath}/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span></p>
                <h1 class="mb-3 bread">Chi tiết công việc</h1>
            </div>
        </div>
    </div>
</div>

<section style="margin-top: 10px" class="site-section">
    <div class="container">
        <div class="row align-items-center mb-5">
            <div class="col-lg-8 mb-4 mb-lg-0">
                <div class="d-flex align-items-center">
                    <div class="border p-2 d-inline-block mr-3 rounded">
					    <img width="100" height="100" src="${pageContext.request.contextPath}/company/image?company_id1=${company.id}" alt="Image">
					</div>

                    <div>
                        <h2>${company.nameCompany}</h2>
                        <div>
                            <span class="icon-briefcase mr-2">${company.email }</span><a class="ml-0 mr-2 mb-2"></a>
                            <span  class="icon-room mr-2"></span >${company.address }<span class="m-2"></span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div  class="row">
                    <div class="col-6">
                        
                        <c:if test="${user.role_id == 1 }">
                        	<c:if test="${param.following_success == false or following_success == false}">
							     <form method="get" action="${pageContext.request.contextPath}/user/follow_company">
							        <input type="hidden" name="currentURL" value="${pageContext.request.contextPath}/recruitment/detail?id=${recruitment.id }&company_id1=${company.id }">
							        <input type="hidden" name="user_id" value="${user.id }">
							        <input type="hidden" name="company_id" value="${company.id }">
							     	<div>
							     		<input type="submit" class="btn btn-block btn-light btn-md"  value="Theo dõi">
							     		<span class="icon-heart-o mr-2 text-danger"></span>
							     	</div>
								</form>
							</c:if>
							
							<c:if test="${param.following_success == true  or following_success == true}">
							     <form method="get" action="${pageContext.request.contextPath}/user/unfollow_company">
							        <input type="hidden" name="currentURL" value="${pageContext.request.contextPath}/recruitment/detail?id=${recruitment.id }&company_id1=${company.id }">
							        <input type="hidden" name="user_id" value="${user.id }">
							        <input type="hidden" name="company_id" value="${company.id }">
							     	<div>
							     		<input type="submit" class="btn btn-block btn-light btn-md"  value="Hủy theo dõi">
							     		<span class="icon-heart mr-2 text-danger"></span>
							     	</div>
								</form>
							</c:if>
                        </c:if>
						
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="mb-5">

                    <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Mô tả công việc</h3>
                    <p><c:out value='${recruitment.description}' escapeXml='false'/></p>

                </div>

            </div>
            <div class="col-lg-4">
                <div class="bg-light p-3 border rounded mb-4">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công việc</h3>
                    <ul class="list-unstyled pl-3 mb-0">
                       <li class="mb-2"> <strong class="text-black">Ngày tạo: </strong> <span>${recruitment.created_at }</span> </li>
                        <li class="mb-2"><strong class="text-black">Kiểu công việc: </strong> <span>${recruitment.type}</span></li>
                        <li class="mb-2"><strong class="text-black">Loại công việc: </strong> <span>${recruitment.category_id }</span></li>
                        <li class="mb-2"><strong class="text-black">Kinh nghiệm: </strong> <span>${recruitment.experience } </span></li>
                        <li class="mb-2"><strong class="text-black">Đại chỉ: </strong> <span>${recruitment.address }</span></li>
                        <li class="mb-2"><strong class="text-black">Lương: </strong> <span> ${recruitment.salary } </span></li>
                        <li class="mb-2"><strong class="text-black">Số lượng: </strong><span>${recruitment.quantity }</span></li>
                        <li class="mb-2"><strong class="text-black">Hạn nộp cv: </strong><span>${recruitment.deadline }</span></li>
                    </ul>
                </div>

                <div class="bg-light p-3 border rounded">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
                    <div class="px-3">
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-facebook"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-linkedin"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ứng tuyển: <span></span></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="/user/apply-job">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
						    <label for="fileUpload" class="col-form-label">Chọn cv:</label>
						    <input type="file" class="form-control" id='${fileUpload}${recruitment.id}' name="file" required>
						    <label for="fileUpload" class="col-form-label">Giới thiệu:</label>
						    <textarea rows="10" cols="3" class="form-control"></textarea>
						</div>


                    </div>
                    <div class="modal-footer">
					    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
					    <button type="button" onclick="apply(${recruitment.id})" class="btn btn-primary">Nộp</button>
					</div>
                </div>
            </form>
        </div>
    </div>
</div>

<section class="site-section" id="next">
    <div class="container">

        <div class="row mb-5 justify-content-center">
		    <div class="col-md-7 text-center">
		        <c:choose>
		            <c:when test="${not empty applicants and user.role_id == 2  and userCompanyId == recruitment.company_id}">
		                <h2 class="section-title mb-2">Danh sách ứng viên ứng tuyển</h2>
		            </c:when>
		        </c:choose>
		    </div>
		</div>
		
		<c:if test="${not empty applicants and user.role_id == 2 and userCompanyId == recruitment.company_id}">
		    <div class="row">
	            <div class="col-lg-12 pr-lg-4">
	                <div class="row">
	                    
	                    <c:if test="${not empty applicants}">
						    <c:forEach var="applicant" items="${applicants}" varStatus="applyPost_index">
						        <div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
						            <div class="team d-md-flex p-4 bg-white">
						                <img id="avatar" height="100" width="100" style="border-radius: 50px" src="<c:url value='/user/image?user_id1=${applicant.id }' />">
						                <div class="text pl-md-4">
						                    <h5 class="location mb-0"><c:out value="${applicant.fullName}"/></h5>
						                    <p style="display: block;color: black"><c:out value="${applyPost.user.address}"/></p>
						                    <span class="position" style="display: block;color: black"><c:out value="${applicant.email}"/></span>
						                    <p class="mb-4" style="width: 700px"><c:out value="${applyPosts.get(applyPost_index.index).text}" escapeXml='false'/></p>
						                    <div class="row">
						                        <p><a class="btn btn-secondary" id="nameCv" target="_blank" href="${pageContext.request.contextPath}/user/cv?user_id=${applicant.id}">Xem cv</a></p>
						                        
						                        <c:if test="${applyPosts.get(applyPost_index.index).status == 0}">
						                        	<form method="get" action="${pageContext.request.contextPath}/user/approve">
						                        		<input type="hidden" name="applypost_id" value="${applyPosts.get(applyPost_index.index).id}">
						                        		<input type="hidden" name="currentURL" value="${pageContext.request.contextPath}/recruitment/detail?id=${recruitment.id }&company_id1=${company.id }">
						                        		<input type="submit" value="Duyệt" class="btn btn-outline-primary" >
						                        	</form>
						                        </c:if>
						                        <p style="margin-left: 10px;margin-top: 15px"><span style="color: #1e7e34;font-weight: bold" ><c:if test="${applyPosts.get(applyPost_index.index).status == 1}">Đã duyệt</c:if></span></p>
						                    </div>
						                </div>
						            </div>
						        </div>
						    </c:forEach>
						</c:if>
	                    
	                    
	                    <c:if test="${empty applicants}">
						    <p>Chưa có ứng cử viên nào ứng tuyển</p>
						</c:if>

	                </div>
	            </div>
	
	            <div class="col-lg-4 sidebar">
	                <div class="sidebar-box bg-white p-4 ftco-animate">
	                    <h3 class="heading-sidebar">Browse Category</h3>
	                    <form action="#" class="search-form mb-3">
	                        <div class="form-group">
	                            <span class="icon icon-search"></span>
	                            <input type="text" class="form-control" placeholder="Search...">
	                        </div>
	                    </form>
	                    <form action="#" class="browse-form">
	                        <label for="option-job-1"><input type="checkbox" id="option-job-1" name="vehicle" value="" checked> Website &amp; Software</label><br>
	                        <label for="option-job-2"><input type="checkbox" id="option-job-2" name="vehicle" value=""> Education &amp; Training</label><br>
	                        <label for="option-job-3"><input type="checkbox" id="option-job-3" name="vehicle" value=""> Graphics Design</label><br>
	                        <label for="option-job-4"><input type="checkbox" id="option-job-4" name="vehicle" value=""> Accounting &amp; Finance</label><br>
	                        <label for="option-job-5"><input type="checkbox" id="option-job-5" name="vehicle" value=""> Restaurant &amp; Food</label><br>
	                        <label for="option-job-6"><input type="checkbox" id="option-job-6" name="vehicle" value=""> Health &amp; Hospital</label><br>
	                    </form>
	                </div>
	
	                <div class="sidebar-box bg-white p-4 ftco-animate">
	                    <h3 class="heading-sidebar">Select Location</h3>
	                    <form action="#" class="search-form mb-3">
	                        <div class="form-group">
	                            <span class="icon icon-search"></span>
	                            <input type="text" class="form-control" placeholder="Search...">
	                        </div>
	                    </form>
	                    <form action="#" class="browse-form">
	                        <label for="option-location-1"><input type="checkbox" id="option-location-1" name="vehicle" value="" checked> Sydney, Australia</label><br>
	                        <label for="option-location-2"><input type="checkbox" id="option-location-2" name="vehicle" value=""> New York, United States</label><br>
	                        <label for="option-location-3"><input type="checkbox" id="option-location-3" name="vehicle" value=""> Tokyo, Japan</label><br>
	                        <label for="option-location-4"><input type="checkbox" id="option-location-4" name="vehicle" value=""> Manila, Philippines</label><br>
	                        <label for="option-location-5"><input type="checkbox" id="option-location-5" name="vehicle" value=""> Seoul, South Korea</label><br>
	                        <label for="option-location-6"><input type="checkbox" id="option-location-6" name="vehicle" value=""> Western City, UK</label><br>
	                    </form>
	                </div>
	
	                <div class="sidebar-box bg-white p-4 ftco-animate">
	                    <h3 class="heading-sidebar">Job Type</h3>
	                    <form action="#" class="browse-form">
	                        <label for="option-job-type-1"><input type="checkbox" id="option-job-type-1" name="vehicle" value="" checked> Partime</label><br>
	                        <label for="option-job-type-2"><input type="checkbox" id="option-job-type-2" name="vehicle" value=""> Fulltime</label><br>
	                        <label for="option-job-type-3"><input type="checkbox" id="option-job-type-3" name="vehicle" value=""> Intership</label><br>
	                        <label for="option-job-type-4"><input type="checkbox" id="option-job-type-4" name="vehicle" value=""> Temporary</label><br>
	                        <label for="option-job-type-5"><input type="checkbox" id="option-job-type-5" name="vehicle" value=""> Freelance</label><br>
	                        <label for="option-job-type-6"><input type="checkbox" id="option-job-type-6" name="vehicle" value=""> Fixed</label><br>
	                    </form>
	                </div>
	            </div>
	        </div>
		</c:if>
		
		
		
        
        <c:forEach var="recruitment" items="${listRelated}">
		    <div class="col-md-12">
		        <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
		            <div class="one-third mb-4 mb-md-0">
		                <div class="job-post-item-header align-items-center">
		                    <span class="subadge"><c:out value="${recruitment.type}"/></span>
		                    <h2 class="mr-3 text-black"><a href='<c:out value="/recruitment/detail/"/>${recruitment.id}'><c:out value="${recruitment.title}"/></a></h2>
		                </div>
		                <div class="job-post-item-body d-block d-md-flex">
		                    <div class="mr-3"><span class="icon-layers"></span> <a href="#"><c:out value="${company.nameCompany}"/></a></div>
		                    <div><span class="icon-my_location"></span> <span><c:out value="${recruitment.address}"/></span></div>
		                </div>
		            </div>
		
		            <input type="hidden" id='idRe<c:out value="${recruitment.id}"/>' value='<c:out value="${recruitment.id}"/>'>
		            <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
		                <div>
		                    <a onclick='save(<c:out value="${recruitment.id}"/>)' class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
		                        <span class="icon-heart"></span>
		                    </a>
		                </div>
		                <a data-toggle="modal" data-target='#exampleModal<c:out value="${recruitment.id}"/>' class="btn btn-primary py-2">Apply Job</a>
		            </div>
		        </div>
		    </div>
		</c:forEach>
    </div>
</section>

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