<%@ include file="/jsp/common/form-assets.jsp"%>
<head>
<META name="decorator" content="swithlayout">
</head>
<div class="error" style="margin-bottom: 0px;">
	<s:fielderror />
</div>
<div id="warn" class="error" style="margin-bottom: 0px;">
	<s:actionerror />
</div>
<div id="rolde">
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
									<div class="wizard-desc">Role details</div>
								</div>
							</div>
							<i
								class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
						</h6>
					</div>
				</a>

			</div>
			<div class="card-body">


				<div class="row">
					<div class="col-md-4">
						<div class="form-group farmerCode">
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
						<div class="form-group farmerCode">
							<label for="txt"> <s:text name="isAdmin" /><sup
								style="color: red;">*</sup>
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

		<div class="flex-view-layout">
			<div class="fullwidth">
				<div class="flexWrapper">
					<div class="flexLeft appContentWrapper">
						<div class="formContainerWrapper dynamic-form-con">
							<!--  <h2>
								<s:text name="info.role" />
							</h2> -->
							<s:if test='branchId==null'>
								<!-- <div class="dynamic-flexItem">
						<p class="flexItem"><s:text name="app.branch" /></p>
						<p class="flexItem"><s:property
							value="%{getBranchName(role.branchId)}" /></p>
					</div>  -->
							</s:if>
							<!-- <div class="dynamic-flexItem">
								<p class="flexItem">
									<s:text name="roleName" />
								</p>
								<p class="flexItem">
									<s:property value="role.name" />
								</p>
							</div>
							<div class="dynamic-flexItem">
								<p class="flexItem">
									<s:text name="isAdmin" />
								</p>
								<p class="flexItem">
									<s:if test="role.isAdminUser == 'true'">YES</s:if>
									<s:else>
    					NO
				</s:else>
								</p>
							</div> -->

						</div>

						<div class="flexItem flex-layout flexItemStyle">
							<div class="button-group-container">
								<s:if test='"Admin".equalsIgnoreCase(role.name)'>
									<a id="update" class="btn btn-success" class="disableBtn"><s:text
											name="edit.button" /></a>
								</s:if>
								<s:else>
									<a id="update" class="btn btn-success"><s:text
											name="edit.button" /></a>
									<a id="delete" class="btn btn-danger"><s:text
											name="delete.button" /></a>
								</s:else>

								<a id="cancel" class="btn btn-sts" href="role_list.action"><s:text
										name="cancel.button" /></a>
							</div>
						</div>
						<%-- <div class="yui-skin-sam">
						<sec:authorize ifAllGranted="profile.role.update">
				<span id="update" class=""><span class="first-child">
						<s:if test='"Admin".equalsIgnoreCase(role.name)'>
							<button type="button" disabled="disabled" class="disableBtn">
								<FONT color="#FFFFFF"> <b><s:text name="edit.button" /></b>
								</FONT>
							</button>
						</s:if> <s:else>
							<button type="button" class="edit-btn btn btn-success">
								<FONT color="#FFFFFF"> <b><s:text name="edit.button" /></b>
								</FONT>
							</button>
						</s:else>

				</span></span>
			</sec:authorize>
			<sec:authorize ifAllGranted="profile.role.delete">
				<span id="delete" class=""><span class="first-child">
						<s:if test='"Admin".equalsIgnoreCase(role.name)'>
							<button type="button" disabled="disabled" class="disableBtn">
								<FONT color="#FFFFFF"> <b><s:text
											name="delete.button" /></b>
								</font>
							</button>
						</s:if> <s:else>
							<button type="button" class="delete-btn btn btn-warning">
								<FONT color="#FFFFFF"> <b><s:text
											name="delete.button" /></b>
								</font>
							</button>
						</s:else>
				</span></span>
			</sec:authorize>
			<span id="cancel" class=""><span class="first-child"><a
					href="role_list.action" class="back-btn btn btn-sts"> <FONT
						color="#FFFFFF"> <s:text name="back.button" />
					</FONT>
				</a></span></span>
				</div> --%>
					</div>
				</div>
			</div>
		</div>
	</s:form>
</div>
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


</script>