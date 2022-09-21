<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page session="false" %> --%>

<!DOCTYPE html>
<html>
	<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<!-- Basic Page Info -->
		<meta charset="utf-8" />
		<title>DeskApp - Bootstrap Admin Dashboard HTML Template</title>

		<!-- Site favicon -->
		<link
			rel="apple-touch-icon"
			sizes="180x180"
			href="${pageContext.request.contextPath}/resources/vendors/images/apple-touch-icon.png"
		/>
		<link
			rel="icon"
			type="image/png"
			sizes="32x32"
			href="${pageContext.request.contextPath}/resources/vendors/images/favicon-32x32.png"
		/>
		<link
			rel="icon"
			type="image/png"
			sizes="16x16"
			href="${pageContext.request.contextPath}/resources/vendors/images/favicon-16x16.png"
		/>

		<!-- Mobile Specific Metas -->
		<meta
			name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1"
		/>

		<!-- Google Font -->
		<link
			href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
			rel="stylesheet"
		/>
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/core.css" />
		<link
			rel="stylesheet"
			type="text/css"
			href="${pageContext.request.contextPath}/resources/vendors/styles/icon-font.min.css"
		/>
		<link
			rel="stylesheet"
			type="text/css"
			href="${pageContext.request.contextPath}/resources/src/plugins/jquery-steps/jquery.steps.css"
		/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/style.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/license.css" />

		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=G-GBZ3SGGX85"></script>
		<script>
			window.dataLayer = window.dataLayer || [];
			function gtag() {
				dataLayer.push(arguments);
			}
			gtag("js", new Date());

			gtag("config", "G-GBZ3SGGX85");
		</script>
		<!-- Google Tag Manager -->
		<script>
			(function (w, d, s, l, i) {
				w[l] = w[l] || [];
				w[l].push({ "gtm.start": new Date().getTime(), event: "gtm.js" });
				var f = d.getElementsByTagName(s)[0],
					j = d.createElement(s),
					dl = l != "dataLayer" ? "&l=" + l : "";
				j.async = true;
				j.src = "https://www.googletagmanager.com/gtm.js?id=" + i + dl;
				f.parentNode.insertBefore(j, f);
			})(window, document, "script", "dataLayer", "GTM-NXZMQSS");
		</script>
		<!-- End Google Tag Manager -->
		
		<!-- 1. Next 버튼 클릭 시 사용자가 입력한 정보의 유효성 검사 -->
		<script type="text/javascript">
		
			$(document).ready(function(){
				$('[role="menuitem"]:eq(1)').addClass('next');
				$('[role="menuitem"]:eq(2)').addClass('submit');
				
				$(".next").click(function(){
					console.log('${loginVO.jumin1}-${loginVO.jumin2}');
					let name = document.infoForm.name.value;
					let phone = document.infoForm.phone.value;
					let jumin = document.infoForm.jumin.value;
					
					console.log(name + ' / ' + phone + ' / ' + jumin1 + ' / ' + jumin2);
					
					if( name === '${loginVO.name}' 
						&& phone === '${loginVO.phone}' 
						&& jumin === '${loginVO.jumin1}-${loginVO.jumin2}' ){
						
						// 본인확인 완료. step 2로 넘어갈 수 있음!
						console.log('${loginVO.name} / ${loginVO.phone} / ${loginVO.jumin1} / ${loginVO.jumin2}');
						
					} else{
						alert('다시 확인해주세요.');
						window.location.href = "${pageContext.request.contextPath}/account/create";
					}
				});
				
				$(".submit").click(function(){
					let bankName = document.infoForm.bankName.value;
					let bankAcctNum = document.infoForm.bankAcctNum.value;
					let acctAlias = document.infoForm.acctAlias.value;
					let acctPw = document.infoForm.acctPw.value;
					let cardChk = document.infoForm.cardChk.value;
					
					$.ajax({
						url: "${pageContext.request.contextPath}/account/create",
						type: "POST",
						data: {
							bankName : bankName,
							bankAcctNum : bankAcctNum,
							acctAlias : acctAlias,
							acctPw : acctPw,
							cardChk : cardChk
						},
						dataType: "text",
						success: function(result){
							console.log('insert successful.');
						},
						error: function(){
							alert('error!');
						}
					});
					
					
				});
				
				$('#acctListBtn').click(function(){
					location.href='${pageContext.request.contextPath}/account/hanalist';
				});
				
			});
		</script>
		<!-- End of 유효성 검사 -->
		
		
		<!-- 약관동의서 Toggle -->
		<script>
		$(document).ready(function(){
			$("#btn1_toggle").click(function() {
				$("#div1").toggle();
			});
			
			$("#btn2_toggle").click(function() {
				$("#div2").toggle();
			});
			
			$("#cbx_chkAll").click(function() {
				if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});
			
			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
			
			$('#minfoChkBtn').click(function(){
				if($("#cbx_chkAll").is(":checked")){
					/* 1. update Member table : 미동의 -> 동의 */
					let id = '${loginVO.id}';
					
					
					console.log(id);
					
					$.ajax({
						url: "${pageContext.request.contextPath}/member/chkMInfoType",
						type: "POST",
						data: {
							id : id,
							chk : "true"
						},
						dataType: "text",
						success: function(result){
							alert(result);
						},
						error: function(){
							alert('error!');
						}
					});
					
				} else{
					alert('전체 동의를 클릭해주세요.');
				}
			});
		});
		</script>
		
		
		
		
		
		
		
		<!-- 3. drag&drop image file for OCN -->
		<script type="text/javascript">
		
        function setThumbnail(event){
    		var reader = new FileReader();
    		
    		reader.onload = function(event){
    			var img = document.createElement("img");
    			img.setAttribute("src", event.target.result);
    			img.setAttribute("class", "col-lg-6");
    			document.querySelector("div#image_container").appendChild(img);
    		};
    		
    		reader.readAsDataURL(event.target.files[0]);
    	}
        
        
            $(document).ready(function(){
                var objDragAndDrop = $(".dragAndDropDiv");
                
                $(document).on("dragenter",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    $(this).css('border', '2px solid #0B85A1');
                });
                $(document).on("dragover",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on("drop",".dragAndDropDiv",function(e){
                    
                    $(this).css('border', '2px dotted #0B85A1');
                    e.preventDefault();
                    var files = e.originalEvent.dataTransfer.files;
                
                    handleFileUpload(files,objDragAndDrop);
                });
                
                $(document).on('dragenter', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on('dragover', function (e){
                  e.stopPropagation();
                  e.preventDefault();
                  objDragAndDrop.css('border', '2px dotted #0B85A1');
                });
                $(document).on('drop', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                //drag 영역 클릭시 파일 선택창
                objDragAndDrop.on('click',function (e){
                    $('input[type=file]').trigger('click');
                });
 
                $('input[type=file]').on('change', function(e) {
                    var files = e.originalEvent.target.files;
                    handleFileUpload(files,objDragAndDrop);
                });
                
                function handleFileUpload(files,obj)
                {

                   for (var i = 0; i < files.length; i++) 
                   {
                        var fd = new FormData();
                        fd.append('file', files[i]);
                 
                        var status = new createStatusbar(obj); //Using this we can set progress.
                        status.setFileNameSize(files[i].name,files[i].size);
                        sendFileToServer(fd,status);
                        
                        //$(".preview").attr("src", ${fileFullPath});
                   }
                   //tagArea.appendChild(new_pTag);
                   
                   
                }
               
                
                var rowCount=0;
                function createStatusbar(obj){
                        
                    rowCount++;
                    var row="odd";
                    if(rowCount %2 ==0) row ="even";
                    this.statusbar = $("<div class='statusbar "+row+"'></div>");
                    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
                    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
                    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
                    this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
                    
                    obj.after(this.statusbar);
                 
                    this.setFileNameSize = function(name,size){
                        var sizeStr="";
                        var sizeKB = size/1024;
                        if(parseInt(sizeKB) > 1024){
                            var sizeMB = sizeKB/1024;
                            sizeStr = sizeMB.toFixed(2)+" MB";
                        }else{
                            sizeStr = sizeKB.toFixed(2)+" KB";
                        }
                 
                        this.filename.html(name);
                        this.size.html(sizeStr);
                    }
                    
                    this.setProgress = function(progress){       
                        var progressBarWidth =progress*this.progressBar.width()/ 100;  
                        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                        if(parseInt(progress) >= 100)
                        {
                            this.abort.hide();
                        }
                    }
                    
                    this.setAbort = function(jqxhr){
                        var sb = this.statusbar;
                        this.abort.click(function()
                        {
                            jqxhr.abort();
                            sb.hide();
                        });
                    }
                }
                
                function sendFileToServer(formData,status)
                {
                    var uploadURL = "${pageContext.request.contextPath}/fileUpload/post"; //Upload URL
                    var extractURL = "${pageContext.request.contextPath}/extractText";
                    var extraData ={}; //Extra Data.
                    
                    var jqXHR=$.ajax({
                            xhr: function() {
                            var xhrobj = $.ajaxSettings.xhr();
                            if (xhrobj.upload) {
                                    xhrobj.upload.addEventListener('progress', function(event) {
                                        var percent = 0;
                                        var position = event.loaded || event.position;
                                        var total = event.total;
                                        if (event.lengthComputable) {
                                            percent = Math.ceil(position / total * 100);
                                        }
                                        //Set progress
                                        status.setProgress(percent);
                                    }, false);
                                }
                            return xhrobj;
                        },
                        url: uploadURL,
                        type: "POST",
                        contentType:false,
                        processData: false,
                        cache: false,
                        data: formData,
                        success: function(data){
                        	
                            status.setProgress(100);
                 			
                            //$(".preview").attr("src", data);
                            
                            //$("#status1").append("File upload Done<br>");           
                        }
                    }); 
                 
                    status.setAbort(jqXHR);
                }
                
            });
        </script>
        <!-- End of Drag&Drop -->
	</head>
	<body>
		<div class="header">
			<div class="header-left">
				<div class="menu-icon bi bi-list"></div>
				<div
					class="search-toggle-icon bi bi-search"
					data-toggle="header_search">
				</div>
				<div class="header-search">
					<form>
						<div class="form-group mb-0">
							<i class="dw dw-search2 search-icon"></i>
							<input
								type="text"
								class="form-control search-input"
								placeholder="Search Here"
							/>
							<div class="dropdown">
								<a
									class="dropdown-toggle no-arrow"
									href="#"
									role="button"
									data-toggle="dropdown"
								>
									<i class="ion-arrow-down-c"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="form-group row">
										<label class="col-sm-12 col-md-2 col-form-label"
											>From</label
										>
										<div class="col-sm-12 col-md-10">
											<input
												class="form-control form-control-sm form-control-line"
												type="text"
											/>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-12 col-md-2 col-form-label">To</label>
										<div class="col-sm-12 col-md-10">
											<input
												class="form-control form-control-sm form-control-line"
												type="text"
											/>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-12 col-md-2 col-form-label"
											>Subject</label
										>
										<div class="col-sm-12 col-md-10">
											<input
												class="form-control form-control-sm form-control-line"
												type="text"
											/>
										</div>
									</div>
									<div class="text-right">
										<button class="btn btn-primary">Search</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="header-right">
				<div class="dashboard-setting user-notification">
					<div class="dropdown">
						<a	class="dropdown-toggle no-arrow"
							href="javascript:;"
							data-toggle="right-sidebar">
							<i class="dw dw-settings2"></i>
						</a>
					</div>
				</div>
				<div class="user-notification">
					<div class="dropdown">
						<a
							class="dropdown-toggle no-arrow"
							href="#"
							role="button"
							data-toggle="dropdown">
							<i class="icon-copy dw dw-notification"></i>
							<span class="badge notification-active"></span>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<div class="notification-list mx-h-350 customscroll">
								<ul>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/img.jpg" alt="" />
											<h3>John Doe</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/photo1.jpg" alt="" />
											<h3>Lea R. Frith</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/photo2.jpg" alt="" />
											<h3>Erik L. Richards</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/photo3.jpg" alt="" />
											<h3>John Doe</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/photo4.jpg" alt="" />
											<h3>Renee I. Hansen</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/vendors/images/img.jpg" alt="" />
											<h3>Vicki M. Coleman</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed...
											</p>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="user-info-dropdown">
					<div class="dropdown">
						<a
							class="dropdown-toggle"
							href="#"
							role="button"
							data-toggle="dropdown"
						>
							<span class="user-icon">
								<img src="${pageContext.request.contextPath}/resources/vendors/images/photo1.jpg" alt="" />
							</span>
							<span class="user-name">Ross C. Lopez</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
						>
							<a class="dropdown-item" href="profile.html"
								><i class="dw dw-user1"></i> Profile</a
							>
							<a class="dropdown-item" href="profile.html"
								><i class="dw dw-settings2"></i> Setting</a
							>
							<a class="dropdown-item" href="faq.html"
								><i class="dw dw-help"></i> Help</a
							>
							<a class="dropdown-item" href="login.html"
								><i class="dw dw-logout"></i> Log Out</a
							>
						</div>
					</div>
				</div>
				<div class="github-link">
					<a href="https://github.com/dropways/deskapp" target="_blank"
						><img src="${pageContext.request.contextPath}/resources/vendors/images/github.svg" alt=""
					/></a>
				</div>
			</div>
		</div>

		<div class="right-sidebar">
			<div class="sidebar-title">
				<h3 class="weight-600 font-16 text-blue">
					Layout Settings
					<span class="btn-block font-weight-400 font-12"
						>User Interface Settings</span
					>
				</h3>
				<div class="close-sidebar" data-toggle="right-sidebar-close">
					<i class="icon-copy ion-close-round"></i>
				</div>
			</div>
			<div class="right-sidebar-body customscroll">
				<div class="right-sidebar-body-content">
					<h4 class="weight-600 font-18 pb-10">Header Background</h4>
					<div class="sidebar-btn-group pb-30 mb-10">
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary header-white active"
							>White</a
						>
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary header-dark"
							>Dark</a
						>
					</div>

					<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
					<div class="sidebar-btn-group pb-30 mb-10">
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary sidebar-light"
							>White</a
						>
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary sidebar-dark active"
							>Dark</a
						>
					</div>

					<h4 class="weight-600 font-18 pb-10">Menu Dropdown Icon</h4>
					<div class="sidebar-radio-group pb-10 mb-10">
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebaricon-1"
								name="menu-dropdown-icon"
								class="custom-control-input"
								value="icon-style-1"
								checked=""
							/>
							<label class="custom-control-label" for="sidebaricon-1"
								><i class="fa fa-angle-down"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebaricon-2"
								name="menu-dropdown-icon"
								class="custom-control-input"
								value="icon-style-2"
							/>
							<label class="custom-control-label" for="sidebaricon-2"
								><i class="ion-plus-round"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebaricon-3"
								name="menu-dropdown-icon"
								class="custom-control-input"
								value="icon-style-3"
							/>
							<label class="custom-control-label" for="sidebaricon-3"
								><i class="fa fa-angle-double-right"></i
							></label>
						</div>
					</div>

					<h4 class="weight-600 font-18 pb-10">Menu List Icon</h4>
					<div class="sidebar-radio-group pb-30 mb-10">
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-1"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-1"
								checked=""
							/>
							<label class="custom-control-label" for="sidebariconlist-1"
								><i class="ion-minus-round"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-2"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-2"
							/>
							<label class="custom-control-label" for="sidebariconlist-2"
								><i class="fa fa-circle-o" aria-hidden="true"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-3"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-3"
							/>
							<label class="custom-control-label" for="sidebariconlist-3"
								><i class="dw dw-check"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-4"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-4"
								checked=""
							/>
							<label class="custom-control-label" for="sidebariconlist-4"
								><i class="icon-copy dw dw-next-2"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-5"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-5"
							/>
							<label class="custom-control-label" for="sidebariconlist-5"
								><i class="dw dw-fast-forward-1"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-6"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-6"
							/>
							<label class="custom-control-label" for="sidebariconlist-6"
								><i class="dw dw-next"></i
							></label>
						</div>
					</div>

					<div class="reset-options pt-30 text-center">
						<button class="btn btn-danger" id="reset-settings">
							Reset Settings
						</button>
					</div>
				</div>
			</div>
		</div>

		<!-- LEFT-SIDE-BAR -->
		<jsp:include page="/WEB-INF/jsp/include/left-side-bar.jsp"></jsp:include>
		
		<div class="mobile-menu-overlay"></div>

		<div class="main-container">
			<div class="pd-ltr-20 xs-pd-20-10">
				<div class="min-height-200px">
					<div class="page-header">
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="title">
									<h4>계좌 개설하기 위한 절차입니다.</h4>
								</div>
								<nav aria-label="breadcrumb" role="navigation">
									<ol class="breadcrumb">
										<li class="breadcrumb-item">
											<a href="index.html">Home</a>
										</li>
										<li class="breadcrumb-item active" aria-current="page">
											Form Wizards
										</li>
									</ol>
								</nav>
							</div>
							<div class="col-md-6 col-sm-12 text-right">
								<div class="dropdown">
									<a
										class="btn btn-primary dropdown-toggle"
										href="#"
										role="button"
										data-toggle="dropdown"
									>
										January 2018
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="#">Export List</a>
										<a class="dropdown-item" href="#">Policies</a>
										<a class="dropdown-item" href="#">View Assets</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="pd-20 card-box mb-30">
						<div class="clearfix">
							<h4 class="text-blue h4">비대면 계좌 개설</h4>
							<p class="mb-30">jQuery Step wizard</p>
						</div>
						<div class="wizard-content">
							<form:form class="tab-wizard wizard-circle wizard" 
									name="infoForm" action="${ pageContext.request.contextPath }/login" 
									method="post" modelAttribute="memberVO">
								
								<!-- step 1 -->
								<h5>개인정보 입력</h5>
								<section>
									<div class="row justify-content-md-center">
										<div class="col-md-2">
											<label style="float:right; text-align: center;">성함 :</label>
										</div>
										<div class="col-md-4">
											<div class="form-group" >
												<input type="text" class="form-control" name="name" id="name" />
											</div>
										</div>
									</div>
									
									<div class="row justify-content-md-center">
										<div class="col-md-2">
											<label style="float:right; text-align: center;">연락처 :</label>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<input type="text" class="form-control" placeholder="- 없이 입력하세요"
														name="phone" id="phone" />
											</div>
										</div>
									</div>
									
									<div class="row justify-content-md-center">
										<div class="col-md-2">
											<label style="float:right; text-align: center;">주민등록번호 :</label>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<input type="text" class="form-control" name="jumin" id="jumin" />
											</div>
										</div>
									</div>
									
								</section>
								
								<!-- Step 2 -->
								<h5>개인정보 약관 동의</h5>
								<section>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												하나은행(이하 “당행”이라 합니다)은 개인정보보호법 제30조에 따라 고객의 개인정보 및 권익을 보호하고 개인정보와 관련한
												고객의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다. <br> <br>
								
												<!-- 1번째 약관 -->
												<h5><strong style="color:#008485;">개인신용정보 수집 및 이용 동의</strong></h5>
												<br>
												<button id="btn1_toggle" type="button" class="btn btn-info">약관 확인</button>
								
												<div class="form-group" id="div1" style="display: none;">
													<jsp:include page="/WEB-INF/jsp/include/minfoPolicy1.jsp"></jsp:include>
												</div>
												
												<br>
												<input type="checkbox" name="chk">
												<label>위의 약관을 읽고 동의합니다.</label>
												<!-- 
												<div class="custom-control custom-checkbox mb-5"
													style="text-align: right; padding: 10px;">
													<input type="checkbox" name="chk">
													<label>위의 약관을 읽고 동의합니다.</label>
												</div> -->
												<br><br>
												
												<!-- 2번째 약관 -->
												<h5><strong style="color:#008485;">간편결제 서비스 이용 동의</strong></h5>
												<br>
												<button id="btn2_toggle" type="button" class="btn btn-info">약관 확인</button>
								
												<div class="form-group" id="div2" style="display: none;">
													<jsp:include page="/WEB-INF/jsp/include/minfoPolicy2.jsp"></jsp:include>
												</div><br>
												
												<input type="checkbox" name="chk">
												<label>위의 약관을 읽고 동의합니다.</label>
												<br><br>
												
												<input type="checkbox" id="cbx_chkAll" value="전체동의"/>
												<label>전체동의</label>
												
												<br><br>
												
												<button id="minfoChkBtn" type="button" class="btn btn-info" style="margin: 0 auto;">확인</button>
												
											</div>
										</div>
									</div>
								</section>
								
								
								<!-- Step 3 -->
								<h5>신분증 확인</h5>
								<section>
									<div class="row justify-content-md-center">
										<div class="row justify-content-md-center" style="margin: 0;">
											<div id="fileUpload" class="dragAndDropDiv" style="display: inline-block;">Drag & Drop
												Files Here or Browse Files</div>
											<br> <input type="file" name="fileUpload" id="fileUpload"
												style="display: none;" required=true value="업로드" multiple
												onchange="setThumbnail(event);" /> <br>
		
											<div id="image_container"
												style="padding: 100px; margin: 0 auto;"></div>
		
											<!-- 									<div id="imgPre" style="border:solid 1px">
													<img id="preview" class="preview" style="width:400px;height:400px;"> 
												</div> -->
	
										</div>
									</div>
									
	
									<div class="row justify-content-md-center">
										<div class="col-md-2">
											<label style="float: right; text-align: center;">성함 :</label>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<input type="text" class="form-control" name="name2"
													id="name2" />
											</div>
										</div>
									</div>
	
									<div class="row justify-content-md-center">
										<div class="col-md-2">
											<label style="float: right; text-align: center;">주민등록번호
												:</label>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<input type="text" class="form-control"
													placeholder="앞 6자리" name="jumin1" id="jumin1" />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<input type="text" class="form-control"
													placeholder="뒤 7자리" name="jumin2" id="jumin2" />
											</div>
										</div>
									</div>
	
									<div class="row justify-content-md-center">
										<div class="col-md-2">
											<label style="float: right; text-align: center;">발급일 :</label>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<input type="text" class="form-control" name="licenseDt"
													id="licenseDt" />
											</div>
										</div>
									</div>
	
									<!-- 서버로 보낼 부분 작성 
											url : /extractText 로 전송해서 VisionController.java에서 처리
											$('#licenseAuthBtn').click(function(){});  
											
										<button id="licenseAuthBtn">인증</button>
										-->
	
								</section>
	
								<!-- Step 4 -->
								<h5>계좌 개설</h5>
								<section>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>은행명</label>
												<input type="text" class="form-control" name="bankName" id="bankName" 
														value="하나은행" readonly="readonly"/>
											</div>
											<div class="form-group">
												<label>계좌번호</label>
												<input type="text" class="form-control" name="bankAcctNum" id="bankAcctNum"
														value="${AcctNumber}" readonly="readonly"/>
											</div>
											<div class="form-group">
												<label>계좌별칭</label>
												<input type="text" class="form-control" name="acctAlias" id="acctAlias"/>
											</div>
											<div class="form-group">
												<label>계좌 비밀번호</label>
												<input type="password" class="form-control" name="acctPw" id="acctPw"
														placeholder="(숫자 4자리)"/>
											</div>
											
											<div class="form-group">
												체크카드 발급 여부를 선택하세요.<br>
												<input type="radio" name="cardChk" id="cardChk" value="N" />발급안함
												<input type="radio" name="cardChk" id="cardChk" value="Y" />동시발급
											</div>
											
										</div>
										<!-- <div class="col-md-6">
											<div class="form-group">
												<label>Comments</label>
												<textarea class="form-control"></textarea>
											</div>
										</div> -->
									</div>
								</section>
							</form:form>
						</div>
					</div>

					<!-- success Popup html Start -->
					<div
						class="modal fade"
						id="success-modal"
						tabindex="-1"
						role="dialog"
						aria-labelledby="exampleModalCenterTitle"
						aria-hidden="true">
						
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body text-center font-18">
									<h3 class="mb-20">Form Submitted!</h3>
									<div class="mb-30 text-center">
										<img src="${pageContext.request.contextPath}/resources/vendors/images/success.png" />
									</div>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
									do eiusmod
								</div>
								<div class="modal-footer justify-content-center">
									<button
										id="acctListBtn"
										type="button"
										class="btn btn-primary"
										data-dismiss="modal">
										Done
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- success Popup html End -->
				</div>
				
				<!-- footer -->
				<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
				
			</div>
		</div>
		
		<!-- js -->
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>
		<script src="${pageContext.request.contextPath}/resources/src/plugins/jquery-steps/jquery.steps.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/scripts/steps-setting.js"></script>
		<!-- Google Tag Manager (noscript) -->
		<noscript
			><iframe
				src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS"
				height="0"
				width="0"
				style="display: none; visibility: hidden"
			></iframe
		></noscript>
		<!-- End Google Tag Manager (noscript) -->
	</body>
</html>
    