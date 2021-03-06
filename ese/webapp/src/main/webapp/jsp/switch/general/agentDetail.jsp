<%@ include file="/jsp/common/detail-assets.jsp"%>
<head>
<!-- add this meta information to select layout  -->
<meta name="decorator" content="swithlayout">
</head>
<script type="text/javascript">
$(document).ready(function () {
    $('#update').on('click', function (e) {
      
    	document.updateform.id.value = document.getElementById('id').value;
        document.updateform.currentPage.value = document.form.currentPage.value;
        document.updateform.submit();
    });

    $('#delete').on('click', function (e) {
        if (confirm('<s:text name="confirm.delete"/> ')) {
            document.deleteform.id.value = document.getElementById('id').value;
            document.deleteform.currentPage.value = document.form.currentPage.value;
            document.deleteform.submit();
        }
    });
});

	function onBODReset() {
		if (confirm('<s:text name="confirm.resetBOD"/>'))
			document.txnStatusResetForm.submit();
	}
	function onEODReset() {
		if (confirm('<s:text name="confirm.resetEOD"/>'))
			document.txnStatusResetForm.submit();
	}
	function idSeqMigrationCal() {
		document.migrationform.action = "%{type}_updateIdSeq?type=%{type}";
		document.migrationform.submit();
	}
	function enableFarmerPhotoModal(idArr,type) {
		try {
			$("#mbody").empty();
			var mbody = "";
			mbody = "";
			mbody = "<div class='item active'>";
			mbody += '<img src="fieldStaff_populateImage.action?id='
					+ idArr + '&type='+type+'"/>';
			mbody += "</div>";
			$("#mbody").append(mbody);
			
			document.getElementById("enablePhotoModal").click();
		} catch (e) {
			alert(e);
		}
	}
	function buttonDPhotoCancel() {
		document.getElementById("model-close-DPhoto-btn").click();
	}
</script>

<s:form name="form" cssClass="fillform">
	<s:hidden key="currentPage" />
	<s:hidden key="agent.id" />
	<s:hidden key="type" id="type" />
	<s:hidden key="command" />
<s:hidden key="agent.id" id="id" />
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
										<div class="col-md-4">
										
												<p class="form-group profileId">
													<s:property
														value="%{getLocaleProperty('Agent Id')}" />
												</p>
												<p class="form-control" name="agent.profileId">
													<s:property value="agent.profileId" />
												</p>
					

										</div>
								<div class="col-md-4">
										
												<p class="form-group firstName">
													<s:text name="personalInfo.firstName" />
												</p>
												<p class="form-control" name="agent.personalInfo.firstName">
													<s:property value="agent.personalInfo.firstName" />
												</p>
					

										</div>	
										
							<div class="col-md-4">
										
												<p class="form-group lastName">
													<s:text name="personalInfo.lastName" />
												</p>
												<p class="form-control" name="agent.personalInfo.lastName">
													<s:property value="agent.personalInfo.lastName" />
												</p>
					

										</div>			
										
										
					</div>

					<div class="row">
					
										<div class="col-md-4">
										
												<p class="form-group identityType">
													<s:text name="personalInfo.identityType" />
												</p>
												<p class="form-control" name="agent.personalInfo.identityType">
													<s:text name='%{agent.personalInfo.identityType}' />
												</p>
					

										</div>	
										<div class="col-md-4">
										
												<p class="form-group identityNumber">
													<s:text name="personalInfo.identityNumber" />
												</p>
												<p class="form-control" name="agent.personalInfo.identityNumber">
													<s:property value="agent.personalInfo.identityNumber" />
												</p>
					

										</div>	
						
								<div class="col-md-4">
										
												<p class="form-group sex">
													<s:text name="personalInfo.sex" />
												</p>
												<p class="form-control" name="agent.personalInfo.sex">
													<s:text name='%{agent.personalInfo.sex}' />
												</p>
					

										</div>	 
						
					</div>


					<div class="row">

				<div class="col-md-4">
										
												<p class="form-group dateOfBirth">
													<s:text name="personalInfo.dateOfBirth" />
												</p>
												<p class="form-control" name="agent.personalInfo.dateOfBirth">
													<s:property value="dateOfBirth" />
												</p>
					

										</div>	 

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
										
												<p class="form-group address">
													<s:text name="contactInfo.address" />
												</p>
												<p class="form-control" name="agent.contactInfo.address1">
												<s:property value="agent.contactInfo.address1" />
												</p>
					

										</div>	
						<div class="col-md-4">
										
												<p class="form-group phoneNumber">
													<s:text name="contactInfo.phoneNumber" />
												</p>
												<p class="form-control" name="agent.contactInfo.phoneNumber">
												<s:property value="agent.contactInfo.phoneNumber" />
												</p>
					

										</div>


								<div class="col-md-4">
										
												<p class="form-group mobileNumber">
													<s:text name="agentcontactInfo.mobileNumber" />
												</p>
												<p class="form-control" name="agent.contactInfo.mobileNumber">
												<s:property value="agent.contactInfo.mobileNumber" />
												</p>
					

										</div>


					</div>

					<div class="row">
					
			<div class="col-md-4">
										
												<p class="form-group email">
													<s:text name="agentcontactInfo.email" />
												</p>
												<p class="form-control" name="agent.contactInfo.email">
												<s:property value="agent.contactInfo.email" />
												</p>
					

										</div>
				
						
					</div>



				</div>
			</div>
		</div>
	
	
			<s:if test="card != null">
		
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
										
												<p class="form-group cardId">
												<s:text name="agent.card.id" />
												</p>
												<p class="form-control" name="agent.card.id">
												<s:property value="card.cardId" />
												</p>
								</div>
				<div class="col-md-4">
										
												<p class="form-group cardStatus">
												<s:text name="status.card.name" />
												</p>
												<p class="form-control" name="agent.card.name">
											<s:text name='%{"card"+card.status}' />
												</p>
								</div>


				<div class="col-md-4">
										
												<p class="form-group rewrite">
											<s:text name="rewrite.card.name" />
												</p>
												<p class="form-control" name="agent.card.rewrite">
											<s:text name='%{"cardRewrite"+card.cardRewritable}' />
												</p>
								</div>



					</div>



				</div>
			</div>
		</div>
		</s:if>
		
			<s:if test="type=='fieldStaff'">
					<s:if test="account != null">
		
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
										
												<p class="form-group accId">
											<s:text name="agent.account.id" />
												</p>
												<p class="form-control" name="agent.account.accountNo">
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
							<p class="form-group accountStatus">
													<s:text name="Agentstatus.account.name" />
												</p>
												<p class="form-control" name="account.accountStatus">
													<s:text name='%{"account"+account.status}' />
												</p>
						</div>

					</div>



				</div>
			</div>
		</div>
		</s:if>
		</s:if>
		<s:if test="agent.agentType.code!=05 && agent.agentType.code!=04">
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
						<p class="form-group samithi">
													<s:text name="%{getLocaleProperty('agent.samithi')}" />
												</p>
												<p class="form-control" name="warehouseNames">
													<s:property value="warehouseNames" />
												</p>
						</div>
			
	


					</div>



				</div>
			</div>
		</div>	</s:if>
		
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
										
												<p class="form-group status">
												<s:text name="agent.status.name" />
												</p>
												<p class="form-control" name="agent.status.name">
												<s:text name='%{"agent"+agent.status}' />
												</p>
		</div>


					</div>



				</div>
			</div>
		</div>
		

	
	<div class="button-items float-right">

		
				<sec:authorize ifAllGranted="profile.agent.update">
							<button type="button" id="update"
								class="btn btn-success waves-effect waves-light">
								<i class="ri-check-line align-middle mr-2"></i>Edit
							</button>

						</sec:authorize>
						<sec:authorize ifAllGranted="profile.agent.delete">
							<button type="button" id="delete"
								class="btn btn-danger waves-effect waves-light">
								<i class="ri-close-line align-middle mr-2"></i>
								<s:text name="delete.button" />
							</button>
						</sec:authorize>

				<button type="button" id="cancel"
							class="btn btn-warning waves-effect waves-light">
							<i class="ri-error-warning-line align-middle mr-2"></i>
							<s:text name="back.button" />
						</button>
						
		<s:set name="loginUserRole" value="%{loginUserRole}" />

		<s:if
			test='"exec".equals(loginUserName)|| #loginUserRole.equals("Admin")'>
			
	
		
			<s:if test='agent.bodStatus!=0'>
			
			<span id="reset" class=""><span class="first-child"><button
					type="button"  onclick="onBODReset();" class="back-btn btn btn-sts">
					<b><FONT color="#FFFFFF"><s:text name="reset.BOD" /> </font></b>
				</button></span></span>
			
			
			
				
			</s:if>
		</s:if>
		<span id="idchange" class="" style="display: none"><span
			class="first-child">
				<button type="button" onclick="idSeqMigrationCal()"
					class="cancel-btn">
					<b><FONT color="#FFFFFF"><s:text name="cancel.button" />
					</font></b>
				</button>
		</span></span>
	</div> 
</s:form>



<s:form name="updateform" action="%{type}_update?type=%{type}">
	<s:hidden key="id" />
	<s:hidden key="currentPage" />
</s:form>
<s:form name="deleteform" action="%{type}_delete?type=%{type}">
	<s:hidden key="id" />
	<s:hidden key="currentPage" />
</s:form>
<s:form name="cancelform" action="%{type}_list?type=%{type}">
	<s:hidden key="currentPage" />
</s:form>
<s:form name="migrationform" action="%{type}_updateIdSeq?type=%{type}">

</s:form>
<s:form name="txnStatusResetForm" id="txnStatusResetForm"
	action="%{type}_reset?type=%{type}">
	<s:hidden name="id" />
	<s:hidden name="currentPage" />
</s:form>
