<%@ include file="/jsp/common/form-assets.jsp"%>
<head>
<META name="decorator" content="swithlayout">
</head>
	<div class="ferror" id="errorDiv" class=" hide alert alert-danger">
			<s:actionerror theme="bootstrap" />
			<s:fielderror theme="bootstrap" />
		</div>

	<s:form name="roleform" action="role_update" cssClass="fillform">

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
										<s:text name="info.role" />
									</h3>
									<div class="wizard-desc">Setup Role Information Details</div>
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
						<div class="form-group roleName">
							<label for="txt"><s:text name="roleName" /><sup
								style="color: red;">*</sup> </label>

							<div class="">
								<p class="form-control detailField" name="farmer.farmerCode">
									<s:property value="role.name" />
								</p>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group isAdmin">
							<label for="txt"> <s:text name="isAdmin" />
							</label>
							<div class="">
								<p class="form-control detailField" name="farmer.farmerCode">
									<s:if test="role.isAdminUser == 'true'">YES</s:if>
									<s:else>NO</s:else>
								</p>
							</div>
						</div>
					</div>



				</div>

</div>
			</div>
		</div>
<div class="button-items float-right">
									<s:if test='"Admin".equalsIgnoreCase(role.name)'>
								
											
												<button type="button" id="update"
										class="btn btn-success waves-effect waves-light">
										<i class="ri-check-line align-middle mr-2"></i>Edit
									</button>
								</s:if><s:else>
								
								
									<button type="button" id="update"
										class="btn btn-success waves-effect waves-light">
										<i class="ri-check-line align-middle mr-2"></i>Edit
									</button>

									<button type="button" id="delete"
										class="btn btn-danger waves-effect waves-light">
										<i class="ri-close-line align-middle mr-2"></i>
										<s:text name="delete.button" />
									</button>
								
								
								</s:else>
								
								<button type="button" id="cancel" onclick="onCancel();"
									class="btn btn-warning waves-effect waves-light">
									<i class="ri-error-warning-line align-middle mr-2"></i>
									<s:text name="back.button" />
								</button>

							</div>
							

	</s:form>

<s:form name="deleteform" action="role_delete.action">
	<s:hidden key="id" />
</s:form>
<s:form name="updateform" action="role_update.action">
	<s:hidden key="id" />
</s:form>
<script type="text/javascript">

$(document).ready(function () {
    $('#update').on('click', function (e) {
    	 document.updateform.action = "role_update.action";
    	
         document.updateform.submit();
    });

    $('#delete').on('click', function (e) {
    	 if(confirm( '<s:text name="confirm.delete"/> ')){
    		 
 			document.deleteform.submit();
 		}
    });
});

function onCancel(){
	
		window.location.href="role_list.action";

}

</script>