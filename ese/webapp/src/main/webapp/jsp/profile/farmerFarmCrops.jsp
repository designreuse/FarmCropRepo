<%@ include file="/jsp/common/detail-assets.jsp"%>
<script src="plugins/select2/select2.min.js"></script>
<script src="js/dynamicComponents.js?v=20.22"></script>
<link rel="stylesheet" href="plugins/select2/select2.min.css">
<head>
<style>
.prefixBox{
width: 45% !important;
    margin-right: 1% !important;
    position: absolute;
}
.suffixBox{
width: 35% !important;
    position: absolute;
    margin-left: 165px;
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
</head>
<meta name="decorator" content="swithlayout">

<body>
	<s:form name="form" cssClass="fillform" action="farmCrops_%{command}">
		<s:hidden key="currentPage" />
		<s:hidden key="id" />
		<s:hidden name="farmerId" value="%{farmerId}" />
		<s:hidden name="farmfarmerName" value="%{farmfarmerName}" />
		<s:hidden name="farmerfarmName" value="%{farmerfarmName}" />
<s:hidden name="branch" value="%{branch}" />
		<s:hidden name="farmId" value="%{farmId}" />
		<s:hidden name="farmCrops.farm.id" value="%{farmId}" />
		<s:hidden name="tabIndexz" value="%{tabIndexz}" />
		<s:hidden name="tabIndex" />
		<s:hidden id="farmerDynamicDatas" name="farmerDynamicDatas" />
		<s:hidden id="farmerDynamicValIds" name="farmerDynamicValIds" />
		<s:hidden id="dynamicFieldsArray" name="dynamicFieldsArray" />
		<s:hidden id="dynamicListArray" name="dynamicListArray" />	
		<s:if test='"update".equalsIgnoreCase(command)'>
			<s:hidden key="farmCrops.id" class="uId" />
		</s:if>
		<s:hidden key="command" />
 <div class="ferror" id="errorDiv" class=" hide alert alert-danger" >
					<s:actionerror theme="bootstrap" />
					<s:fielderror theme="bootstrap" />
			</div>
			
	<div id="accordion" class="custom-accordion farmerCrop_Info" >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#farmerCrop_Info" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseOne">
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
																	
																<h3 class="wizard-title"><s:property value="%{getLocaleProperty('info.farmCrops')}" /></h3>
																<div class="wizard-desc">Setup Farmer Crop Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="farmerCrop_Info" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
				<div class="card-body">

				<div class="row">
                               
                                                <div class="col-md-4">
                                                   <div class="form-group farmName">
						<label for="txt"> <s:property value="%{getLocaleProperty('farm.name')}" /> <sup
							style="color: red;">*</sup>
						</label>
						
						<s:if test='"update".equalsIgnoreCase(command)'>
							<div class="">
							<p class="form-control">	<s:property value="farmerfarmName" /></p>
							</div>
						</s:if>
						<s:else>
							<div class="">
								<s:select list="farmList" name="selectedFarm"
									cssClass="form-control" />
							</div>
						</s:else>
						
					</div>
                                                </div>
                                                <div class="col-md-4">
                                                   	<div class="form-group cropCategory">
						<label for="txt"> <s:text
								name="farmcrops.cropCategory.prop" />
						</label>
						<div class="">
						<s:radio name="farmCrops.cropCategory"
								onchange="cropDiv(this,'onchange');"
								value="defaultCropCategoryValue" list="cropCategories"
								id="cropCat" />
						</div>
					</div>
                                                </div>
                                                
                                                
                                       <div class="col-md-4">
                                                   	<div class="form-group cropSeason">
						<label for="txt"> <s:property
									value="%{getLocaleProperty('farmcrops.cropSeason')}" />
									
									<sup style="color: red;">*</sup>
							</label>
						<div class="">
							 <s:select cssClass="form-control select2" id="cropSeasonValue"
									name="cropSeasonCode" headerKey="-1" listKey="key"
									listValue="value" headerValue="%{getText('txt.select')}"
									list="harvestseasonsLang" /> 
						</div>
					</div>
                                                </div>               
                                                
                                                
                   			 </div>	

				<div class="row">
				 <div class="col-md-4">
                       <div class="form-group cultivationType">
						<label for="txt"> <s:property
										value="%{getLocaleProperty('farmCrops.CultivationType')}" /><sup
									style="color: red;"></sup>
								</label>
						<div class="">
							<s:select name="selectedCropCategoryList"
										list="cropCategoryList" listKey="key" listValue="value"
										headerKey="" headerValue="%{getText('txt.select')}"
									id="cropCategory"
										cssClass="form-control select2" />
						</div>
					</div>
            </div>
				 <div class="col-md-4">
                       <div class="form-group farmcropName">
							<label for="txt"> <s:property
									value="%{getLocaleProperty('farmcropName')}" /> <sup
								style="color: red;">*</sup>
							</label>
						<div class="">
						<s:select cssClass="form-control" id="farmCropsMasters"
									name="selectedCrop" headerKey=""
									headerValue="%{getText('txt.select')}" listKey="key"
									listValue="value" list="listProcurementProductLang"
									onchange="listVariety(this)" />
						</div>
					</div>
            </div>
				 <div class="col-md-4">
                       <div class="form-group variety">
						<label for="txt"> <s:property
								value="%{getLocaleProperty('variety')}" /> <sup
							style="color: red;">*</sup>
						</label>
						<div class="">
							<s:select cssClass="form-control" id="farmVarietyMaster"
								name="selectedVariety" headerKey="-1"
								headerValue="%{getText('txt.select')}" listKey="key"
								listValue="value" list="listProcurementVarietyMap" />
						</div>
					</div>
            </div>
				</div>
				<s:if test="cropInfoEnabled==1">
<div class="row">
				 <div class="col-md-4">
                       <div class="form-group cultiArea">
						<label for="txt"> <s:property
										value="%{getLocaleProperty('cultiArea')}" />
										
									 
										(<s:property value="%{getAreaType()}" />)
										
										<sup style="color: red;">*</sup>
								</label>
						<div class="">
							<s:textfield id="cultiArea" name="farmCrops.cultiArea"
									cssClass="form-control input-sm"	maxlength="35" onkeyup="calculateActualSeedCotton();">
									</s:textfield>
						</div>
					</div>
            </div>
				 <div class="col-md-4" id="sowingDate">
                       <div class="form-group sowingDate">
							<label for="txt"> <s:property
									value="%{getLocaleProperty('farmcrops.sowingDate')}" />
								(MM/DD/YYYY)
								
								<sup style="color: red;">*</sup>
							</label>
						<div class="">
						<s:textfield cssClass="form-control input-sm" name="sowingDate"
									id="calendarSowingDate"  listValue="value" onchange="getDate(this.value);" />
						</div>
					</div>
            </div>
				 <div class="col-md-4" id="typetr">
                       <div class="form-group type">
						<label for="txt"> <s:property
									value="%{getLocaleProperty('type')}" />
							</label>
						<div class="">
							<div class="form-element">
								<s:select cssClass="form-control select2" id="type"
									name="farmCrops.type" headerKey="-1"
									headerValue="%{getText('txt.select')}"
									onchange="showOther(this.value)" listKey="key"
									listValue="value" list="listType" />
							</div>
						</div>
					</div>
            </div>
				</div>
				
	<div class="row">
				 <div class="col-md-4">
                       <div class="form-group estimatedYeild">
						<label for="txt"><s:property value="%{getLocaleProperty('farmfarmcrops.estimatedYeild')}" /> 
								</label>
						<div class="">
							<s:textfield id="estYldPfx" name="farmCrops.estYldPfx"
										onkeypress="return isNumber(event)"
										onkeyup="convertKgToMetric()" maxlength="7"
										cssClass="prefixBox form-control" cssStyle="width: 45% !important;margin-right: 1% !important;position: absolute;"  />

									<s:textfield id="estYldSfx" name="farmCrops.estYldSfx"
										onkeypress="return isNumber(event)"
										onkeyup="convertKgToMetric()" theme="simple" maxlength="3"
										cssClass="suffixBox form-control" cssStyle="width: 35% !important;position: absolute;margin-left: 165px;" />
						</div>
					</div>
            </div>
				 <div class="col-md-4" id="sowingDate">
                       <div class="form-group sowingDate">
							<label for="txt"><s:property value="%{getLocaleProperty('farmfarmcrops.estimatedYeild.tonnes')}" />
							</label>
						<div class="">
					
						<s:label id="plantTonnesValues" cssClass="form-control" />
						</div>
					</div>
            </div>
				
				</div>			
				
				
				</s:if>
</div></div></div>			
			
			
	</s:form>

	<s:form name="cancelform" action="farmer_detail.action%{tabIndexz}">
		<s:hidden name="farmerId" />
		<s:hidden name="farmId" />
		<s:hidden name="id" value="%{farmerId}" />
		<s:hidden name="tabIndexz" value="%{tabIndexz}" />
		<s:hidden name="tabIndex" value="%{tabIndexz}" />
		<s:hidden key="currentPage" />
	</s:form>

	<s:form name="listForm" id="listForm" action="farmer_detail.action">
		<s:hidden name="farmerId" />
		<s:hidden name="id" value="%{farmerId}" />
		<s:hidden name="tabIndexFarmer" />
		<s:hidden name="tabIndex" value="#tabs-2" />
		<s:hidden name="currentPage" />
	</s:form>
	<script type="text/javascript">
	var tenant='<s:property value="getCurrentTenantId()"/>';
	function onCancel(){
		document.cancelform.submit();
	}
	function submitCreate(){
		if(addDynamicField()){
		//document.form.submit();
			}
	}
	function onFarmList(){
		document.listForm.submit();
	}
	function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
	
	function calculateLintCotton(){
		var getValue=$("#seedCott").val();
		
		if(getValue==""){
    		$(".lintCottonValues").empty();
    	}
    	else{
    		var lintCott = $("#seedCott").val()/3;
        	//document.getElementById('lintCottonValues').innerHTML=lintCott.toFixed(2);
        	jQuery(".lintCottonValues").text(lintCott.toFixed(2));
        	jQuery(".lintCottonValues").val(lintCott.toFixed(2));
    	}
	}
	function calculateActualSeedCotton(){
		
		var getValue1=$("#seedCott").val();
		
		var getValue2=$("#cultiArea").val();
		
		if(getValue1!="" && getValue2!=""){
var actualSeedCotton = $("#seedCott").val()/$("#cultiArea").val();
			
			jQuery(".actualSeed").text(actualSeedCotton.toFixed(2));
        	jQuery(".actualSeed").val(actualSeedCotton.toFixed(2));
			
		}else{
			$(".actualSeed").empty();
			//document.getElementById('actualSeed').innerHTML=actualSeedCotton.toFixed(2);
		}
		
	}
	
	/* function hideOtherSeedTreatment(){
		if($("#seedTreatmentDetails")!=-1){
			$("#seedTreatment").hide();
		}
	} */
	
	function processSeedTreatmentDetails(val)
	{
		
		if (val == 99) {
			jQuery(".seedTreatmentDetailsOther").show();
			jQuery("#seedTreatmentId").val('<s:property value="farmCrops.otherSeedTreatmentDetails" />');
		} else {
			jQuery("#seedTreatmentId").val("");
			jQuery(".seedTreatmentDetailsOther").hide();
		}	
	}
	
	function cropDiv(evt,status){
		// var rst =jQuery("#riskHidden").val();
		var val=$(evt).val();
		console.log(evt);
		if(tenant=='pratibha'){
			if(val==0 || val==3 || val==4){
				jQuery("#stableLnt").show();
				jQuery("#stableLnt1").show();
				jQuery("#cropSeason").show();
				jQuery("#typetr").show();
				jQuery("#riskAssesment").show();
				var riskAssementVal='<s:property value="farmCrops.riskAssesment"/>';
				if(riskAssementVal==1){
					jQuery("#captureAssessment").show();
					}
					else{
						jQuery("#captureAssessment").hide();
					}
				if(status == "onchange")
					jQuery("#seedSourceMaster").val("-1");
				
				jQuery("#seedTreatmentDetailsId").show();
				jQuery("#sowingDate").show();
			}
			else{
				if(status == "onchange")
					  jQuery("#seedSourceMaster").val("-1");
				if(tenant!="iccoa"){
					jQuery("#stableLnt").hide();
					jQuery("#stableLnt1").hide();
				}
				jQuery("#cropSeason").hide();		
				jQuery("#typetr").hide();
				jQuery("#seedTreatmentDetails").val("-1");
				jQuery("#riskAssesment").hide();
				jQuery("#captureAssessment").hide();
				jQuery("#bufferZoneId").val("");
				if(tenant!="iccoa")
					jQuery("#stapleLengthValue").val("");
				jQuery("#seedTreatment").hide();
				jQuery("#seedTreatmentDetails").hide();
				jQuery("#seedTreatmentDetailsId").hide();
				if(tenant=="welspun")
				jQuery("#sowingDate").hide();
			}
		}else if(tenant=='livelihood'){
			if(val==1){
				$('.livelihoodInter').removeClass('hide');
				$('.livelihoodMain').addClass('hide');
			}
			else {
				//$('.livelihoodInter').addClass('hide');
				$('.livelihoodMain').removeClass('hide');
			}
		
		}else if(tenant=='griffith'){
				//$('.livelihoodInter').addClass('hide');
				//$('.livelihoodMain').addClass('hide');
			
		}
		else{
		 if(val==0){
			//alert("if");
			
				jQuery("#stableLnt").show();
				jQuery("#stableLnt1").show();
			
			
			jQuery("#cropSeason").show();
			jQuery("#typetr").show();
			jQuery("#riskAssesment").show();
			var riskAssementVal='<s:property value="farmCrops.riskAssesment"/>';
			if(riskAssementVal==1){
				//jQuery("#risskAssmnt").show();
				jQuery("#captureAssessment").show();
				}
				else{
					jQuery("#captureAssessment").hide();
				}
			if(status == "onchange")
				jQuery("#seedSourceMaster").val("-1");
			
			//jQuery("#seedTreatmentDetails").show();
			jQuery("#seedTreatmentDetailsId").show();
			jQuery("#sowingDate").show();
			/* jQuery("#seedCotton").show();
			jQuery("#lintCotton").show();
			jQuery("#actualSeedYield").show();
			jQuery("#estimatedYield").show();
			jQuery("#estimatedCotton").show();
			jQuery("#interType").hide();
			jQuery("#interAcre").hide();
			jQuery("#totalCropHarv").hide();
			jQuery("#grossIncome").hide(); */
			
			
		}
		else{
			//alert("else");
			if(status == "onchange")
				  jQuery("#seedSourceMaster").val("-1");
			if(tenant!="iccoa"){
				jQuery("#stableLnt").hide();
				jQuery("#stableLnt1").hide();
			}
			
			
			jQuery("#cropSeason").hide();		
			jQuery("#typetr").hide();
			jQuery("#seedTreatmentDetails").val("-1");
			//jQuery("#seedTreatmentId").val("");
			jQuery("#riskAssesment").hide();
			jQuery("#captureAssessment").hide();
			jQuery("#bufferZoneId").val("");
			//jQuery("#cropSeasonValue").val("-1");
			//jQuery("#type").val("-1");
			if(tenant!="iccoa")
				jQuery("#stapleLengthValue").val("");
			jQuery("#seedTreatment").hide();
			jQuery("#seedTreatmentDetails").hide();
			jQuery("#seedTreatmentDetailsId").hide();
			if(tenant=="welspun")
			jQuery("#sowingDate").hide();
			/* jQuery("#seedCotton").hide();
			jQuery("#lintCotton").hide();
			jQuery("#actualSeedYield").hide();
			jQuery("#estimatedYield").hide();
			jQuery("#estimatedCotton").hide();
			jQuery("#interType").show();
			jQuery("#interAcre").show();
			jQuery("#totalCropHarv").show();
			jQuery("#grossIncome").show(); */
		}
		}

	} 
	
	 function riskDiv(evt){
		 //var v=document.getElementById("risskAssmnt").value();
		
		var value=$(evt).val();
		$("#riskHidden").val(value);
		if(value==1){
			jQuery("#captureAssessment").show();
			jQuery("#riskAssesment").show();
		    jQuery("#bufferZoneId").show();
		}
		else{
			jQuery("#captureAssessment").hide();
			jQuery("#bufferZoneId").val("");
			
		}
	} 
	
	
	jQuery(document).ready(function(){
		var cropCategory='<s:property value="farmCrops.cropCategory"/>';
		
		 var command='<s:property value="command"/>';
		var  url = window.location.href;
	
		renderDynamicFeilds();
		$(".farmerDynamicField").removeClass("hide");
		 if('<s:property value="command"/>'=="update"){
				setDynamicFieldUpdateValues();
			}
		// alert(url.indexOf('farmerId='));
		 if(url.indexOf('farmerId=') < 0){ 
			 
		 
	      if(command.toLowerCase()=="update"){
	    	//  alert("1");
	    	   url = url+'?id='+'<s:property value="farmCrops.id"/>'+'&farmId='+'<s:property value="farmCrops.farm.id"/>'+'&farmerId='+'<s:property value="farmCrops.farm.farmer.framerId"/>'+'&tabIndexz='+'#tabs-4';
	  	 }else{
	  	//	alert("2");
	  	 
	  	   url = url+'?farmId='+'<s:property value="farmId"/>'+'&farmerId='+'<s:property value="farmerId"/>'+'&tabIndexz='+'#tabs-4';
	     }
		
	  
	    
	     $( ".lanMenu" ).each(function() {
	    	 var url1 = $(this).attr("href") +'&url='+ encodeURIComponent(url);
	    	  $( this ).attr( "href",url1);
	    	});
	     

	     var stag = $('a[href="farm_detail.action?id=&#tabs-3"]');
		 $(stag).attr("href", "javascript:onCancel();");
		 
		 var stag = $('a[href="farmer_detail.action"]');
		 $(stag).attr("href", "javascript:onFarmList();");
	}
	
		$('.select2').select2();
		jQuery(".typeOtherDiv").hide(); 	
		convertKgToMetric();
		
		showOther($('#type').val());
		
		var command ='<s:property value="command"/>';
		var cropPlugin = '<s:property value="cropInfoEnabled"/>';
		if(command=="create")
			 {
			
			 jQuery(".seedTreatmentDetailsOther").hide();
			 }
		 
		 else if(command=="update")
	    	{
	    	var idp=$('#seedTreatmentDetails').val();
	    	processSeedTreatmentDetails(idp);
	    	}
		 
		 
		$("#sucessbtn").prop('disabled', false);
		$('#button').on('click',function(e){
			var tenant='<s:property value="getCurrentTenantId()"/>';
			var cropPlugin = '<s:property value="cropInfoEnabled"/>';
			//alert("af");
			/* $("#sucessbtn").prop('disabled', true); */
			 if(tenant!='kpf'  && tenant!='simfed' && tenant!='wub' && tenant!='gar' && tenant!='wilmar' && tenant!='iccoa'&& tenant!='crsdemo'&& tenant!='agro' && tenant!='welspun' && tenant!='pratibha'){
			if($("#seedQtyCostPfx").val()==""){
				$("#seedQtyCostPfx").val('0');
			}
			if($("#seedQtyCostSfx").val()==""){
				$("#seedQtyCostSfx").val('0');
			}
			
			if($("#seedQtyUsedSfx").val()==""){
				$("#seedQtyUsedSfx").val('0');
			}
			 }
			
					 if(tenant=='kpf' || tenant=='simfed'|| tenant=='wub'){
						 if($("#estYldPfx").val()==""){
								$("#estYldPfx").val('0');
							}
								
							if($("#estYldSfx").val()==""){
								$("#estYldSfx").val('0');
							} 
					 }
				if(cropPlugin=="1"){
					if(tenant!='welspun' && tenant!='pratibha'){
						if($("#estYldPfx").val()==""){
							$("#estYldPfx").val('0');
						}
							
						if($("#estYldSfx").val()==""){
							$("#estYldSfx").val('0');
						} 
							
					}
				}
			 
				if(addDynamicField()){
			document.form.submit();
				}
			});
		
		var riskAssementVal='<s:property value="farmCrops.riskAssesment"/>';
		$('#seedTreatment').hide();
		//$('#seedTreatmentId').val("");
		//if(riskAssementVal==1&&croVal==0){
			if(riskAssementVal==1){
			$('#captureAssessment').show();
		}
			else{
				$('#captureAssessment').hide();
			}
		var otherSeedTrtDetail='<s:property value="farmCrops.otherSeedTreatmentDetails"/>';
	
		var cropCat = $('input:radio[name="farmCrops.cropCategory"]:checked');
		cropDiv(cropCat,"onload");
		if(tenant!='griffith'){
		var type='<s:property value="farmCrops.cropCategory"/>';
		if(type=='0'){
			$('#typetr').show();
		}else if(type=='1'){
			$('#typetr').hide();
		}
		}
		else{
			$('#typetr').show();
		}
		
		
		
		convertKgToMetric();
		
	});
	function getTxnType(){
		return "357";
	}
	
	 function getBranchIdDyn(){
	     	return '<s:property value="branch"/>';
	    	}
	 

	
	/* function addSeedTreatmentDetails(){
		var getTable= document.getElementById("seedTreatmentDetails");
		
		
		if(getTable){
			$("#seedTreatmentDetails").val(-1);
			jQuery("#seedTreatment").show();
			jQuery("#seedTreatmentId").show();
			
		}
		else{
		
			jQuery("#seedTreatment").hide();
		}
	  } */
	  
	  
	/* function removeSeedTreatmentDetails(){
		var getDetail=document.getElementById("seedTreatmentId");
			if(getDetail){
			//jQuery("#seedTreatmentId").hide();
		//	jQuery("#rmv").hide();
			jQuery("#seedTreatment").hide();
			jQuery("#seedTreatmentId").val("");
			
		}
	} */
	
	 function hideByEleName(name){
     	$('[name="'+name+'"]').closest( ".flexform-item" ).addClass( "hide" );
     }
	
	function insertOptions(ctrlName, jsonArr) {
		document.getElementById(ctrlName).length = 0;
		addOption(document.getElementById(ctrlName), "Select", "0");
		for (var i = 0; i < jsonArr.length; i++) {
			addOption(document.getElementById(ctrlName), jsonArr[i].name,
					jsonArr[i].id);
		}
		
		 var id="#"+ctrlName;
	     jQuery(id).select2();
	}

	function addOption(selectbox, text, value) {
		var optn = document.createElement("OPTION");
		optn.text = text;
		optn.value = value;
		selectbox.options.add(optn);
	}

	function listVariety(obj){
		var selectedCrop = $('#farmCropsMasters').val();
		jQuery.post("farmCrops_populateVariety.action",{id:obj.value,dt:new Date(),selectedCrop:obj.value},function(result){
			insertOptions("farmVarietyMaster",$.parseJSON(result));
		});
	}
	function getDate(val){
		//alert(val);
		//$('#calendarHarvestDate').datepicker('destroy');
		$( "#calendarHarvestDate" ).datepicker('setDate',null);
		
		 $( "#calendarHarvestDate" ).datepicker({
			 minDate:+0
				});		
		$('#calendarHarvestDate').datepicker('option', 'minDate', new Date(val));
		/*  $( "#calendarHarvestDate" ).datepicker({
			minDate: new Date(val)
			});  */
	}
	$( "#calendarSowingDate" ).datepicker({
		maxDate: '0',
		beforeShow : function(){
			jQuery( this ).datepicker({ maxDate: 0 });
		},
		changeMonth: true,
		changeYear: true
	});
	
	$( "#calendarHarvestDate" ).datepicker({
		minDate: '0',
		beforeShow : function(){
			jQuery( this ).datepicker({ minDate: 0 });
		},
		changeMonth: true,
		changeYear: true
	});
	
	
	
	
	 if(document.getElementById("sowingDate")!=null)
		document.getElementById("sowingDate").value='<s:property value="currentDate" />'; 
		function isDecimal(evt) {
			
			 evt = (evt) ? evt : window.event;
			    var charCode = (evt.which) ? evt.which : evt.keyCode;
			    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) {
			        return false;
			    }
			    return true;
		}
		
		 function convertKgToMetric(){
			 
				var prefff =  ($("#estYldPfx").val()=='') ? 0 : $("#estYldPfx").val();
				var siff =  ($("#estYldSfx").val()=='') ? 0 : $("#estYldSfx").val();
				var totalValu = parseFloat(prefff+"."+siff);
		        	var plantHect =(totalValu/1000).toFixed(6);
		        	
		        	if(document.getElementById('plantTonnesValues')!=null)
		 				{
		        	document.getElementById('plantTonnesValues').innerHTML=plantHect;
						 }
		        }
		 
		 var tenant='<s:property value="getCurrentTenantId()"/>';
		
	function showOther(val){
		if(val=="99"){
			 jQuery(".typeOtherDiv").show(); 
			
		}
	}

		 function isDecimal(evt) {
				
			 evt = (evt) ? evt : window.event;
			    var charCode = (evt.which) ? evt.which : evt.keyCode;
			    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) {
			        return false;
			    }
			    if(charCode==46){
			    	if(flag==1)
			    		return false;
			    	else
			    		flag=1;
			    }
			    return true;
		}
</script>
</body>