<%@ include file="/jsp/common/form-assets.jsp"%>
<%@ include file="/jsp/common/detail-assets.jsp"%>


<head>
<!-- add this meta information to select layout  -->
<meta name="decorator" content="swithlayout">
</head>
<style>
.aspect-detail TD:nth-child(2) {
	font-weight: normal;
}
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
            fill: #B5B5C3; }
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

<script src="js/dynamicComponents.js?v=1.17"></script>

<script type="text/javascript">
var tenant='<s:property value="getCurrentTenantId()"/>';
var isGramPanchayatEnable = '<s:property value="gramPanchayatEnable"/>';
	$(document).ready(function() {
		renderDynamicFeilds();
		if('<s:property value="command"/>'=="update"){
			setDynamicFieldUpdateValues();
		}
		if('<s:property value="getCurrentTenantId()"/>' == 'pratibha' && '<s:property value="getBranchId()"/>' == 'bci' ||'<s:property value="getBranchId()"/>' == 'organic'){
		
			$(".breadcrumb").find('li:not(:first)').remove();
			ss
			
		$(".breadcrumb").append('<li><a href="samithi_list.action">/ <s:property value="%{getLocaleProperty('profile.samithi.bci')}" /></a></li>');
		}
		
		$("#groupFormationCalendar").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    showButtonPanel: true,
                    dateFormat: 'MM yy',
                    onClose: function (dateText, inst) {
                        $(this).datepicker(
                                'setDate',
                                new Date(inst.selectedYear, inst.selectedMonth,
                                        1));
                    }
                });
		
		jsonString=$('#jsonString').val();
		if(jsonString!=null && jsonString!=''){
			var jsonObj=JSON.parse(jsonString);
			var accTypeText = "";
			for(var i=0;i<jsonObj.length;i++){
				var bankInformation=jsonObj[i];
				var id=(i+1);
				
				if(tenant=='chetna'){
				 $( "#bankTable tbody" ).append( "<tr id='tr_"+id+"'>" +
						  "<td>" + bankInformation.accType + "</td>" +
				          "<td>" + bankInformation.accNo + "</td>" +
				          "<td>" + bankInformation.bankName + "</td>" +
				          "<td>" + bankInformation.branchName + "</td>" +
				          "<td>" + bankInformation.sortCode + "</td>" +
				          "<td class='hide'>" + bankInformation.accTypeCode + "</td>" +
				          //"<td>" + bankInformation.swiftCode + "</td>" +				        
				          "<td><button id='"+id+""+","+""+bankInformation.accTypeCode+""+","+""+bankInformation.bankNameCode+""+","+""+bankInformation.branchNameCode+"'class='btn  btn-sts' type='button' onclick='editBank(this);'><label>Edit</label></button>&nbsp;&nbsp;&nbsp;<button id='"+id+"' class='btn btn-sm btn-warning' type='button' onclick='deleteBank(this);'><label>Delete</label></button></td>" +
				        "</tr>" );
				}else{
					$( "#bankTable tbody" ).append( "<tr id='tr_"+id+"'>" +
							  "<td>" + bankInformation.accType + "</td>" +
					          "<td>" + bankInformation.accNo + "</td>" +
					          "<td>" + bankInformation.bankName + "</td>" +
					          "<td>" + bankInformation.branchName + "</td>" +
					          "<td>" + bankInformation.sortCode + "</td>" +
					          "<td class='hide'>" + bankInformation.accTypeCode + "</td>" +
					          //"<td>" + bankInformation.swiftCode + "</td>" +				        
					          "<td><button id='"+id+""+","+""+bankInformation.accTypeCode+"'class='btn  btn-sts' type='button' onclick='editBank(this);'><label>Edit</label></button>&nbsp;&nbsp;&nbsp;<button id='"+id+"' class='btn btn-sm btn-warning' type='button' onclick='deleteBank(this);'><label>Delete</label></button></td>" +
					        "</tr>" );
				}
			}
		 }
	
		/* function submit() {
			document.form.submit;
		} */
		
	});
	
	function getTxnType(){
		return "381";
	}
	
	  function isNumber(evt) {
	 		
	 	    evt = (evt) ? evt : window.event;
	 	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	 	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	 	        return false;
	 	    }
	 	    return true;
	 	}
	  
	  function openModal(){
			$('#hidId').val('');
		}
	   function saveBankInformation() {
		    var valid = true;
		    var hidId = $('#hidId').val();
		    var accountNo = $('#accNo').val();
		    var bankName;
		    var accType = $('#accountType').val();
		    var sortCode = $('#sortCode').val().trim();
		    var bankNameVal;
		    var branchName;
		    var branchNameVal;
		    var bankNameText;
		    var accTypeText = $('#accountType').find(":selected").text();
		    var tenant = '<s:property value="getCurrentTenantId()"/>';
		    if (tenant == "chetna") {
		        bankNameVal = $('#bankNameList').val();
		        bankName = $('#bankNameList').find(":selected").text();
		        branchNameVal = $('#branchNameList').val();
		        branchName = $('#branchNameList').find(":selected").text();
		    } else {
		        bankName = $('#bankName').val();
		        branchName = $('#branchName').val();
		    }
		    // var swiftCode= $('#swiftCode').val();
		   
		    if (accType == "-1") {
		    	$(".bankError").text('<s:text name="empty.accType"/>');
		        valid = false;
		        return false;
		    } else if (accountNo == "") {
		    	$(".bankError").text('<s:text name="empty.accNo"/>');
		        valid = false;
		    } else if (!isNumber(accountNo)) {
		        $(".bankError").text('<s:text name="valid.accNo"/>');
		        valid = false;
		    } else if (sortCode == "") {
		    	$(".bankError").text('<s:text name="empty.sortCode"/>');
		        valid = false;

		    } else if (tenant != "chetna") {
		        if (bankName == "") {
		        	$(".bankError").text('<s:text name="empty.bankName"/>');
		            valid = false;
		        } else if (!isAlphabetsWithSpace(bankName)) {
		        	$(".bankError").text('<s:text name="valid.bankName"/>');
		        	//alert('<s:text name="valid.bankName"/>');
		            valid = false;
		        } else if (branchName == "") {
		        	$(".bankError").text('<s:text name="empty.branchName"/>');
		           // alert('<s:text name="empty.branchName"/>');
		            valid = false;
		        } else if (!isAlphabetsWithSpace(branchName)) {
		        	$(".bankError").text('<s:text name="valid.branchDetails"/>');
		            //alert('<s:text name="valid.branchDetails"/>');
		            valid = false;
		        }
		    } else if (tenant == "chetna") {

		        if (bankNameVal == "-1") {
		        	$(".bankError").text('<s:text name="select.bankName"/>');
		            //alert('<s:text name="select.bankName"/>');
		            valid = false;
		        }
		        if (branchNameVal == "-1") {
		        	$(".bankError").text('<s:text name="select.branchName"/>');
		            //alert('<s:text name="select.branchName"/>');
		            valid = false;
		        }

		    }

		    if (valid) {
		        document.getElementById("model-close-btn").click();
		        if (hidId == null || hidId == '') {
		        	//var accType = $('#accountType').val();
		            var rowCount = $('#bankTable tr').length;
		            var id = rowCount + 1;
		            var idd = id + "," + accType;
		            if (tenant == "chetna") {
		                idd = id + "," + accType + "," + bankNameVal + "," +
		                    branchNameVal;
		            }
		            $( "#bankTable tbody" ).append( "<tr id='tr_"+id+"'>" +
		  			      //"<td>" + accType+"-"+accTypeText + "</td>" +  
		  			      "<td>" + accTypeText + "</td>" +
		  		          "<td>" + accountNo + "</td>" +
		  		          "<td>" + bankName + "</td>" +
		  		          "<td>" + branchName + "</td>" +
		  		          "<td>" + sortCode + "</td>" +
		  		         // "<td>" + swiftCode + "</td>" +
		  		             "<td class='hide'>" + accType + "</td>" +
		  		          "<td><button id='"+idd+"' type='button' class='btn  btn-sts' href='#' onclick='editBank(this);'><label><s:text name='edit.button'/></label></button>&nbsp;&nbsp;&nbsp;<button id='"+id+"' class='btn btn-sm btn-warning' href='#' onclick='deleteBank(this);'><label><s:text name='delete.button'/></label></button></td>" +
		  		        "</tr>" );
		        } else {
					var $tr=$('#tr_'+hidId+","+accType);
					if(tenant=="chetna"){
						 $tr=$('#tr_'+hidId+","+accType+","+bankNameVal+","+branchNameVal);
					}
				    var $td= $tr.children('td'); 
				    var accNoCell= $td.eq(1);  
					var bankNameCell= $td.eq(2);
					var branchNameCell= $td.eq(3); 
					var sortCodeCell= $td.eq(4);		
					var accTypeCell = $td.eq(0);
					var accTypeVal = $td.eq(5);
					
					accNoCell.text(accountNo);
					bankNameCell.text(bankName);
					branchNameCell.text(branchName);
					sortCodeCell.text(sortCode);
					accTypeCell.text(accTypeText);
					accTypeVal.text(accType);
					
		        }
		        refreshPopup();
		    }
		}
	   
	   function cancelBnkInfo(){
			refreshPopup();	
			document.getElementById("model-close-btn").click();
		}

	   function refreshPopup(){
			$(".bankError").empty();
			var accountNo= $('#accNo').val("");
			var sortCode= $('#sortCode').val("");
			//var swiftCode= $('#swiftCode').val("");
			var accType = $('#accountType').val(-1);
			//jQuery('#accountType').select2();
			var tenant='<s:property value="getCurrentTenantId()"/>';
			if(tenant=="chetna"){
				var bankNameVal=$('#bankNameList').val(-1);
				//jQuery('#bankNameList').select2();
				var branchNameVal=$('#branchNameList').val(-1);
				//jQuery('#branchNameList').select2();
			}else{
				var bankName= $('#bankName').val("");
				var branchName= $('#branchName').val("");
			}
		}
	   
	   function closeModal(){
			refreshPopup();	
			document.getElementById("model-close-btn").click();
		}
	   function editBank(evt){
			//alert("edit");
		   var $td= $(evt).closest('tr').children('td');
			var hiddenId = $(evt).attr('id');
			var accountNo= $td.eq(1).text(); 
			var bankName= $td.eq(2).text();
			var branchName= $td.eq(3).text();
			var sortCode= $td.eq(4).text();
			var accType = $td.eq(5).text();
			var tenant = '<s:property value="getCurrentTenantId()"/>';
			if(tenant=="chetna"){
				$('#bankNameList').val(hiddenId.split(",")[2]);
				//$('#bankNameList').select2();
				$('#branchNameList').val(hiddenId.split(",")[3]);
				//$('#branchNameList').select2();
			}else{
				$('#branchName').val(branchName);
				$('#bankName').val(bankName);
				
			}
			
			$('#accNo').val(accountNo);
			
			$('#sortCode').val(sortCode);
			//alert(hiddenId.split(",")[1]);
			$('#accountType').val(accType);
			//$('#accountType').select2();
			
			$('#hidId').val(hiddenId.split(",")[0]);
			
			document.getElementById("editBankDetailModal").click();
			
		}

		function deleteBank(evt){
			var result =confirm('<s:text name="txt.delete"/>');	
			if(result){
					var $tr= $(evt).closest('tr'); 
					$tr.remove();
					//evt.preventDefault();
				   }
				
				}
		
		/* function onSubmit(){
			
			beforeSave();
		} */
		
		function beforeSave(){
			processBank();
		}
		
		function processBank(){
			
			var jsonObj=[];
			$('#bankTable tbody tr').each(function() {
				var $td= $(this).children('td');  
			    var accountNo= $td.eq(1).text();  
				var bankName= $td.eq(2).text();
				var branchName= $td.eq(3).text(); 
				var sortCode= $td.eq(4).text(); 
				var accType = $td.eq(5).text();
				var accTypeCode =  $td.eq(5).text();
				var bankInformation = {};				
				bankInformation["accNo"] = accountNo;
				bankInformation["bankName"] = bankName;
				bankInformation["branchName"] = branchName;
				bankInformation["sortCode"] = sortCode;
				bankInformation["accType"] = accType;
				bankInformation["accTypeCode"] = accTypeCode;
			    jsonObj.push(bankInformation);
			 });
			$('#jsonString').val(JSON.stringify(jsonObj));
		}
	
	function listMunicipality(obj) {
		var selectedLocality = $('#localities').val();
		jQuery.post("samithi_populateCity.action", {
			id : obj.value,
			dt : new Date(),
			selectedLocality : obj.value
		}, function(result) {
			insertOptions("city", $.parseJSON(result));
			listPanchayat(document.getElementById("city"));
		});
	}

	function listPanchayat(obj) {
		try {
			var selectedCity = $('#city').val();

			jQuery.post("samithi_populatePanchayath.action", {
				id : obj.value,
				dt : new Date(),
				selectedCity : obj.value
			}, function(result) {
				insertOptions("panchayath", $.parseJSON(result));
				listVillage(document.getElementById("panchayath"));
			});
		} catch (e) {
		}
	}

	function listVillage(obj) {
		var selectedPanchayat = $('#panchayath').val();
		jQuery.post("samithi_populateVillage.action", {
			id : obj.value,
			dt : new Date(),
			selectedPanchayat : obj.value
		}, function(result) {
			insertOptions("village", $.parseJSON(result));
			//listSamithi(document.getElementById("village"));
		});
	}

	function listVillageByCity(obj) {
		var selectedCity = $('#city').val();
		jQuery.post("samithi_populateVillageByCity.action", {
			id : obj.value,
			dt : new Date(),
			selectedCity : obj.value
		}, function(result) {
			insertOptions("village", $.parseJSON(result));
			//listSamithi(document.getElementById("village"));
		});
	}

	function validate() {
		var currentTenant = '<s:property value="getCurrentTenantId()"/>';
		var isGramPanchayatEnable = '<s:property value="gramPanchayatEnable"/>';
		/* beforeSave();
		if(currentTenant=='kenyafpo'){
			var country=$("#country").val();
			var state=$("#state").val();
			var locality=$("#localities").val();
			var city=$("#city").val();
			var panchayat=$("#panchayath").val();
			var village=$("#village").val();
			var email=$("#email").val();
		    if (isEmpty(country)) {
		    	 $("#errorDiv").removeClass('hide');
		    	jQuery(".ferror").text("<s:property value="%{getLocaleProperty('empty.country')}" />");
		          return false;
		      }else if (isEmpty(state)) {
		    	  
		          jQuery(".ferror").text("<s:property value="%{getLocaleProperty('empty.state')}" />");
		          return false;
		      }else if (isEmpty(locality)) {
		          jQuery(".ferror").text("<s:property value="%{getLocaleProperty('empty.locality')}" />");
		          return false;
		      } else if (isEmpty(city)) {
		          jQuery(".ferror").text("<s:property value="%{getLocaleProperty('empty.city')}" />");
		          return false;
		      } else if(isGramPanchayatEnable=='1'){
					if (isEmpty(panchayat)) {
					      jQuery(".ferror").text("<s:property value="%{getLocaleProperty('empty.gramPanchayat')}"/>");
					          return false;
					      }
				}else if (isEmpty(village)) {
		         jQuery(".ferror").text("<s:property value="%{getLocaleProperty('empty.village')}"/>");
		         return false;
		     }
		    
		    if(!isEmpty(email)){
		    	validateEmail(email)
		    }
		}
		 */
		if(currentTenant=='symrise' && $("#groupFormationCalendar").is(":visible") && $('#groupFormationCalendar').val()==''){
			alert("Please Choose Group Formation Date")
		}else
		if(addDynamicField()){
			document.form.submit();
			//successBox();
		}
		
	}
	function successBox(){
		 Swal.fire({
             title: "Success!",
             text: "Samithi added Successfully!",
             icon: "success",
             showCancelButton: !0,
             confirmButtonColor: "#5438dc",
             cancelButtonColor: "#ff3d60"
         })
	}
	function listState(obj, countryId, stateId, disId, cityId,gpId, vId) {

		if (!isEmpty(obj)) {
			var selectedCountry = $('#' + countryId).val();
			jQuery.post("farmer_populateState.action", {
				selectedCountry : obj.value
			}, function(result) {
				insertOptions(stateId, $.parseJSON(result));
				listLocality(document.getElementById(stateId), stateId, disId,
						cityId,gpId,vId);
			});
			$('#' + disId).select2();
		}
	}
	function listLocality(obj, stateId, disId, cityId,gpId, vId) {
//alert("AAA");
		if (!isEmpty(obj)) {
			var selectedState = $('#' + stateId).val();
			jQuery.post("farmer_populateLocality.action", {
				id1 : obj.value,
				dt : new Date(),
				selectedState : obj.value
			}, function(result) {
					insertOptions(disId, $.parseJSON(result));
				listMunicipality(document.getElementById(disId),disId, cityId,gpId, vId);
			});
			$('#' + cityId).select2();
		}
	}

	function listMunicipality(obj, disId, cityId, gpId, vId) {
		if(isGramPanchayatEnable==1){
			if (!isEmpty(obj)) {
				var selectedLocality = $('#' + disId).val();
				jQuery.post("farmer_populateCity.action", {
					id1 : obj.value,
					dt : new Date(),
					selectedLocality : obj.value
				}, function(result) {
					insertOptions(cityId, $.parseJSON(result));
					listPanchayat(document.getElementById(cityId),cityId,gpId,vId);
				});
				
				$('#' + gpId).select2();
			}
			
		}else{
			if (!isEmpty(obj)) {
				var selectedLocality = $('#' + disId).val();
				jQuery.post("farmer_populateCity.action", {
					id1 : obj.value,
					dt : new Date(),
					selectedLocality : obj.value
				}, function(result) {
					insertOptions(cityId, $.parseJSON(result));
					listVillageByCity(document.getElementById(cityId),cityId,vId);
				});
				$('#' + vId).select2();
			}
		}
		
	}

	function listPanchayat(obj, cityId, gpId, vId) {
		if (isGramPanchayatEnable != '1') {
			listVillage(document.getElementById(cityId), cityId, gpId,
					vId);
			return true
		}

		if (!isEmpty(obj)) {
			try {
				var selectedCity = $('#' + cityId).val();

				jQuery.post("farmer_populatePanchayath.action", {
					id : obj.value,
					dt : new Date(),
					selectedCity : obj.value
				}, function(result) {
					insertOptions(gpId, $.parseJSON(result));
					listVillage(document.getElementById(gpId), cityId, gpId,vId);
				});
			} catch (e) {
			}
			$('#' + vId).select2();
		}
	}

	function listVillage(obj,cityId,gpId, vId) {
		if (!isEmpty(obj)) {
			if (isGramPanchayatEnable == '1') {
				var selectedPanchayat = $('#' + gpId).val();
				var enableGramPanch = document
						.getElementById("gramPanchayatEnable").value;
				jQuery.post("farmer_populateVillage.action", {
					id1 : obj.value,
					dt : new Date(),
					selectedPanchayat : obj.value,
					gramPanchayatEnable : enableGramPanch
				}, function(result) {
						insertOptions(vId, $.parseJSON(result));
					
				});
			}else {
				listVillageByCity(document.getElementById(cityId), cityId,
						vId);
			}
		}
	}



	function listVillageByCity(obj, cityId,vId) {
		if (!isEmpty(obj)) {
			var selectedCity = $('#' + cityId).val();
			jQuery.post("farmer_populateVillageByCity.action", {
				id : obj.value,
				dt : new Date(),
				selectedCity : obj.value
			}, function(result) {
					insertOptions(vId, $.parseJSON(result));
					//listFarmer(document.getElementById(vId));
				// listSamithi(document.getElementById("village"));
			});
			
			$('#' + vId).select2();
		}
		
		
	}
	
	function insertOptions(ctrlName, jsonArr) {
		document.getElementById(ctrlName).length = 0;
		addOption(document.getElementById(ctrlName), "Select", "");
		for (var i = 0; i < jsonArr.length; i++) {
			addOption(document.getElementById(ctrlName), jsonArr[i].name,
					jsonArr[i].id);
		}
	}

	function addOption(selectbox, text, value) {
		var optn = document.createElement("OPTION");
		optn.text = text;
		optn.value = value;
		selectbox.options.add(optn);
	}
	
	function validateEmail(emailField){
        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

        if (reg.test(emailField.value) == false) 
        {
          //  alert('');
            jQuery(".ferror").text("<s:property value="%{getLocaleProperty('Invalid Email Address')}" />");
            return false;
        }

        return true;

}
</script>

<body>
	<s:form name="form" cssClass="fillform" action="samithi_%{command}">
		<s:hidden key="currentPage" />
		<s:hidden key="id" />
		<s:hidden id="samithiId" key="warehouse.id" class="uId"/>
		
		<s:hidden id="dynamicFieldsArray" name="dynamicFieldsArray" />
		<s:hidden id="dynamicListArray" name="dynamicListArray" />
		<s:hidden id="txnTypez" name="txnTypez" />		
		
		<s:hidden id="errorId" key="errorMsg" />
		<s:hidden id="agentMapExitsId" key="agentMappingExist" />
		<s:hidden id="farmerMapExitsId" key="farmerMappingExist" />
		<s:hidden id="existingVillagesId" key="selectedVillageCodes" />
		<s:hidden id="existingCitysId" key="selectedCityids" />
		<s:hidden key="command" />
			<s:hidden id="jsonString" name="warehouse.jsonString" />

 <div id="errorDiv" >
				
					<s:actionerror theme="bootstrap" />
					<s:fielderror theme="bootstrap" />
				</div> 
				
				
				
		<div id="accordion" class="custom-accordion " >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#groupInfo" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseOne">
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
																	
																<h3 class="wizard-title"><s:property value="%{getLocaleProperty('info.samithi')}" /></h3>
																<div class="wizard-desc">Setup Samithi/Group Basic Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="groupInfo" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
				<div class="card-body">

				<div class="row">
                               <s:if test='"update".equalsIgnoreCase(command)'>
                                                <div class="col-md-4">
                                                   <div class="form-group code">
						<label for="txt"> <s:text name="samithi.code" /><sup
								style="color: red;">*</sup>
						</label>
						<div class="form-control">
							<s:property value="warehouse.code" />
								<s:hidden key="warehouse.code" />
						</div>
					</div>
                                                </div></s:if>
                                                <div class="col-md-4">
                                                   	<div class="form-group name">
						<label for="txt"> <s:property
								value="%{getLocaleProperty('samithi.name')}" /><sup
							style="color: red;">*</sup>
						</label>
						<div class="">
						<s:textfield id="samithiName" name="warehouse.name" maxlength="45" cssClass="form-control" />
						</div>
					</div>
                                                </div>
                                                
                                                
                                       <div class="col-md-4">
                                                   	<div class="form-group dateOfFormation">
						<label for="txt"> <s:property
									value="%{getLocaleProperty('dateOfFormation')}" />
						</label>
						<div class="">
							<s:textfield data-date-format="dd/mm/yyyy"
									data-date-viewmode="years"
									cssClass="date-picker form-control" id="fromCalendar"
									name="formationDate" size="23" readonly="true" />
						</div>
					</div>
                                                </div>               
                                                
                                                
                   			 </div>	

				

</div></div></div>			
				
	


	<div class="dynamicFieldsRender"></div>
	

		<div class="button-items float-right">
			<s:if test="command =='create'">
		<button type="submit" id="buttonAdd1" onclick="validate()" class="btn btn-success waves-effect waves-light">
               <i class="ri-check-line align-middle mr-2"></i> Save
                   </button>		
			</s:if>
			<s:else>
				 <button type="submit" id="buttonUpdate" onClick="validate()" class="btn btn-primary waves-effect waves-light">
                                                <i class="ri-error-warning-line align-middle mr-2"></i> Update
                                            </button>
			</s:else>
			 <button type="button" id="cancel" onclick="onCancel();" class="btn btn-danger waves-effect waves-light">
                                                <i class="ri-close-line align-middle mr-2"></i> Cancel
                                            </button>
		</div>

		<s:hidden id="municipalityIds" name="municipalityIds"></s:hidden>
	</s:form>
	<s:form name="cancelform" action="samithi_list.action">
		<s:hidden key="currentPage" />
	</s:form>

</body>