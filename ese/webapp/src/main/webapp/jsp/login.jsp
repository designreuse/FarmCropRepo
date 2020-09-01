<%@ taglib uri="/struts-tags" prefix="s"%>
<%-- <%@ taglib uri="/ese-tags" prefix="e"%> --%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<head>
<META name="decorator" content="loginlayout">
</head>

<body>
  <div class="authentication-page-content p-4 d-flex align-items-center min-vh-100">
                            <div class="w-100">
                                <div class="row justify-content-center">
                                    <div class="col-lg-9">
                                    
                                      <div>
                                                    <a href="#" class="logo"><img src="auth_populateLogo.action?logoType=app_logo" alt="logo" ></a>
                                                </div>
	<div class="p-2 mt-5">
			<h4 class="sts">Sign in to your account</h4>
		<s:if test="branchEnabled==1">
			<p>Select Branch, Enter Username and Password to Log-in
			</p>
		</s:if>
		<s:else>
			<p>Please Enter your Username and Password to Login.</p>
		</s:else>
		<s:form name="loginform" class="form-login form-horizontal" action="login">
	<font style="color: red;"> <s:actionerror theme="bootstrap"/>
			</font>
			
			<div class="loginError" style="color: red;">
				<div id="check" class="hide">
					
				</div>
			</div> 
			<div id="validateError" class=" hide alert alert-danger" style="text-align: center;"></div>
			
				<s:if test="isMultibranchApp==0">
					<s:if test="branchEnabled==1">
						<div class="form-group">
							<s:select id="branch" theme="bootstrap" name="branchId"
								list="branches" listKey="key" listValue="value" headerKey=""
								headerValue="%{mainBranchName}" cssClass="form-control inputTxt select2" />
						</div>
					</s:if>

					<div class="form-group auth-form-group-custom mb-4">
						  <i class="ri-user-2-line auti-custom-input-icon"></i>
                            <label for="username">Username</label><s:textfield id="userName"
								size="20" key="j_username" placeholder="Enter username"
								cssClass="form-control" required="required" />
							
						
					</div>
					<div class="form-group auth-form-group-custom mb-4">
						  <i class="ri-lock-2-line auti-custom-input-icon"></i>
                             <label for="userpassword">Password</label> <s:password id="password"
								size="20" key="j_password" showPassword="true"
							 placeholder="Enter password"
								cssClass="form-control"
								required="required" /> <%-- <a
							class="forgot" href="#"> <s:text name="forgotPassword" /> --%>
						</a>
				
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
							<s:select id="branch" theme="bootstrap" name="branchId"
								list="branches" listKey="key" listValue="value" headerKey=""
								headerValue="%{mainBranchName}" cssClass="form-control inputTxt select2" />
						</div>
					<div class="form-group auth-form-group-custom mb-4">
						  <i class="ri-user-2-line auti-custom-input-icon"></i>
                            <label for="username">Username</label> <s:textfield id="userName"
								size="20" key="j_username" placeholder="Enter username"
								cssClass="form-control" required="required" />
						
						
					</div>
					<div class="form-group auth-form-group-custom mb-4">
						   <i class="ri-lock-2-line auti-custom-input-icon"></i>
                                                        <label for="userpassword">Password</label><s:password id="password"
								size="20" key="j_password" showPassword="true"							
								cssClass="form-control"  placeholder="Enter password"
								required="required" /> <%-- <a
							class="forgot" href="#"> <s:text name="forgotPassword" /> --%>
						</a>
						
					</div>
				</s:else>
				
				
				
				<div class="form-actions ">
							<label for="remember" class="custom-checkbox-inline"> <s:checkbox
							id="agree" cssClass="grey remember" style="" key="agree"
							 onclick="checkClick()" /> <s:text
							name="license.agree" />
					</label> 
							
						</div>
						
						<div class="mt-4 text-center">
                          <button id="btnLogin" name="login" class="btn btn-primary w-md waves-effect waves-light"
							type="button" onclick="onCreate()">
							<s:text name="login.button" />
							<i class="fa fa-arrow-circle-right"></i>
						</button>
                          </div>
				
			
			
		</s:form>
	</div>

	
</div>
</div>
</div>
</div>

	<script type="text/javascript">
		var currentTenantId = '<s:property value="#session.tenantId" />';

		function resetPassword() {
		}

		function validateUser() {
			var hit = true;
			var nameVal = /^[a-zA-Z0-9 ]+$/;
			var mailVal = /\S+@\S+\.\S+/;
			var userName = $('#name').val();
			var userValue = $('input[name="credentialName"]:checked').val();
			if (userName === "" || userName === null || userName === undefined) {
				alert('<s:text name="emptyName"/>');
				hit = false;
			} else if (userValue === "" || userValue === null || userValue==undefined
					|| userName === userValue) {
				alert('<s:text name="selectCredType"/>');
				hit = false;
			} else if (userValue === "1" && !nameVal.test(userName)) {
				alert('<s:text name="enterValidUserName"/>');
				hit = false;
			} else if (userValue === "2" && !mailVal.test(userName)) {
				alert('<s:text name="enterValidMail"/>');
				hit = false;
			}

			if (hit) {
				resetCredential();
				$.post("email_validateUser", {
					resetValue : userName,
					userValue : userValue,
					dt : new Date()
				}, function(data) {
					if (data === "" || data === null || data === undefined) {
						alert('<s:text name="errorWhileProcessing"/>');
					} else {
						alert(data);
					}
					$('#btnLogin').prop("disabled", true);
					document.loginform.action = "auth_login";
					document.loginform.submit();
				});
			}

			 else{
			            	  $('#name').val('');
			            }
		}
		function resetPopup() {
			document.loginform.action = '';
			$('#btnLogin').prop("disabled", true);
			document.loginform.submit();
		}
		function resetCredential() {
			$('#name').val('');
			$("input[name='credentialName']").attr("checked", false);
		}

		function checkClick() {
			$("#check").hide();
		}

		function onCreate() {
			var error="";
			
			var userName = document.getElementById('userName').value;
			var password = document.getElementById('password').value;
			//$("#actionError").html(" ");
			if ((userName === "" || userName === null)
					&& (password === "" || password === null)) {
				 $("#validateError").removeClass('hide');
			
				document.getElementById("validateError").innerHTML='<s:property value="%{getLocaleProperty('userName.password.reqd')}" />';
				return false;
			} else if (userName === "" || userName === null) {
				 $("#validateError").removeClass('hide');		
			
				document.getElementById("validateError").innerHTML='<s:property value="%{getLocaleProperty('username.reqd')}" />';
				return false;
			} else if (password === "" || password === null) {
				 $("#validateError").removeClass('hide');
			
				document.getElementById("validateError").innerHTML='<s:property value="%{getLocaleProperty('password.reqd')}" />';
				return false;
			} else {
				document.loginform.action = "j_spring_security_check";
				if (document.getElementById("agree").checked) {
					$("#check").hide();
					$('#btnLogin').prop("disabled", true);
					document.loginform.submit();
				} else {
					//$("#check").show();
					//$('#actionError').removeClass('no-display');
					 $("#validateError").removeClass('hide');
					document.getElementById("validateError").innerHTML='<s:property value="%{getLocaleProperty('not.agree')}" />';
				    return false;
					/* $("#check").removeClass('hide');
					$("#check").removeAttr('style');
					$('.errorMessage').hide(); */
				}
			}

			if (typeof (Storage) !== "undefined") {
				localStorage.cachedBranch = $('#branch').val();
			}
		}

		$(document).ready(
				function() {
					resetCredential();
					$("#check").hide();
					$("#username").focus();
				//	$('#validateError').hide();
					/* // alert(currentTenantId);
					if (currentTenantId == null
							|| currentTenantId == 'undefined'
							|| currentTenantId == '') {
						if (localStorage.currentTenantId
								&& localStorage.currentTenantId != '') {
							if (localStorage.currentTenantId !== 'agro') {
								location.replace("login_execute_"
										+ localStorage.currentTenantId);
							}
						}
					} else {
						if (typeof (Storage) !== "undefined") {
							if (!localStorage.currentTenantId) {
								localStorage.currentTenantId = '';
							}
							localStorage.currentTenantId = currentTenantId;
						}
					}

					if (typeof (Storage) !== "undefined") {
						if (localStorage.cachedBranch) {
							if (localStorage.cachedBranch != null
									&& localStorage.cachedBranch != '') {
								$('#branch').val(localStorage.cachedBranch);
							}
						}
					} */
				});
	</script>
</body>