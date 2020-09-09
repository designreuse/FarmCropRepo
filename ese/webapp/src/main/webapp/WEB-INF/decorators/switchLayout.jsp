<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@page import="com.sourcetrace.eses.umgmt.entity.Menu"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<html lang="en" class="no-js">
<head>
<title>THE FARM CORP - Next Generation Tech Solution</title>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="Next Generation Tech Solution" name="description" />

<script src="assets/libs/jquery/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.5.0/css/flag-icon.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.5.0/css/flag-icon.min.css" />

<link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="fonts/open-sans/css/open-sans.css">

<link rel="shortcut icon" href="/favicon.ico">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">

<link rel="stylesheet" type="text/css" media="screen" href="assets/libs/jquery-ui-dist/jquery-ui.min.css" />

<link rel="shortcut icon" type="image/x-icon" href="auth_populateLogo.action?logoType=favicon" />

<link href="assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />

<link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />

<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />

<link href="assets/css/app.css" rel="stylesheet" type="text/css" />

<link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

<link href="assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css" /> 

 <link href="assets/libs/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
 

<script src="assets/libs/twitter-bootstrap-wizard/bootstrap/js/bootstrap.min.js"></script>

  
</head>
<style>
.hide {
  display: none; }
  
.wizard-wrapper {
          display: -webkit-box;
          display: -ms-flexbox;
          display: flex; }
.wizard-icon {
          font-size: 2.5rem;
          margin-right: 1.1rem;
          -webkit-transition: color 0.15s ease, background-color 0.15s ease, border-color 0.15s ease, -webkit-box-shadow 0.15s ease;
          transition: color 0.15s ease, background-color 0.15s ease, border-color 0.15s ease, -webkit-box-shadow 0.15s ease;
          transition: color 0.15s ease, background-color 0.15s ease, border-color 0.15s ease, box-shadow 0.15s ease;
          transition: color 0.15s ease, background-color 0.15s ease, border-color 0.15s ease, box-shadow 0.15s ease, -webkit-box-shadow 0.15s ease; }
.wizard-icon .svg-icon svg g [fill] {
            -webkit-transition: fill 0.3s ease;
            transition: fill 0.3s ease;
            fill: #5664d2; }
.wizard-icon .svg-icon svg:hover g [fill] {
            -webkit-transition: fill 0.3s ease;
            transition: fill 0.3s ease; }
.wizard-label {
          display: -webkit-box;
          display: -ms-flexbox;
          display: flex;
          -webkit-box-orient: vertical;
          -webkit-box-direction: normal;
          -ms-flex-direction: column;
          flex-direction: column;
          -webkit-box-pack: center;
          -ms-flex-pack: center;
          justify-content: center; }
.wizard-label .wizard-title {
            color: #181C32;
            font-weight: 500;
            font-size: 1.1rem; }
.wizard-label .wizard-desc {
            color: #7E8299; }
.collapse-icon-custom{
margin-top: -35px;
}
</style>


<body data-sidebar="dark">

	<%
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("USER_INFO");
		Long userId = (Long) userInfo.get("USER_REC_ID");
	%>

<!-- Begin page -->
	 <div id="layout-wrapper">
	 
	 <header id="page-topbar">
                <div class="navbar-header">
                    <div class="d-flex">
                    <!-- LOGO -->
                             <div class="navbar-brand-box">
                             <a href="#" class="logo logo-light">
                                <span class="logo-sm">
                                    <img src="assets/images/small-logo.png" alt="" height="22">
                                </span>
                                <span class="logo-lg">
                                    <img src="auth_populateLogo.action?logoType=app_logo" alt="" width="180" height="50">
                                </span>
                            </a>
                        </div>
                        <button type="button" class="btn btn-sm px-3 font-size-24 header-item waves-effect" id="vertical-menu-btn">
                            <i class="ri-menu-2-line align-middle"></i>
                        </button>
                              
                        
                    </div>
                          <div class="d-flex">
                          
                           <div class="dropdown d-inline-block d-lg-none ml-2">
                       
                            <div class="custom-control custom-switch mb-3">
                        <input type="checkbox" class="custom-control-input theme-choice" id="dark-mode-switch" data-bsStyle="assets/css/bootstrap-dark.min.css" data-appStyle="assets/css/app-dark.min.css" />
                        <label class="custom-control-label" for="dark-mode-switch">Dark Mode</label>
                    </div>
                        </div>
                          
                              <!-- Language-->
                        <div class="dropdown d-none d-sm-inline-block">
                         
                            <%=session.getAttribute("languageMenu")%>
                        </div>
                           
                         
                        
                         <!-- fullscreen-->
                          <div class="dropdown d-none d-lg-inline-block ml-1">
                            <button type="button" class="btn header-item noti-icon waves-effect" data-toggle="fullscreen">
                                <i class="ri-fullscreen-line"></i>
                            </button>
                        </div>
                        
                         <!-- Profile-->
               <div class="dropdown d-inline-block user-dropdown">
                            <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="rounded-circle header-profile-user" src="user_getUserAvatar.action?id=<%=userId%>"
                                    alt="User Avatar">
                                <span class="d-none d-xl-inline-block ml-1"><%=session.getAttribute("user")%></span>
                                <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <!-- item-->
                                <a class="dropdown-item" href="#"><i class="ri-user-line align-middle mr-1"></i> Role : <%=session.getAttribute("role")%> </a>
                                <a class="dropdown-item" href="user_detail.action?id=<%=userId%>"><i class="ri-user-line align-middle mr-1"></i> <s:text name="myProfile" /></a>
                                <a class="dropdown-item" href="changePassword_edit.action"><i class="ri-lock-unlock-line align-middle mr-1"></i> <s:text name="changePwd" /></a>
                               <sec:authorize ifAllGranted="system.prefernces.list">
                                <a class="dropdown-item d-block" href="prefernce_list.action"><i class="ri-settings-2-line align-middle mr-1"></i> Settings</a>
                                </sec:authorize>
                               
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-danger" href="logout"><i class="ri-shut-down-line align-middle mr-1 text-danger"></i> Logout</a>
                            </div>
                        </div>
                          </div>
                        
                        
                  
                        
                     
        </div>          
                
    </header>
      <!-- ========== Left Sidebar Start ========== -->
      <div class="vertical-menu">

                <div data-simplebar class="h-100">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">
                        <!-- Left Menu Start -->
                       
                       
		<page:applyDecorator name="menu" page="/jsp/eseMenu.jsp" />
	
                      
                     </div>
                     
                  </div>
                  
     </div>
	 </div>
	  <!-- Left Sidebar End -->
	    <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="main-content">
	  <div class="page-content">
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                 <!--   <h4 class="mb-0"></h4> -->
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                        <%
								List<Menu> menus = (List<Menu>) request.getAttribute("breadCrumb");
								if (menus != null) {
									for (Menu menu : menus) {
							%>
							
                                            <li class="breadcrumb-item"><a href="<%=menu.getUrl()%>"><%=menu.getLabel()%></a></li>
                                          <!--   <li class="breadcrumb-item active">Customers</li> -->
                                          <%
								}
								}
							%>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                    <decorator:body />
                                    </div>
                                 </div>
                            </div>
                         </div>
                      </div>
       </div>
       
        <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <script>document.write(new Date().getFullYear())</script>  &#169; The Farm Corp.
                            </div>
                            <div class="col-sm-6">
                                <div class="text-sm-right d-none d-sm-block">
                                    Crafted with <i class="mdi mdi-heart text-danger"></i> by WebFocus360
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
     </div>            
 
	

        <!-- JAVASCRIPT -->
   
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>
        
         <script src="assets/libs/bs-custom-file-input/bs-custom-file-input.min.js"></script>

        <script src="assets/js/pages/form-element.init.js"></script>
        
         <script src="assets/libs/select2/js/select2.min.js"></script>
         
          <script src="assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
          
          <script src="assets/libs/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
          
           <script src="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
     
        <script src="assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>

        <script src="assets/js/pages/form-advanced.init.js"></script>

        <!-- jquery.vectormap map -->
        <script src="assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-us-merc-en.js"></script>

      <script src="js/bootstrap-hover-dropdown.min.js"></script>  

        
     <script src="assets/js/app.js"></script>
	<%--  <script>
		jQuery(document).ready(function() {
			Main.init();
		});
	</script> --%>
</body>
</html>