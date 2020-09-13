<%@ include file="/jsp/common/grid-assets.jsp"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<head>
<META name="decorator" content="swithlayout">

</head>


<script type="text/javascript">

$.fn.regexMask = function(mask) {
    $(this).keypress(function (event) {
        if (!event.charCode) return true;
        var part1 = this.value.substring(0, this.selectionStart);
        var part2 = this.value.substring(this.selectionEnd, this.value.length);
        if (!mask.test(part1 + String.fromCharCode(event.charCode) + part2))
            return false;
    });
};

$(document).ready(function(){
	//$( "#dialog-form" ).hide();
	
	loadRegisterDeviceGrid();
	loadUnRegisterDeviceGrid();
	
	latestVersion();
	
	var mask = new RegExp('^[a-zA-Z0-9\\-\\s]+$')
    $("#popName").regexMask(mask); 
    
	$( "#popUp" ).hide();
	//$( "#tabs" ).tabs();

			

	
   
   

});

function deleteUnregisteredDevice(deviceId){
	var devId=deviceId;
	if(confirm('<s:text name="confirm.delete"/>')){
	  $.post("device_deleteUnRegDevice.action",{devId:devId},
	        	function(data,status){
      	    alert('<s:text name="msg.removed"/>');
      	    location.reload();
	     });
      }
}

function openModel(serialNo,devId){
	//alert("AAAA");
	$("#popSerialNoTxt").html(serialNo);
	$("#popSerialNo").html(serialNo);
	document.getElementById("popDeviceId").value=devId;
	//enablePopup();
	$('#slide').modal({
		  show:true,
		  closeOnEscape: true
		});
}
function exportXLS(){
	 if(isDataAvailable("#detail")){
		jQuery("#detail").setGridParam ({postData: {rows : 0}});
		jQuery("#detail").jqGrid('excelExport', {url: 'device_populateXLS.action'});
	}else{
	     alert('<s:text name="export.nodata"/>');
	}
}

function saveModel(){
	var valid=true;
	var deviceId=jQuery("#popDeviceId").val();
    var deviceName = jQuery("#popName").val();
    var deviceSerialNo = jQuery("#popSerialNo").html();
    var deviceIsRegistered = '0';
    if(deviceName =="" ){
    	alert('<s:text name="empty.name"/>');
    
    	valid=false;
    	
    }else{								
    	//alert("Heerererre");			
		jQuery.post("device_updateUnReg.action",{devId:deviceId,deviceIsRegistered:deviceIsRegistered,deviceName:deviceName},function(data,status){
			cancelModel();
			$("#dialog-form").hide();
			location.reload();
		}); 
    }
}
 
function cancelModel(){
	document.getElementById("popDeviceId").innerHTML="";
	jQuery("#popName").val("");
	document.getElementById("popSerialNo").innerHTML="";
	$( "#popUp" ).hide();
}

function enablePopup(){		
	$('body').css('overflow','hidden');
	$('#popupBackground').css('width','100%');
	$('#popupBackground').css('height',getWindowHeight());
	$('#popupBackground').css('top','0');
	$('#popupBackground').css('left','0');
	$('#popupBackground').show();
	$('#popUp').css({top:'50%',left:'50%',margin:'-'+($('#popUp').height() / 2)+'px 0 0 -'+($('#popUp').width() / 2)+'px'});
	$('#popUp').show();
	//window.location.hash="#popUp";
}

function disableExtendAlert(){
	$('#pendingpopUpErrMsg').html('');
	$('#popupBackground').hide();
	$('#popUp').hide();
	$('#popupPanelContent').hide();
	$('body').css('overflow','hidden');
	
}

function getWindowHeight(){
	var height = document.documentElement.scrollHeight;
	if(height<$(document).height())
		height = $(document).height();
	return height;
}

function latestVersion() {
	
	$.post("device_populateVersion.action",{},function(data){
		var jsonData = $.parseJSON(data);
		$.each(jsonData, function(index, value) {
		if(value.name!=null&&value.name!==undefined&&value.name!=''){
			$("#version").text(value.name);
		}
	}); 
 });
}

function loadRegisterDeviceGrid(){
	$.ajax({
		url : "device_populateRegisterDeviceGridData.action",
		async : false,
		type : 'post',
		success : function(result) {

			var data = JSON.parse(result);
			$('#registerGrid').DataTable({
				"data" : data,
				"order" : [],
				"columns" : [ {
					title : "Code"
				},{
					title : "Name"
				}, {
					title : "Serial Number"
				}, {
					title : "Status"
				}, {
					title : "Mobile User"
				}, {
					title : "Version"
				}, {
					title : "Last Login"
				}, {
					title : "Action"
				} ]
			});

		}
	});
}

function redirectRegisterDeviceDetailPage(id, obj) {
	document.deviceDetailForm.id.value  =id;
    document.deviceDetailForm.submit();  
}


function loadUnRegisterDeviceGrid(){
	$.ajax({
		url : "device_populateUnRegisterDeviceGridData.action",
		async : false,
		type : 'post',
		success : function(result) {

			var data = JSON.parse(result);
			$('#unRegisterGrid').DataTable({
				"data" : data,
				"order" : [],
				"columns" : [ {
					title : '<s:text name="device.transactionDate" />'
				},{
					title : '<s:text name="device.serialNo" />'
				}, {
					title : '<s:text name="device.fieldStaff" />'
				}, {
					title : '<s:text name="Action"/>'
				}]
			});

		}
	});
}



</script>
<body>
	<div class="ferror" id="warn" class=" hide alert alert-danger">
			<s:actionerror theme="bootstrap" />
			
		</div>

				<!-- Nav tabs -->
				<ul class="nav nav-pills nav-justified" role="tablist">
					<li class="nav-item waves-effect waves-light"><a
			class="nav-link active  border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill"
			href="#register-device-tabs">
				<span class="nav-icon py-2 w-auto"> <span
					class="svg-icon svg-icon-3x"> 
						<svg xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
							height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
								fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
								d="M5,3 L6,3 C6.55228475,3 7,3.44771525 7,4 L7,20 C7,20.5522847 6.55228475,21 6,21 L5,21 C4.44771525,21 4,20.5522847 4,20 L4,4 C4,3.44771525 4.44771525,3 5,3 Z M10,3 L11,3 C11.5522847,3 12,3.44771525 12,4 L12,20 C12,20.5522847 11.5522847,21 11,21 L10,21 C9.44771525,21 9,20.5522847 9,20 L9,4 C9,3.44771525 9.44771525,3 10,3 Z"
								fill="#000000"></path>
																			<rect fill="#000000" opacity="0.3"
								transform="translate(17.825568, 11.945519) rotate(-19.000000) translate(-17.825568, -11.945519)"
								x="16.3255682" y="2.94551858" width="3" height="18" rx="1"></rect>
																		</g>
																	</svg> <!--end::Svg Icon-->
				</span>
			</span> <span
				class="nav-text font-size-lg py-2 font-weight-bold text-center">Register Device Details</span>
		</a></li>
					<li class="nav-item waves-effect waves-light"><a
			class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill"
			href="#un-register-device-tabs">
				<span class="nav-icon py-2 w-auto"> <span
					class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo3/dist/assets/media/svg/icons/Layout/Layout-4-blocks.svg-->
						<svg xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
							height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
								fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<rect fill="#000000" x="4" y="4" width="7" height="7"
								rx="1.5"></rect>
																			<path
								d="M5.5,13 L9.5,13 C10.3284271,13 11,13.6715729 11,14.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,14.5 C4,13.6715729 4.67157288,13 5.5,13 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,9.5 C20,10.3284271 19.3284271,11 18.5,11 L14.5,11 C13.6715729,11 13,10.3284271 13,9.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z M14.5,13 L18.5,13 C19.3284271,13 20,13.6715729 20,14.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,14.5 C13,13.6715729 13.6715729,13 14.5,13 Z"
								fill="#000000" opacity="0.3"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
				</span>
			</span> <span
				class="nav-text font-size-lg py-2 font-weight-bolder text-center">UnRegistered Device Details</span>
		</a></li>
					
				</ul>
				
					<!-- Tab panes -->
				<div class="tab-content p-3 text-muted">
					<div class="tab-pane active" id="register-device-tabs" role="tabpanel">
					
						<div class="hide">
		
			<sec:authorize ifAllGranted="profile.device.create">
			<button type="BUTTON" id="add" onclick="document.createform.submit()" class="btn btn-success mb-2 float-right" >Add Device <i class="ri-menu-add-line align-middle ml-2"></i></button>
			</sec:authorize>

</div>
	<div class="dropdown" align="right">
				<span class="bold">
					<s:text name="Latest Version"/>: <span id="version" />	</span>				
		</div>

	 <br>
	<br>

	<div class="row">
		<div class="col-md-12">
			<table id="registerGrid"
				class="table table-bordered dt-responsive nowrap"
				style="border-collapse: collapse; border-spacing: 0; width: 100%;"></table>
		</div>
	</div> 

					</div>
					
			<div class="tab-pane" id="un-register-device-tabs" role="tabpanel">
				<div id="popUp" class="popAlert">
					<div class="popupPanelContent" style="padding: 25px;">
						<div class="popClose" onclick="disableExtendAlert();"></div>

					</div>
				</div>
		
		
		<br>
	<br>

	<div class="row">
		<div class="col-md-12">
			<table id="unRegisterGrid"
				class="table table-bordered dt-responsive nowrap"
				style="border-collapse: collapse; border-spacing: 0; width: 100%;"></table>
		</div>
	</div>
		
				<!--  <div class="deviceResponsiveDiv table table-striped table-hover  mt-3"  id="baseDiv2">
			<table class="table table-centered datatable dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;" id="unRegDetail"></table>
			<div id="unRegPagerForDetail"></div>
		</div>  -->
			
			</div>		
					
					
					
					
				</div>
				
		<s:form id="deviceForm" name="createform" action="device_create">
			<s:hidden id="deviceType" name="deviceType" />
			<s:hidden name="command" />
		</s:form>
		<s:form name="deviceDetailForm" id="deviceDetailForm"
			action="device_detail">
			<s:hidden id="id" name="id" />
			<s:hidden id="currentPage" name="currentPage" />
			<s:hidden name="command" />
		</s:form>

		<s:form id="deleteForm" action="device_delete">
			<s:hidden name="currentPage" />
			<s:hidden id="deleteId" name="id" />
			<s:hidden name="tabIndex" value="#tab2" />
			<s:hidden name="device.id" />
			<s:hidden name="device.code" />
			<s:hidden name="device.serialNumber" />
			<s:hidden name="device.name" />
		</s:form>
		
	<div id="slide" class="modal fade bs-example-modal-center" role="dialog">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="model-close-btn" class="close"
						data-dismiss="modal">&times;</button>
					<h4>
						<s:text name="device.unreg" />
					</h4>
				</div>

				<div class="modal-body">
					<table id="unRegTable" class="table table-bordered aspect-detail">

						<s:hidden id="popDeviceId" name="device.id" />
						<s:hidden id="unreg" name="device.isRegistered" value="1" />
						<s:hidden name="device.serialNo" id="popSerialNoTxt" />


						<tr class="odd">
							<td><s:text name="device.serialNo" /><sup
								style="color: red;">*</sup></td>
							<td><div id="popSerialNo"></div></td>
						</tr>

						<tr class="odd">
							<td><s:text name="device.name" /><sup style="color: red;">*</sup></td>
							<td><s:textfield id="popName" name="device.name"
									maxlength="20" cssClass="form-control" /></td>
						</tr>

						<tr class="odd">
							<td colspan="2">
								<button type="button" Class="btnSrch btn btn-success"
									onclick="saveModel();" id="save">
									<s:text name="save" />
								</button>
								<button type="button" Class="btnClr btn btn-warning"
									onclick="cancelModel();" id="cancel" data-dismiss="modal">
									<s:text name="Cancel" />
								</button>
							</td>
						</tr>



					</table>
				</div>
			</div>
		</div>
	</div>		


</body>
</html>
	