<%@ taglib uri="/struts-tags" prefix="s"%>
<!--<script type="text/javascript" src="yui/element/element-beta-min.js"></script>
<script type="text/javascript" src="yui/button/button-min.js"></script>-->
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> --%>
<%@ include file="/jsp/common/detail-assets.jsp"%>

<head>
<!-- add this meta information to select layout  -->
<META name="decorator" content="swithlayout">


</head>
<body>

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

										<div class="col-md-4">
											<div class="dynamic-flexItem2">
												<p class="form-group deviceCode">
													<s:text name="profile.device.code" />
												</p>
												<p class="form-control" name="device.code">
													<s:property value="device.code" />
												</p>
											</div>

										</div>
										<div class="col-md-4">
											<p class="form-group serialNumber">
												<s:text name="profile.device.serialNumber" />
											</p>
											<p class="form-control" name="serialNumber">
												<s:property value="device.serialNumber" />
											</p>
										</div>

										<div class="col-md-4">
											<p class="form-group deviceName">
												<s:text name="profile.device.name" />
											</p>
											<p class="form-control" name="deviceName">
												<s:property value="device.name" />
											</p>
										</div>

							
									</div>
									
									<div class="row">

										<div class="col-md-4">
											<div class="dynamic-flexItem2">
												<p class="form-group deviceStatus">
													<s:text name="profile.device.deviceStatus" />
												</p>
												<p class="form-control" name="deviceStatus">
												<s:if test='device.enabled'>
											<s:text name="status.enabled" />
										</s:if>
										<s:else>
											<s:text name="status.disabled" />
										</s:else>
												</p>
											</div>

										</div>
										<div class="col-md-4">
											<p class="form-group agentName">
											<s:property value="%{getLocaleProperty('agentName')}" />
											</p>
											<p class="form-control" name="agentName">
												<s:if test='((agentName==null)||(agentName.equals(" ")))'>
													<s:text name="noMapWithAgent" />&nbsp;
												</s:if>
												<s:else>
													<s:property value="agentName" />&nbsp;
												</s:else>
											</p>
										</div>

						

							
									</div>
									
									
								</div>
</div>
				<div class="button-items float-right">
						<sec:authorize ifAllGranted="profile.device.update">
							<button type="button" id="update" onclick="onUpdate();"
								class="btn btn-success waves-effect waves-light">
								<i class="ri-check-line align-middle mr-2"></i>Edit
							</button>

						</sec:authorize>

						<sec:authorize ifAllGranted="profile.farmer.delete">
							<button type="button" id="delete" onclick="onDelete();"
								class="btn btn-danger waves-effect waves-light">
								<i class="ri-close-line align-middle mr-2"></i>
								<s:text name="delete.button" />
							</button>
						</sec:authorize>

						<button type="button" id="cancel" onclick="onCancel();"
							class="btn btn-warning waves-effect waves-light">
							<i class="ri-error-warning-line align-middle mr-2"></i>
							<s:text name="back.button" />
						</button>
						
							<s:if test='device.agent!=null'>
						<sec:authorize ifAllGranted="profile.device.update">
						
									<button type="button" onclick="onReset();"
										class="btn btn-secondary waves-effect waves-light">
											<i class="ri-loader-2-fill align-middle mr-2"></i>
									<s:text name="reset.button" />
										
									</button>
							
						</sec:authorize>
					</s:if>

					</div>
	
	<script type="text/javascript">
		function resetComplete(){
			modal.open({content: '<s:text name="unMapAgentSuccess"/>'});
			e.preventDefault();
		}
	</script>
	<s:if test='unMapAgent'>

		<script type="text/javascript">
		 resetComplete();
	</script>

	</s:if>
	<s:form name="deviceUpdateForm" id="deviceUpdateForm"
		action="device_update" cssClass="fillform">
		<s:hidden name="id" />
		<s:hidden name="currentPage" />
		<s:hidden name="command" />
		<s:hidden name="agentName" />
	</s:form>
	<s:form name="deviceDeleteForm" id="deviceDeleteForm"
		action="device_delete" cssClass="fillform">
		<s:hidden name="currentPage" />
		<s:hidden name="id" />
		<s:hidden name="device.id" />
		<s:hidden name="device.code" />
		<s:hidden name="device.serialNumber" />
		<s:hidden name="device.name" />
		<s:hidden name="device.deviceType" />
	</s:form>
	<s:form name="deviceListForm" id="deviceListForm" action="device_list"
		cssClass="fillform">
		<s:hidden name="currentPage" />
	</s:form>
	<s:form name="deviceResetForm" id="deviceResetForm"
		action="device_reset" cssClass="fillform">
		<s:hidden name="id" />
		<s:hidden name="currentPage" />
		<s:hidden name="command" />
		<s:hidden name="device.id" />
		<s:hidden name="device.code" />
		<s:hidden name="device.serialNumber" />
		<s:hidden name="device.name" />
		<s:hidden name="device.deviceType" />
		<s:hidden name="device.enabled" />
		<s:hidden name="hold" value="1" />
	</s:form>
	<s:if test='pendingMTNTExists==true'>
		<s:hidden name="device.agent.profileId" id="agentID" />
		<script>
		var actionFrom = "device";
		function submitForm(){			
			document.deviceResetForm.submit();
		}
	</script>
		<s:include
			value="../switch/general/procurementProductTransferPopup.jsp"></s:include>
	</s:if>
	<script>
function redirectList(){
	document.deviceListForm.submit();
}
function onUpdate(){
	
	document.deviceUpdateForm.submit();
}

function onDelete(){
	var val = confirm('<s:text name="confirm.delete"/>');
	if(val)
		document.deviceDeleteForm.submit();
}

function onCancel(){	
		document.deviceListForm.submit();
}
function onReset(){
	var val = confirm('<s:text name="confirm.unmapAgent"/>');
	if(val)
	document.deviceResetForm.submit();
}
var modal = (function(){
	var 
	method = {},
	$overlay,
	$modal,
	$content,
	$close;

	// Center the modal in the viewport
	method.center = function () {
		var top, left;

		top = Math.max($(window).height() - $modal.outerHeight(), 0) / 2;
		left = Math.max($(window).width() - $modal.outerWidth(), 0) / 2;

		/*$modal.css({
			top:top + $(window).scrollTop(), 
			left:left + $(window).scrollLeft()
		});*/
		$modal.css({top:'50%',left:'50%',margin:'-'+($modal.height() / 2)+'px 0 0 -'+($modal.width() / 2)+'px'});
	};

	// Open the modal
	method.open = function (settings) {
		$content.empty().append(settings.content);

		$modal.css({
			width: settings.width || 'auto', 
			height: settings.height || 'auto'
		});

		method.center();
		$(window).bind('resize.modal', method.center);
		$modal.show();
		$overlay.show();
	};

	// Close the modal
	method.close = function () {
		$modal.hide();
		$overlay.hide();
		$content.empty();
		$(window).unbind('resize.modal');
	};

	// Generate the HTML and add it to the document
	$overlay = $('<div id="overlay"></div>');
	$modal = $('<div id="modal"></div>');
	$content = $('<div id="content"></div>');
	$close = $('<a id="close" href="#">close</a>');
	$btn = $('<button id="clk" type="button" onclick="redirectList();">OK</button>');

	$modal.hide();
	$overlay.hide();
	$modal.append($content, $close, $btn);

	$(document).ready(function(){
		$('body').append($overlay, $modal);						
	});

	$close.click(function(e){
		e.preventDefault();
		method.close();
	});

	return method;
}());

</script>
</body>