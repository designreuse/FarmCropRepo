<%@ include file="/jsp/common/form-assets.jsp"%>
<%@ include file="/jsp/common/detail-assets.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<head>
<META name="decorator" content="swithlayout">
<link rel="stylesheet" href="plugins/select2/select2.min.css">
</head>
<script>
var tenant='<s:property value="getCurrentTenantId()"/>';
var command ='<s:property value="command"/>';
var selectedGroup='<s:property value="selGroupArry"/>';
	jQuery(document).ready(function() {		
		$("#buttonAdd1").on('click', function (event) {  
           //event.preventDefault();
            var el = $(this);
            el.prop('disabled', true);
           // setTimeout(function(){el.prop('disabled', false); }, 1000);
      });
		//alert(selectedGroup);
		
		 if('<s:property value="command"/>'=="update"){
			 
			 if(!isEmpty(selectedGroup)){
				    if (selectedGroup != null && selectedGroup.trim() != "") {
                        var values = selectedGroup.split("\\,");

                        $.each(selectedGroup.split(","), function (i, e) {
                            $("#availableWarehouse option[value='" + e.trim() + "']")
                                    .prop("selected", true);
                        });
                        $("#availableWarehouse").select2();
                    }
                    
			 }
			 
		 }
			jQuery("#pratibhaWarehouseDiv").hide();
			var ware=$('#warehouseName').val();
			$('#hiddenWarehouseName').val(ware);
			jQuery(".groupSelect").show();
			jQuery("#serviceLocationDiv").show();
			jQuery("#warehouseDiv").hide();
			jQuery("#ginnerDiv").hide();
			jQuery("#spinnerDiv").hide();
			 if('<s:property value="command"/>'=="update"){
					if(ware!=''){
						$('#warehouseName').attr("disabled",true);
					}
					 }
		
			
		$(".select2").select2();
		var creInfo=($('input:radio[name="agent.status"]:checked').val());
		if(creInfo==0){
			jQuery("#passwordDiv").hide();
			jQuery("#confPasswordDiv").hide();
		}
		else{
			jQuery("#passwordDiv").show();
			jQuery("#confPasswordDiv").show();
		}
		
	
		
	});
	

	
</script>
<body>

	<s:form name="form" action="%{type}_%{command}" method="post" enctype="multipart/form-data"
		cssClass="fillform">
		<s:hidden key="currentPage" />
		<s:hidden key="id" id="id" />
		<s:hidden key="command" />
		<s:hidden name="agent.txnMode" value="3" />
		<s:hidden key="selecteddropdwon" id="listname" />
		<s:hidden key="temp" id="temp" />
		<s:hidden key="type" id="type" />
		<s:hidden key="agent.id" id="agentId" />
		<s:if test='"update".equalsIgnoreCase(command)'>
			<s:hidden key="agent.bodStatus" id="agent.bodStatus" />
			<s:if test="card != null">
				<s:hidden key="card.id" id="card.id" />
				<s:hidden key="card.cardId" />
				<s:hidden key="card.cardType" />
			</s:if>
			<s:if test="account != null">
				<s:hidden key="account.id" />
				<s:hidden key="account.accountNo" />
				<s:hidden key="account.accountType" />
			</s:if>
		</s:if>
			<div class="ferror" id="errorDiv" class=" hide alert alert-danger">
			<s:actionerror theme="bootstrap" />
			<s:fielderror theme="bootstrap" />
		</div>

	<div id="accordion" class="custom-accordion pers_info">
			<div class="card-header card mb-1 shadow-none">
				<a href="#persInfo" class="text-dark" data-toggle="collapse"
					aria-expanded="true" aria-controls="collapseOne">
					<div class="card-header" id="headingOne">
						<h6 class="m-0">
							<div class="wizard-wrapper">
								<div class="wizard-icon">
									<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path
												d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z"
												fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path
												d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z"
												fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
									</span>

								</div>
								<div class="wizard-label">

									<h3 class="wizard-title">
										<s:text name='%{"info"+type}' />
									</h3>
									<div class="wizard-desc">Setup Agent Basic Information
										Details</div>
								</div>
							</div>
							<i
								class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
						</h6>
					</div>
				</a>

			</div>

			<div id="persInfo" class="collapse show" aria-labelledby="headingOne"
				data-parent="#accordion">
				<div class="card-body">

					<div class="row">
<s:if test='"update".equalsIgnoreCase(command)'>
						<div class="col-md-4">
							<div class="form-group profileId">
								<label for="txt"><s:text name='Agent Id' />
								</label>
								<div class="">
									<s:textfield id="agentID" name="agent.profileId" readonly="true"
									cssClass="form-control " />
								</div>
							</div>
						</div></s:if><s:else>
						<div class="col-md-4">
							<div class="form-group profileId">
								<label for="txt"> <s:text name='Agent Id' /><sup
								style="color: red;">*</sup>
								</label>
								<div class="">
								<s:textfield name="agent.profileId" maxlength="12"
									cssClass="form-control" />
								</div>
							</div>
						</div></s:else>


						<div class="col-md-4">
							<div class="form-group firstName">
								<label for="txt"> <s:text name="personalInfo.firstName" /><sup
							style="color: red;">*</sup>
								</label>
								<div class="">
									<s:textfield id="firstName" name="agent.personalInfo.firstName" cssClass="upercls form-control"
								maxlength="35" />
								</div>
							</div>
						</div>
	<div class="col-md-4">
							<div class="form-group lastName">
								<label for="txt"><s:text name="personalInfo.lastName" /></label>
								<div class="">
									<s:textfield id="lastName" name="agent.personalInfo.lastName" cssClass="upercls form-control "
								maxlength="35" />
								</div>
							</div>
						</div>

					</div>

					<div class="row">
					
						<div class="col-md-4">
							<div class="form-group identityType">
								<label for="txt"><s:text name="personalInfo.identityType" /> </label>
								<div class="">
									<s:select id="identityType" headerKey=""
								headerValue="%{getText('txt.select')}"
								name="agent.personalInfo.identityType" list="identityTypeList"
								listKey="key" listValue="value" 
								cssClass="form-control" />
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group identityNumber">
								<label for="txt"><s:text name="personalInfo.identityNumber" /> </label>
								<div class="">
									<s:textfield name="agent.personalInfo.identityNumber" maxlength="16"
								cssClass="form-control" />
								</div>
							</div>
						</div>
						
						
						
 						<div class="col-md-4">
							<div class="form-group sex">
								<label for="txt"> <s:text name="personalInfo.sex" />
								</label>
								<div class="">
									<s:select list="genderType" headerKey="" id="sex"
								headerValue="%{getText('txt.select')}" listKey="key" listValue="value"
								name="agent.personalInfo.sex" cssClass="form-control" />

								</div>
							</div>
						</div> 
						
					</div>


					<div class="row">

						<div class="col-md-4">
							<div class="form-group dateOfBirth">
								<label for="txt"> <s:text name="personalInfo.dateOfBirth" />
								</label>
								<div class="">
					<s:textfield name="dateOfBirth" maxlength="16" id="calendar" cssClass="form-control " />

								</div>

							</div>

						</div>

					<s:if test="type=='fieldStaff'">
				<s:hidden name="agent.agentType.id" value="2" />
			</s:if>
			<s:else>
				<s:hidden name="agent.agentType.id" value="1" />
			</s:else> 
					</div>
					

				</div>
			</div>
		</div>
		
<div id="accordion" class="custom-accordion contact_info">
			<div class="card-header card mb-1 shadow-none">
				<a href="#contactInfo" class="text-dark" data-toggle="collapse"
					aria-expanded="true" aria-controls="collapseTwo">
					<div class="card-header" id="headingTwo">
						<h6 class="m-0">
							<div class="wizard-wrapper">
								<div class="wizard-icon">
									<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path
												d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z"
												fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path
												d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z"
												fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
									</span>

								</div>
								<div class="wizard-label">

									<h3 class="wizard-title">
									<s:text name="info.contact" />
									</h3>
									<div class="wizard-desc">Setup Agent Contact Information
										Details</div>
								</div>
							</div>
							<i
								class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
						</h6>
					</div>
				</a>

			</div>

			<div id="contactInfo" class="collapse show" aria-labelledby="headingTwo"
				data-parent="#accordion">
				<div class="card-body">

					<div class="row">

						<div class="col-md-4">
							<div class="form-group address">
								<label for="txt"><s:text name="contactInfo.address" />
								</label>
								<div class="">
									<s:textarea name="agent.contactInfo.address1"
								size="25" maxlength="150" cssClass="form-control "
								cssStyle="height:40px" />
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group phoneNumber">
								<label for="txt"> <s:text name="contactInfo.phoneNumber" />
								</label>
								<div class="">
								<s:textfield name="agent.contactInfo.phoneNumber" maxlength="12" cssClass="form-control " />
								</div>
							</div>
						</div>


						<div class="col-md-4">
							<div class="form-group firstName">
								<label for="txt"> <s:text name="agentcontactInfo.mobileNumber" /><sup
							style="color: red;">*</sup>
								</label>
								<div class="">
									<s:textfield name="agent.contactInfo.mobileNumber" maxlength="15" cssClass="form-control " />
								</div>
							</div>
						</div>


					</div>

					<div class="row">
					
						<div class="col-md-4">
							<div class="form-group identityType">
								<label for="txt"><s:text name="agentcontactInfo.email" /> </label>
								<div class="">
									<s:textfield name="agent.contactInfo.email" maxlength="45" cssClass="form-control " />
								</div>
							</div>
						</div>
				
						
					</div>



				</div>
			</div>
		</div>
	
	
		
		<s:if test='"update".equalsIgnoreCase(command) &&  card != null  '>
		
		<div id="accordion" class="custom-accordion card_info">
			<div class="card-header card mb-1 shadow-none">
				<a href="#cardInfo" class="text-dark" data-toggle="collapse"
					aria-expanded="true" aria-controls="collapseFour">
					<div class="card-header" id="headingFour">
						<h6 class="m-0">
							<div class="wizard-wrapper">
								<div class="wizard-icon">
									<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path
												d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z"
												fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path
												d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z"
												fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
									</span>

								</div>
								<div class="wizard-label">

									<h3 class="wizard-title">
									<s:text name="info.card" />
									</h3>
									<div class="wizard-desc">Setup Agent Card Information </div>
								</div>
							</div>
							<i
								class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
						</h6>
					</div>
				</a>

			</div>

			<div id="cardInfo" class="collapse show" aria-labelledby="headingFour"
				data-parent="#accordion">
				<div class="card-body">

					<div class="row">

						<div class="col-md-4">
							<p class="form-group ">
													<s:text name="agent.card.id" />
												</p>
												<p class="form-control"
													name="card.cardId">
													<s:property value="card.cardId" />
												</p>
						</div>
						<div class="col-md-4">
							<div class="form-group cardStatus">
								<label for="txt"> <s:text name="status.card.name" /><sup
								style="color: red;">*</sup>
								</label>
								<div class="">
									<s:select id="cardStat" name="card.status" list="cardStatusList"
									listKey="key" listValue="value"	cssClass="form-control " />
								</div>
							</div>
						</div>


						<div class="col-md-4">
							<div class="form-group rewrite">
								<label for="txt"> <s:text name="rewrite.card.name" /><sup
								style="color: red;">*</sup>
								</label>
								<div class="">
									<s:select id="cardWrite" name="card.cardRewritable"
									list="cardRewriteList" listKey="key" listValue="value" cssClass="form-control " />
								</div>
							</div>
						</div>


					</div>



				</div>
			</div>
		</div>
		</s:if>
		
				<s:if
			test='"update".equalsIgnoreCase(command) &&  account != null  && type=="fieldStaff"'>
		
		<div id="accordion" class="custom-accordion acc_info">
			<div class="card-header card mb-1 shadow-none">
				<a href="#accInfo" class="text-dark" data-toggle="collapse"
					aria-expanded="true" aria-controls="collapseFive">
					<div class="card-header" id="headingFive">
						<h6 class="m-0">
							<div class="wizard-wrapper">
								<div class="wizard-icon">
									<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path
												d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z"
												fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path
												d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z"
												fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
									</span>

								</div>
								<div class="wizard-label">

									<h3 class="wizard-title">
									<s:text name="info.account" />
									</h3>
									<div class="wizard-desc">Setup Agent Account Information </div>
								</div>
							</div>
							<i
								class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
						</h6>
					</div>
				</a>

			</div>

			<div id="accInfo" class="collapse show" aria-labelledby="headingFive"
				data-parent="#accordion">
				<div class="card-body">

					<div class="row">

						<div class="col-md-4">
							<p class="form-group accountNo">
													<s:text name="agent.account.id" />
												</p>
												<p class="form-control" name="account.accountNo">
													<s:property value="account.accountNo" />
												</p>
						</div>
				<div class="col-md-4">
							<p class="form-group accountType">
													<s:text name="agent.account.type" />
												</p>
												<p class="form-control" name="account.accountType">
													<s:text name='%{account.accountType}' />
												</p>
						</div>


						<div class="col-md-4">
							<div class="form-group accStatus">
								<label for="txt"> <s:text name="Agentstatus.account.name" /><sup
								style="color: red;">*</sup>
								</label>
								<div class="">
									<s:select id="accountStat" name="account.status"
									list="accountStatusList" listKey="key" listValue="value" cssClass="form-control " />
								</div>
							</div>
						</div>


					</div>



				</div>
			</div>
		</div>
		</s:if>
		<div id="accordion" class="custom-accordion group_info">
			<div class="card-header card mb-1 shadow-none">
				<a href="#groupInfo" class="text-dark" data-toggle="collapse"
					aria-expanded="true" aria-controls="collapseSix">
					<div class="card-header" id="headingSix">
						<h6 class="m-0">
							<div class="wizard-wrapper">
								<div class="wizard-icon">
									<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path
												d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z"
												fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path
												d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z"
												fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
									</span>

								</div>
								<div class="wizard-label">

									<h3 class="wizard-title">
									<s:property value="%{getLocaleProperty('info.samithi')}" />
									</h3>
									<div class="wizard-desc">Setup Agent Group Information </div>
								</div>
							</div>
							<i
								class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
						</h6>
					</div>
				</a>

			</div>

			<div id="groupInfo" class="collapse show" aria-labelledby="headingSix"
				data-parent="#accordion">
				<div class="card-body">

					<div class="row">

						<div class="col-md-12">
						<div class="form-group">
						
						<label for="txt">  <s:text name="%{getLocaleProperty('availableWarehouse')}"
											/><sup
								style="color: red;">*</sup></label>
    
								<div class="">
									 
      <s:select  id="availableWarehouse" name="agent.availableWarehouse" list="groupList" listKey="key" listValue="value" 
      class="select2 form-control form-control-lg select2-multiple" multiple="true"  />
                                                         
								</div>
						
						
                                                       
                                                        
              
                                                    </div>
						</div>
			
	


					</div>



				</div>
			</div>
		</div>	
		
		
<div id="accordion" class="custom-accordion credential_info">
			<div class="card-header card mb-1 shadow-none">
				<a href="#credentialInfo" class="text-dark" data-toggle="collapse"
					aria-expanded="true" aria-controls="collapseThree">
					<div class="card-header" id="headingThree">
						<h6 class="m-0">
							<div class="wizard-wrapper">
								<div class="wizard-icon">
									<span class="svg-icon svg-icon-2x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/General/User.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24"></polygon>
																			<path
												d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z"
												fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<path
												d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z"
												fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
									</span>

								</div>
								<div class="wizard-label">

									<h3 class="wizard-title">
									<s:text name="info.credential" />
									</h3>
									<div class="wizard-desc">Setup Agent Credential Information </div>
								</div>
							</div>
							<i
								class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
						</h6>
					</div>
				</a>

			</div>

			<div id="credentialInfo" class="collapse show" aria-labelledby="headingThree"
				data-parent="#accordion">
				<div class="card-body">

					<div class="row">

						<div class="col-md-4">
							<div class="form-group status">
								<label for="txt"><s:text name="agent.status.name" /><sup
							style="color: red;">*</sup>
								</label>
								<div class="">
									<s:select list="statuses" id="agentStatus" listKey="key"
								listValue="value" name="agent.status" cssClass="form-control"
								value="StatusDefaultValue" onchange="listpassword(this)" maxlength="12" />
								</div>
							</div>
						</div>
						<div class="col-md-4" id="passwordDiv">
							<div class="form-group password">
								<label for="txt"> <s:text name="agent.passwordName" /> <sup
							style="color: red;">*</sup>
								</label>
								<div class="">
								<s:password showPassword="true" name="agent.password"
								id="password" value="%{agent.password}"
								cssClass="form-control " maxlength="12" />
								</div>
							</div>
						</div>


						<div class="col-md-4" id="confPasswordDiv">
							<div class="form-group confPassword">
								<label for="txt"> <s:text name="agent.confPasswordName" /> <sup
							style="color: red;">*</sup>
								</label>
								<div class="">
									<s:password showPassword="true" name="agent.confirmPassword"
								id="password1" value="%{agent.confirmPassword}" cssClass="form-control "
								maxlength="10" />
								</div>
							</div>
						</div>


					</div>



				</div>
			</div>
		</div>
<div class="button-items float-right">
				
						<s:if test="command =='create'">
				<button type="submit" id="buttonAdd1"
					onclick="event.preventDefault();onSubmit();"
					class="btn btn-success waves-effect waves-light">
					<i class="ri-check-line align-middle mr-2"></i> Save
				</button>
				
					<button type="button" onclick="onCancel();"
				class="btn btn-danger waves-effect waves-light">
				<i class="ri-close-line align-middle mr-2"></i> Cancel
			</button>
			</s:if>
				<s:else>
				
	<button type="submit" id="button1233"
					onclick="event.preventDefault();onUpdateClick();"
					class="btn btn-primary waves-effect waves-light">
					<i class="ri-error-warning-line align-middle mr-2"></i> Update
				</button>

					<button type="button" onclick="onCancel();"
				class="btn btn-danger waves-effect waves-light">
				<i class="ri-close-line align-middle mr-2"></i> Cancel
			</button>


				</s:else>
			</div>



		<script>
			function getTwentyYearsBack(){
				return new Date().getFullYear()-20;
			}

			jQuery(function($){
				$("#calendar").datepicker({
					defaultDate : new Date(getTwentyYearsBack(), 01, 00),
					autoclose: true
				});
			});
	</script>
	</s:form>
	<s:form name="cancelform" action="%{type}_list?type=%{type}">
		<s:hidden key="currentPage" />
	</s:form>
	<s:form name="serviceLocation"
		action="%{type}_populateServiceLocation.action">
	</s:form>
	<s:if test='pendingMTNTExists==true'>
		<script>
		var actionFrom = "%{type}";
		function submitForm(){
			
			onUpdateClick();
		}
	</script>
		<s:include value="procurementProductTransferPopup.jsp"></s:include>
	</s:if>


	<script type="text/javascript">

function listState(call){	
	var callback = {
    	success: function (oResponse) 	{   
		var result=oResponse.responseText;
		var arry =populateValues(result);
		document.form.selectedState.length = 0;
		addOption(document.form.state, "Select", "");
		for (var i=0; i < arry.length;i++){
			if(arry[i]!="")
			addOption(document.form.state, arry[i], arry[i]);
		}
		listLocality(document.getElementsByName('selectedState')[0]);
		}
	}
    var data = "selectedCountry="+call.value;	 
	var url='<%=request.getParameter("type")%>_populateState';	
	var conn = YAHOO.util.Connect.asyncRequest("POST",url,callback,data);	   
}

function listLocality(call){	
	var callback = {
    	success: function (oResponse) 	{
		var result=oResponse.responseText;
		var arry =populateValues(result);
		document.form.localities.length = 0;
		addOption(document.form.localities, "Select", "");
		for (var i=0; i < arry.length;i++){
			if(arry[i]!="")
			addOption(document.form.localities, arry[i], arry[i]);
		}
		listMunicipality(document.getElementsByName('selectedLocality')[0]);
		}
    }
   	var data = "selectedState="+call.value;	 
	var url='<%=request.getParameter("type")%>_populateLocality.action';	   
    var conn = YAHOO.util.Connect.asyncRequest("POST",url,callback,data);	   
}
function listMunicipality(call){	
	var callback = {
    	success: function (oResponse) 	{
		var result=oResponse.responseText;
		var arry =populateValues(result);
		document.form.city.length = 0;
		addOption(document.form.city, "Select", "");
		
		for (var i=0; i < arry.length;i++){
			if(arry[i]!="")
			addOption(document.form.city, arry[i], arry[i]);
		}
		}
    }
   	var data = "selectedLocality="+call.value;	 
	var url='<%=request.getParameter("type")%>_populateCity.action';	   
    var conn = YAHOO.util.Connect.asyncRequest("POST",url,callback,data);	   
}


function listpassword(call){
		var status=call.value;
		jQuery("#passwordDiv").hide();
		jQuery("#confPasswordDiv").hide();
		if (status==1){
			jQuery("#passwordDiv").show();
			jQuery("#confPasswordDiv").show();
		}
}

function listServiceLocation(call){
	try{
	   	var data = call.value;	
	   	if(jQuery.trim(data)!="-1"){  
		    var tempId = document.getElementById('agent.id').value;        
		    var url =  "<%=request.getParameter("type")%>_populateServiceLocation.action";
	        $.post(url,{servicePointName:data,id:tempId},function(result){           
	             $("#serviceLocationDiv").html(result);
	        });
	   	}
	   	else{
	   		$("#serviceLocationDiv").html("");
	   	}
   	}
   	catch(e){			
	}
}

function listWareHouses(call){
	try{
	   	var data = call.value;	
	   	if(jQuery.trim(data)!="-1"){  
		    var tempId = document.getElementById('agentId').value;   
		    document.getElementById('test').innerHTML = tempId;
		    var url =  "<%=request.getParameter("type")%>_populateWareHouse.action";
	        $.post(url,{cooperativeName:data,id:tempId,dt:new Date()},function(result){           
	        	$("#serviceLocationDiv").html("");
		        $("#serviceLocationDiv").html(result);
	        });
	   	}
	   	else{
	   		$("#serviceLocationDiv").html("");
	   	}
   	}
   	catch(e){			
	}
}

function onSubmit(){
	//$("#buttonAdd1").attr("disabled", true);
	
	try{

		capitalizeName();		
	    document.form.submit();	   	 
	}catch(e){
	}
}

function capitalizeName(){
	var arr=["firstName", "lastName"];
	for(var i=0;i<arr.length;i++){
		var txt1 = document.getElementById(arr[i]).value;
		if(txt1!=null || txt!=""){
			capital(arr[i],txt1);
		}
	}
}
function capital(id,txt){
	$(document.getElementById(id)).val(txt.replace(/^(.)|\s(.)/g, function($1){ 
		   return $1.toUpperCase( ); 
		   }));
}

function buttonDPhotoCancel() {
	document.getElementById("model-close-DPhoto-btn").click();
}

function onUpdateClick(){
	try{
		if(document.getElementById('select') != null ){
			document.getElementById('select').multiple = true; //to enable all option to be selected
		    for (var x = 0; x < document.getElementById('select').options.length; x++)//count the option amount in selection box
		    {
		        document.getElementById('select').options[x].selected = true;		       
		    }//select all option when u click save button
		}
		/* if(document.getElementById('optrnsfr') != null ){
			document.getElementById('optrnsfr').multiple = true; //to enable all option to be selected
		    for (var x = 0; x < document.getElementById('optrnsfr').options.length; x++)//count the option amount in selection box
		    {
		        document.getElementById('optrnsfr').options[x].selected = true;		       
		    }//select all option when u click save button
		} */
		//$('#selectedAgentType').prop('disabled',false);
		capitalizeName();
		
		$('#warehouseName').attr("disabled",false);
		 $('#selectedAgentType').attr("disabled",false);
		
	    document.form.submit(); 
	}catch(e){ 
		console.log(e);
	}
}

$(function () { 
	$("#dynOpt").find("input[type='button'][value='<s:text name="RemoveAll"/>']").addClass("btn btn-warning");
	//$("#dynOpt input[value='Remove']").addClass("btn btn-warning");
	$("#dynOpt").find("input[type='button'][value='<s:text name="Add"/>']").addClass("btn btn-small btn-success fa fa-step-forward");
	$("#dynOpt").find("input[type='button'][value='<s:text name="Remove"/>']").addClass("btn btn-danger");
	$("#dynOpt").find("input[type='button'][value='<s:text name="AddAll"/>']").addClass("btn btn-sts");
	})

	function isNumber(evt) {
			
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}
	function isDecimal(evt) {
		
		 evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) {
		        return false;
		    }
		    return true;
	}
</script>

</body>