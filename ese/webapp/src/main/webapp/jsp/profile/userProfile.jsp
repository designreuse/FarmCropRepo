<%@ include file="/jsp/common/form-assets.jsp"%>
<%@ include file="/jsp/common/detail-assets.jsp"%>

<head>
<META name="decorator" content="swithlayout">
</head>


<s:form name="form" action="user_%{command}" method="post"
	cssClass="fillform" enctype="multipart/form-data">
	<s:hidden key="currentPage" />
	<s:hidden key="id" id="id" />
	<s:if test='"update".equalsIgnoreCase(command)'>
		<s:hidden key="user.id" id="id" />
	</s:if>
	<s:hidden key="command" />
	<s:hidden key="selecteddropdwon" id="listname" />
	<s:hidden key="temp" id="temp" />


		<div class="ferror" id="errorDiv" class=" hide alert alert-danger">
		<s:actionerror theme="bootstrap" /> 
		<s:fielderror theme="bootstrap"  />
			
		</div>
		
<div id="accordion" class="custom-accordion pers_info" >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#persInfo" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseOne">
                                                    <div class="card-header" id="headingOne">
                                                        <h6 class="m-0">
                                                        <div class="wizard-wrapper">
															<div class="wizard-icon">
															<span class="svg-icon svg-icon-2x">
																	<!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
																	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg>
																	<!--end::Svg Icon-->
																</span>
															
															</div>
																<div class="wizard-label">
																	
																<h3 class="wizard-title"><s:text name="info.user" /></h3>
																<div class="wizard-desc">Setup User Basic Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="persInfo" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
				<div class="card-body">

				<div class="row">
                             
                                                <div class="col-md-4">
                                                
                                                
                                                <div class="form-group">
					<label> <s:text name="userProfile.username" /><sup
						style="color: red;"> * </sup></label>
					<s:if test='"update".equalsIgnoreCase(command)'>
						<div class="">
							<s:textfield size="25" readonly="true" name="user.username"
								cssClass="form-control" maxlength="45" />
						</div>
					</s:if>
					<s:else>
						<div class="">
							<s:textfield name="user.username" theme="simple" size="25"
								maxlength="45" cssClass="form-control" />
						</div>
					</s:else>
				</div>
				</div>
				 <div class="col-md-4">
				<div class="form-group">
					<label for="txt"><s:text name="personalInfo.firstName" />
						<sup style="color: red;">*</sup></label>
					<div class="">
						<s:textfield id="firstName" name="user.personalInfo.firstName"
							size="25" maxlength="50"
							cssClass="upercls form-control" />
					</div>
				</div></div>
				
				 <div class="col-md-4">
					<div class="form-group">
					<label for="txt"><s:text name="personalInfo.lastName" /></label>
					<div class="">
						<s:textfield id="lastName" name="user.personalInfo.lastName"
							size="25" maxlength="35"
							cssClass="upercls form-control" />
					</div>
				</div>
				</div>
			</div>
<div class="row">
 <div class="col-md-4">
<div class="form-group">
					<label for="txt"><s:text name="user.lang" /> <sup
						style="color: red;">*</sup></label>
					<div class="">
						<s:select id="language" headerKey=""
							headerValue="%{getText('txt.select')}" name="user.language"
							list="languageMap" listKey="key" listValue="value"
							cssClass="form-control" />
					</div>
				</div></div>
		 <div class="col-md-4">		
				<div class="form-group">
						<label for="txt"> <s:property
								value="%{getLocaleProperty('photo')}" /> <span
							style="font-size: 8px"> <s:text name="farmer.imageTypes" />
								<font color="red"> <s:text name="imgSizeMsg" /></font>
						</span>
						</label>
						 <div class="custom-file">
                                         	<s:if test='userImageString!=null && userImageString!=" "'>
						
									  <input type="file" class="custom-file-input" name="userImage" id="customFile" onchange="checkImgHeightAndWidth(this)">
							</s:if>
							<s:else>
								
									  <input type="file" class="custom-file-input" name="userImage" id="customFile"
									onchange="checkImgHeightAndWidth(this)">
							</s:else> 
                                            <label class="custom-file-label" for="customFile">Choose file</label>
                                        
                                        </div>
					
					</div>
					
			</div>	
			 <div class="col-md-4">		
				<div class="form-group">
		 
							
							<button type="button" class="btn btn-danger waves-effect waves-light aButtonClsWbg" id="remImg"
								onclick='deleteFile(<s:property value="user.id" />)'>
                                                <i class="ri-delete-bin-2-line align-middle"></i> 
                                            </button>
				</div>
			</div>

</div>
</div>              
</div>	

</div>

<!-- Contact Information -->
<div id="accordion" class="custom-accordion contct_info" >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#contactInfo" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseTwo">
                                                    <div class="card-header" id="headingTwo">
                                                        <h6 class="m-0">
                                                        <div class="wizard-wrapper">
															<div class="wizard-icon">
															<span class="svg-icon svg-icon-2x">
																	<!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
																	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg>
																	<!--end::Svg Icon-->
																</span>
															
															</div>
																<div class="wizard-label">
																	
																<h3 class="wizard-title"><s:text name="info.contact" /></h3>
																<div class="wizard-desc">Setup User Contact Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="contactInfo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
				<div class="card-body">

				<div class="row">
                             
                                                <div class="col-md-4">
                                                
                          
				<div class="form-group">
					<label for="txt"><s:text name="contactInfo.address" /></label>

					<div class="">
						<s:textarea name="user.contactInfo.address1"
							maxlength="225" rows="3" cssClass="form-control"
							 />
					</div>
				</div>
				</div>
				 <div class="col-md-4">
				<div class="form-group">
					<label for="txt"><s:text name="contactInfo.mobileNumber" />
						<sup style="color: red;">*</sup></label>
					<div class="">
						<s:textfield name="user.contactInfo.mobileNumber"
							maxlength="15" cssClass="form-control input-sm" />
					</div>
				</div></div>
				
				 <div class="col-md-4">
					<div class="form-group">
					<label for="txt"><s:text name="contactInfo.email" /> <sup
						style="color: red;">*</sup></label>
					<div class="">
						<s:textfield name="user.contactInfo.email" theme="simple"
							maxlength="45" cssClass="form-control input-sm" />
					</div>
				</div>
				</div>
			</div>

</div>              
</div>	

</div>
	<!-- User Credential Information  -->
<div id="accordion" class="custom-accordion userCred_info" >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#userCredInfo" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseThree">
                                                    <div class="card-header" id="headingThree">
                                                        <h6 class="m-0">
                                                        <div class="wizard-wrapper">
															<div class="wizard-icon">
															<span class="svg-icon svg-icon-2x">
																	<!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
																	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg>
																	<!--end::Svg Icon-->
																</span>
															
															</div>
																<div class="wizard-label">
																	
																<h3 class="wizard-title"><s:text name="info.userCred" /></h3>
																<div class="wizard-desc">Setup User Credential Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="userCredInfo" class="collapse show" aria-labelledby="headingThree" data-parent="#accordion">
				<div class="card-body">

				<div class="row">
                             
                                                <div class="col-md-4">
                                                
                          
							<div class="form-group" id='pwd'>
					<label for="txt"> <s:text name="user.password" /> <sup
						style="color: red;"> *</sup></label>
					<div class="">
						<s:password id="p" name="user.password" 
							maxlength="16" cssClass="form-control input-sm" />
					</div>
				</div>
				</div>
				 <div class="col-md-4">
			<div class="form-group" id="pwd1">
					<label for="txt"> <s:text name="user.confirmpassword" /> <sup
						style="color: red;"> *</sup></label>
					<div class="">
						<s:password id="p" name="user.confirmPassword"
							maxlength="16" cssClass="form-control input-sm" />
					</div>
				</div></div>
				 <div class="col-md-4">
					<div class="form-group">
					<label for="txt"><s:text name="user.select.role" /> <sup
						style="color: red;">*</sup></label>
					<div class="">
						<s:select name="user.role.id" id="selectRole" list="roles"
							listKey="id" listValue="name" headerKey=""
							headerValue="%{getText('txt.select')}"
							cssClass="form-control" />
					</div>
				</div>
			</div>
	</div>
	<div class="row">
                             
                                                <div class="col-md-4">
                                                
                          
							<div class="form-group">
					<label for="txt"><s:text name="Enabled" /></label>
					<div class="">
							<s:checkbox name="user.enabled"  cssClass="form-control" />
					</div>
				</div>
				</div>
	
			
	</div>
</div>              
</div>	

</div>

		<div class="button-items float-right">
			<s:if test="command =='create'">
		
					 <button type="button" id="sucessbtn" onclick="event.preventDefault();onSubmit();"class="btn btn-success waves-effect waves-light">
                                                <i class="ri-check-line align-middle mr-2"></i> Save
                                            </button>
 					<button type="button" id="cancel" onclick="onCancel();" class="btn btn-danger waves-effect waves-light">
                                                <i class="ri-close-line align-middle mr-2"></i> Cancel
                                            </button>
			</s:if>
			<s:else>
			
				 <button type="button" id="sucessbtn" onclick="event.preventDefault();onSubmit();"class="btn btn-success waves-effect waves-light">
                                                <i class="ri-check-line align-middle mr-2"></i> Update
                                            </button>
 					<button type="button" id="cancel" onclick="onCancel();" class="btn btn-danger waves-effect waves-light">
                                                <i class="ri-close-line align-middle mr-2"></i> Cancel
                                            </button>
			</s:else>
		</div>

	<script>
		function checkImgHeightAndWidth(val) {

			var _URL = window.URL || window.webkitURL;
			var img;
			var file = document.getElementById('customFile').files[0];

			if (file) {

				img = new Image();
				img.onload = function() {
					imgHeight = this.height;
					imgWidth = this.width;
				};
				img.src = _URL.createObjectURL(file);
			}
			$("#userImageExist").val("0");			
		}

		function getTwentyYearsBack() {
			return new Date().getFullYear() - 20;
		}

		jQuery(function($) {
			$("#calendar").datepicker({
				defaultDate : new Date(getTwentyYearsBack(), 01, 00)
			});
		});
	</script>

</s:form>
<s:form name="cancelform" action="user_list.action">
	<s:hidden key="currentPage" />
</s:form>

<script type="text/javascript">
function onSubmit() {
		 if(validateImage()){
			
			$("#target").submit();
			 document.form.submit();
		} 
		 $("#sucessbtn").prop('disabled', true);
	}
	
	function validateImage(){
		

		var file=document.getElementById('customFile').files[0];
		var filename=document.getElementById('customFile').value;
		var fileExt=filename.split('.').pop();			

		if(file != undefined){
			if(fileExt=='jpg' || fileExt=='jpeg' || fileExt=='png'||fileExt=='JPG'||fileExt=='JPEG'||fileExt=='PNG')
			{ 	
				if(file.size>51200){
					alert('<s:text name="fileSizeExceeds"/>');	
					hit=false;
					file.focus();
					enableButton();
					return false;		
				}//else if(imgWidth >260){
					//alert('<s:text name="imageWidthMsg"/>');
					//file.focus();
					//return false;	
				//}else if(imgHeight> 70){
					//alert('<s:text name="imageHeightMsg"/>');
					//file.focus();
					//return false;	
				//}
				
			}else{
			
				alert('<s:text name="invalidFileExtension"/>')	
				file.focus();
				return false;				
				}
		}
	return true;
	}
	
	 function enableButton(){
		jQuery(".save-btn").prop('disabled',false);
		} 


	function capitalizeName() {
		var arr = [ "firstName", "lastName", "middleName" ];
		for (var i = 0; i < arr.length; i++) {
			var txt1 = document.getElementById(arr[i]).value;
			if (txt1 != null || txt != "") {
				capital(arr[i], txt1);
			}
		}
	}
	function capital(id, txt) {
		$(document.getElementById(id)).val(
				txt.replace(/^(.)|\s(.)/g, function($1) {
					return $1.toUpperCase();
				}));
	}

	function populateRoles(obj) {
		var branchId = $(obj).val();
		reloadSelect('#selectRole', 'user_populateRoles.action?branchId_F='
				+ branchId);
	}
	
	function populateRoleMulti(obj) {
		var branchId = $(obj).val();
		if(isEmpty(branchId)){
			branchId = $("#branchSelect").val();
		}
		reloadSelect('#selectRole', 'user_populateRoles.action?branchId_F='
				+ branchId);
	}
	
	function populateSubBranch(obj){
		var branchId = $(obj).val();
		jQuery.post("user_populateSubBranches.action",{branchId_F:branchId},function(result){
				insertOptions("subBranchSelect",$.parseJSON(result));
		});
		
	}
	function deleteFile(id) {
		
		 if (confirm('<s:text name="confirmToDelete"/>')) {
			 $("#userImageExist").val("1");
			 $("#userImageString").val("");
			 $("#customFile").val("");
			 $('#image').attr('src', 'img/no-img.png');
		 }
		 
	}
	
	function onCancel(){
		
			window.location.href="user_list.action";
		
	}
</script>

