<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
<head>

<!-- add this meta information to select layout  -->
<META name="decorator" content="swithlayout">


</head>
<body>
<s:form method="post" name="form" id="form" cssClass="fillform"
			action="device_%{command}">
			
			<s:hidden key="id" id="id" />
				<s:hidden name="device.deviceType" value="Mobile" />
				<s:if test='"update".equalsIgnoreCase(command)'>
					<s:hidden name="device.id" />
					<s:hidden name="agentName" />
				</s:if>
				<s:hidden name="command" />
				<s:hidden name="heading" />
				<s:hidden name="currentPage" />
				
				<div class="ferror" id="errorDiv" class=" hide alert alert-danger">
			<s:actionerror theme="bootstrap" />
			<s:fielderror theme="bootstrap" />
		</div>
	<div id="accordion" class="custom-accordion device_info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#deviceInfo" class="text-dark" data-toggle="collapse"
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
															<s:property value="%{getLocaleProperty('info.detail')}" />
														</h3>
														<div class="wizard-desc">Setup Device Information Details</div>
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
<s:if test='"update".equalsIgnoreCase(command)'>
									<div class="col-md-4">
							<div class="form-group deviceCode">
								<label for="txt"> <s:text name="profile.device.code" /><sup
									style="color: red;">*</sup>
								</label>
								<div class="form-control">
									<s:property value="device.code" />
									<s:hidden name="device.code" />
								</div>
							</div>
						</div></s:if>
					
										<div class="col-md-4">
							<div class="form-group deviceAddress">
								<label for="txt"><s:text name="deviceAddress" /><sup
									style="color: red;">*</sup>
								</label>
								<div class="">
								<s:select id="deviceAddress" list="deviceAddressList" listKey="key"
										listValue="value" name="dAddress" cssClass="form-control"
							
								onchange="getDeviceAddress(this.value);" />
								</div>
							</div>
						</div>

						<div class="col-md-4 serialNo">
							<div class="form-group serialNumber">
								<label for="txt"><s:text
									name="profile.device.serialNumber" /><sup style="color: red;">*</sup>
								</label>
								<div class="">
									<s:if test='"update".equalsIgnoreCase(command)'>
									<s:textfield disabled="true" name="device.serialNumber"
										cssClass="form-control"></s:textfield>
									<s:hidden name="device.serialNumber" />
								</s:if>
								<s:else>
									<s:textfield name="device.serialNumber" maxLength="35"
										cssClass="form-control" />
								</s:else>
								</div>
							</div>
						</div>
						
						
							
									</div>
									
									<div class="row">
<s:if test='"create".equalsIgnoreCase(command)'>
										<div class="col-md-4">
							<div class="form-group macAddress">
								<label for="txt"><s:text name="macAddress" /><sup
									style="color: red;">*</sup>
								</label>
								<div class="">
								<s:textfield name="device.macAddress" maxLength="20"
										cssClass="form-control " />
								</div>
							</div>
						</div>
						</s:if>
						<div class="col-md-4 ">
							<div class="form-group deviceName">
						<label for="txt">		<s:text name="profile.device.name" /><sup
								style="color: red;">*</sup>
								</label>
								<div class="">
								<s:textfield name="device.name" maxLength="20"
									cssClass="form-control " />
								</div>
							</div>
						</div>
						<s:if test='"update".equalsIgnoreCase(command)'>
<div class="col-md-4 ">
							<div class="form-group deviceStatus">
							<label for="txt">	<s:text
										name="profile.device.deviceStatus" />
								</label>
								<div class="">
							<s:radio list='listDeviceStatus' name="device.enabled"></s:radio>
								</div>
							</div>
						</div>
						</s:if>
<s:if test='"update".equalsIgnoreCase(command)'>
										<div class="col-md-4">
							<div class="form-group agentName">
								<label for="txt"><s:text name="agentName" />
								</label>
								<div class="">
								<s:if test='"".equalsIgnoreCase(agentName)'>
										<s:select name="agentId" id="agentSelect"
											list="agentListNotMapWithDevice" headerKey="-1"
											headerValue="%{getText('txt.select')}" listKey="key"
											listValue="value" cssClass="form-control input-sm select2"/>

									</s:if>
									<s:else>
										<s:textfield disabled="true" cssClass="form-control"
											value="%{agentName}"></s:textfield>
									</s:else>
								</div>
							</div>
						</div>
						</s:if>
							
									</div>
		
									
								</div>
</div>
<div class="button-items float-right">
						<s:if test="command =='create'">
					
							<button type="button" id="button_create"
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
					
								<button type="button" id="button"
					onclick="event.preventDefault();onSubmit();"
					class="btn btn-primary waves-effect waves-light">
					<i class="ri-error-warning-line align-middle mr-2"></i> Update
				</button>
							
				<button type="button" onclick="onCancel();"
				class="btn btn-danger waves-effect waves-light">
				<i class="ri-close-line align-middle mr-2"></i> Cancel
			</button>
						</s:else>
					</div>
</s:form>
		<s:form name="deviceListForm" id="deviceListForm" action="device_list">
			<s:hidden name="currentPage" />
		</s:form>
	<script>
		
$(document).ready(function(){
		
		var address = $('#deviceAddress').val();
		//alert(address);
		getDeviceAddress(address);
	});	
	function validateCombo() {
			if (document.getElementById("deviceTypeList") != null) {
				document.getElementById("deviceType").value = "";
				if (document.getElementById("deviceTypeList").value != "-1") {
					document.getElementById("deviceType").value = document
							.getElementById("deviceTypeList").value;
				}
			}
		}

		function onSubmit() {
			validateCombo();
			document.form.submit();
		}

		function onCancel() {
			document.deviceListForm.submit();
		}

		

		function getDeviceAddress(val) {
			//alert(val);
			if (val == '0') {
				$(".macAddress").hide();
				$(".serialNo").show();
			} else {
				$(".serialNo").hide();
				$(".macAddress").show();
			}
		}
	</script>
</body>
</html>