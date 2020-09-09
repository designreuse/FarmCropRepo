<%@ include file="/jsp/common/form-assets.jsp"%>
<%@ include file="/jsp/common/detail-assets.jsp"%>
<%@ include file="/jsp/common/grid-assets.jsp"%>

<head>
<link rel="stylesheet" href="plugins/select2/select2.min.css">
<META name="decorator" content="swithlayout">
</head>
<style>
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
<script src="js/dynamicComponents.js?v=20.21"></script>
<script>
$("#calendarDOC").datepicker({
	format : "mm-yyyy",
	startView : "months",
	minViewMode : "months"
});



$("#calendarFormat").datepicker({
	format : "mm-yyyy",
	startView : "months",
	minViewMode : "months"
});
    var validationForCertifiedFarmer = false;
    var cerf = '<s:property value="farmerId" />';
    var hit=true;
    var enableSoil = '<s:property value="enableSoliTesting"/>';
    var tenant='<s:property value="getCurrentTenantId()"/>';
    var isGramPanchayatEnable='<s:property value="gramPanchayatEnable"/>';
    $(document).ready(function () {    

    	setQualified('<s:property value="farm.farmIcsConv.qualified"/>');
                    /* 	if(tenant=="awi"||tenant=="AWI"){
                			callAWI();
                		}else */ 
                    	
                    	var farmerId = '<s:property value="farmerId" />';
                    	
                    	//if(!isEmpty(farmerId)){
                    	//	$.post("farm_detailCheckForCertifiedFarmer", {selectedFarmerId: cerf}, function (data) {
                              	//alert(data);
                    	//		if ("YES" == data) {
                                	
                         //       }else{
                                	
                         //       }
                          //  });
                    	//}
                    	hideFields();
                    	 
                    	$("#organicStatus").val("In process");
                    	document.getElementById('organicStatus').disabled = true;
                    	
                    	jQuery.post("farm_populateHideFn.action", {}, function(result) {
                			var farmerHideFields = jQuery.parseJSON(result);
                			
                			$.each(farmerHideFields, function(index, value) {
                				if(value.type=='1'){
            						console.log(value.typeName);
            						showByEleName(value.typeName);
            					}if(value.type=='2'){
            						showByEleId(value.typeName);
            					}if(value.type=='3'){
            						showByEleClass(value.typeName);
            					}if(value.type=='4'){
            						$("."+value.typeName).removeClass("hide");
            						console.log(value.typeName);
            					} if(value.type=='5'){
            						hideByEleClass(value.typeName);
            						$("."+value.typeName).remove();
            					}
                			});
                			
                	    });
                    	if('<s:property value="command"/>'!="updateActPlan"){
                    	renderDynamicFeilds();
                    	}else{
                    		renderDynamicFeildsWithActPlan();
                    	}
               		 if('<s:property value="command"/>'=="update"){
            				setDynamicFieldUpdateValues();
            			}
                    	jQuery(".farmOtherDiv").hide();
                    	jQuery(".bene").hide(); 
                    	jQuery(".isFfsbene").hide();
                    	
                    	jQuery(".millCrop").hide();
                    	jQuery(".millCount").hide();
                    	
                    	 var val='<s:property value="farm.farmDetailedInfo.farmerFieldSchool"/>';
                				if(val=="1"){
                					$('.bene').show();
                					$('.isFfsbene').show();
                				}
                				else{
                					$('.bene').hide();
                					$('.isFfsbene').hide();
                					
                				}
                				
                		var val='<s:property value="farm.farmDetailedInfo.milletCultivated"/>';
                		if(val==1){
                			$('.millCrop').show();
                			$('.milletCrop').show();
                			$('.millCount').show();
                			$('.milletCount').show();
                		}else{
                			$('.millCrop').hide();
                			$('.milletCrop').hide();
                			$('.millCount').hide();
                			$('.milletCount').hide();
                		}
   
                        if(tenant=="symrise"){

                		$( $(".surveyNo")).after($(".distanceProcessingUnit"), $(".ownLand"), $(".soilType"),$(".soilTexture"));

                          jQuery(".gpsInfo").addClass("hide");
                         // $( $(".surveyNo")).after($(".distanceProcessingUnit")); 
                         // $( $(".soilType")).after($(".farmRegNo")); 
                          jQuery(".noOfWineOnPlot").removeClass("hide");
                          //$( $(".noOfWineOnPlot")).before($(".ownLand"));
                        }
                		var val='<s:property value="farm.soilTesting"/>';
                		if (val==1)
                  		  {
                			$('#wDoc').show();
                   		 }else{
                   			$('#wDoc').hide();
                   		 }
            			
                    	var isEdit = '<s:property value="command" />';
                    	
                    	if(isEdit=='update'){
                    		showFarmOther($('#farmOwned').val());
                    		//var soilType = $('#soilTypeName').val();
                    		
                    		 //irrigationType($('#methodIrrigation').val());
                    		//$("#methodIrrigation").val();
                    		if(tenant!='pratibha' &&  tenant!='griffith'){
                    			
                    		calculateLandHect();
                    		calculatePlantHect();
                    		
                    		}
                    		if(tenant=='symrise'){
                    		calculateNoOfWineOnPlot();
                    		}
                    		if(tenant=='chetna'){
                    			 var selectedWaterHarvest =  '<s:property value="farm.waterHarvest" />';
                    		
                    			 if(selectedWaterHarvest!=null&&selectedWaterHarvest.trim()!=""){
                    			  var values = selectedWaterHarvest.split("\\,");
                    			  var selectedValues = new Array();
                    			  $.each(selectedWaterHarvest.split(","), function(i,e){
                    				  selectedValues[i] = e.trim();
                    			  });
                    			  	$("#waterHarvest").select2('val',selectedValues);
                    			 }
                    		}
                    		
                    	}
                    	
                    	
                    	
                    	$("#expendDetail").val('');
                    	$("#expendVal").val('');
                    	$('#expendVal').keypress(function(event) {
                    	    var $this = $(this);
                    	    if ((event.which != 46 || $this.val().indexOf('.') != -1) &&
                    	       ((event.which < 48 || event.which > 57) &&
                    	       (event.which != 0 && event.which != 8))) {
                    	           event.preventDefault();
                    	    }

                    	    var text = $(this).val();
                    	    if ((event.which == 46) && (text.indexOf('.') == -1)) {
                    	        setTimeout(function() {
                    	            if ($this.val().substring($this.val().indexOf('.')).length > 3) {
                    	                $this.val($this.val().substring(0, $this.val().indexOf('.') + 3));
                    	            }
                    	        }, 1);
                    	    }

                    	    if ((text.indexOf('.') != -1) &&
                    	        (text.substring(text.indexOf('.')).length > 2) &&
                    	        (event.which != 0 && event.which != 8) &&
                    	        ($(this)[0].selectionStart >= text.length - 2)) {
                    	            event.preventDefault();
                    	    }      
                    	});
                    	
                    	var size='<s:property value="updatefarmerLandDetailsList.size()"/>';
                    	$("#landDltUpdateRowCount").val(size);
                    	 $(".frmrld").hide();
                    	 $("#addressesTable").hide();
                    	 $("#addressesTable").find('.checktext').keyup(function(){
                    	    
                    		 
                    	
                    	}); 
                        var farmerUniqueId =
    <%if (request.getParameter("farmerUniqueId") == null) {
				out.print("''");
			} else {
				out.print("'" + request.getParameter("farmerUniqueId") + "'");
			}%>
                        ;
                        jQuery("#farmerUniqueId").val(farmerUniqueId);
                        if(tenant!='pratibha'){

                        checkForCertifiedFarmer();
                        //$(".delBtnCon").addClass('noFile');
                        if (cerf != null || cerf != "") {
                            //alert(cerf);
                            $.post("farm_detailCheckForCertifiedFarmer", {
                                selectedFarmerId: cerf
                            }, function (data) {
                                if ("YES" == data) {
                                    //alert("A");
                                    columnsForCertifiedFarmer();
                                    //alert("validate");
                                    validationForCertifiedFarmer = true;
                                } else {
                                	
                                    //alert("B");
                                    columnsForUnCertifiedFarmer();
                                    validationForCertifiedFarmer = false;
                              	
                                }
                               /*  var deleteSelFile = document
                                        .getElementById('remImg')==null ? undefined : document
                                                .getElementById('remImg').files[0];
                                if (deleteSelFile == undefined) {
                                    $("#remImg").hide();
                                    $(".farmImage").addClass('farmImage');
                                } else {
                                    $("#remImg").show();
                                    $(".delBtnCon").removeClass('noFile');
                                    $(".farmImage").removeClass('farmImage');
                                } */

                               /*  $("#remImg").click(
                                        function () {
                                            var controll = $("#farmImage");
                                            controll.replaceWith(controll.val(
                                                    '').clone(true));
                                            $("#remImg").hide();
                                            $(".farmImage").addClass(
                                                    'farmImage');
                                            //alert("here");
                                        }); */

                            });
                        }
                        }else{
                        	if('<s:property value="getBranchId()"/>'=='bci'){
                        		jQuery("#ics").hide();
                        	}
                        }
                        addInventry1();
                        var group = document
                                .getElementsByName('farm.farmDetailedInfo.sameAddressofFarmer');
                        if (group[0].checked)
                            document.getElementById('addressTxt').disabled = true;
                        else
                            document.getElementById('addressTxt').disabled = false;

                        //jQuery(".rainFedDiv").hide();
                        jQuery(".otherValueDiv").hide();
                        jQuery(".other").hide();
                      
                       
                        //selectedMethodOfIrrigation("#methodIrrigation").val());
                        //Multi Select Drop Down

                        //Gradient drop down

                        var selectedRoad = '<s:property value="selectedRoad" />';
                        if (selectedRoad != null && selectedRoad.trim() != "") {
                            var values = selectedRoad.split("\\,");

                            $.each(selectedRoad.split(","), function (i, e) {
                                $("#gradient option[value='" + e.trim() + "']")
                                        .prop("selected", true);
                            });
                            $("#gradient").select2();
                        }
                        
                        // Land Gradient drop down
                        
                       var selectedGradient = '<s:property value="selectedGradient" />';
                        if (selectedGradient != null && selectedGradient.trim() != "") {
                            var values = selectedGradient.split("\\,");

                            $.each(selectedGradient.split(","), function (i, e) {
                                $("#land option[value='" + e.trim() + "']")
                                        .prop("selected", true);
                            });
                            $("#land").select2();
                        }


                        //Soil Type drop down

                        var selectedSoil = '<s:property value="selectedSoilType" />';

                        if (selectedSoil != null && selectedSoil.trim() != "") {
                            var values = selectedSoil.split("\\,");
                       
                            $.each(selectedSoil.split(","), function (i, e) {
                          
                                $("#soilType option[value='" + e.trim() + "']")
                                        .prop("selected", true);
                            });
                            $("#soilType").select2();
                        }
                        
                        
                        var selectedMethodOfIrrigation = '<s:property value="selectedMethodOfIrrigation" />';
                        if (selectedMethodOfIrrigation != null && selectedMethodOfIrrigation.trim() != "") {
                            var values = selectedMethodOfIrrigation.split("\\,");

                            $.each(selectedMethodOfIrrigation.split(","), function (i, e) {
                                $("#methodIrrigation option[value='" + e.trim() + "']")
                                        .prop("selected", true);
                            });
                            $("#methodIrrigation").select2();
                        }
                        

                        //Soil Texture drop down

                        var selectedTex = '<s:property value="selectedTexture" />';
                        if (selectedTex != null && selectedTex.trim() != "") {
                            var values = selectedTex.split("\\,");

                            $.each(selectedTex.split(","), function (i, e) {
                                $("#texture option[value='" + e.trim() + "']")
                                        .prop("selected", true);
                            });
                            $("#texture").select2();
                        }

                        //farmIrrigation source drop down

                        var selectedIrrigation = '<s:property value="selectedIrrigation" />';
                        if (selectedIrrigation != null
                                && selectedIrrigation.trim() != "") {
                            var values = selectedIrrigation.split("\\,");

                            $.each(selectedIrrigation.split(","),function (i, e) {
                                        $("#farmIrrigation option[value='" + e.trim() + "']")
                                                .prop("selected", true);
                                    });
                            $("#farmIrrigation").select2();
                        }
                        if(selectedIrrigation==-1 || selectedIrrigation == null || selectedIrrigation == "")
                       	{
                        	$("#irrigationType").hide();
                        	$("#irrigationTypeLabel").hide();
                       	}
                        
                        
                        // Irrigation Source drop down 
                        
                          var selectedIrrigationSource = '<s:property value="selectedIrrigationSource" />';
                        if (selectedIrrigationSource != null
                                && selectedIrrigationSource.trim() != "") {
                        	// alert(selectedIrrigationSource);
                            var values = selectedIrrigationSource.split("\\,");
							//alert(values);
                            $.each(selectedIrrigationSource.split(","),function (i, e) {
                                        $("#irrigationSource option[value='" + e.trim() + "']")
                                                .prop("selected", true);
                                    });
                        }
                        
                        // Multi selected for IFS Practice
                  		 var selectedifs =  '<s:property value="farm.ifs" />';
                  		 if(selectedifs!=null&&selectedifs.trim()!=""){
                  		  var values = selectedifs.split("\\,");
                  		  
                  		  $.each(selectedifs.split(","), function(i,e){
                  			  if (e.trim() == "99") {
                  					jQuery(".ifsOther").show();
                  				} else {
                  					jQuery(".ifsOther").hide();
                  				}
                  		      $("#ifs option[value='" + e.trim() + "']").prop("selected", true);
                  		  });
                  		 }	
                  		 
                  	// Multi selected for Soil Conservation
                  		 var selectedSoilConservation =  '<s:property value="farm.soilConservation" />';
                  		 if(selectedSoilConservation!=null&&selectedSoilConservation.trim()!=""){
                  		  var values = selectedSoilConservation.split("\\,");
                  		  
                  		  $.each(selectedSoilConservation.split(","), function(i,e){
                  			  if (e.trim() == "99") {
                  					jQuery(".soilConservationOther").show();
                  				} else {
                  					jQuery(".soilConservationOther").hide();
                  				}
                  		      $("#soilConservation option[value='" + e.trim() + "']").prop("selected", true);
                  		  });
                  		 }	
                  		 
                  	// Multi selected for Water Conservation
                  		 var selectedWaterConservation =  '<s:property value="farm.waterConservation" />';
                  		 if(selectedWaterConservation!=null&&selectedWaterConservation.trim()!=""){
                  		  var values = selectedWaterConservation.split("\\,");
                  		  
                  		  $.each(selectedWaterConservation.split(","), function(i,e){
                  			  if (e.trim() == "99") {
                  					jQuery(".waterConservationOther").show();
                  				} else {
                  					jQuery(".waterConservationOther").hide();
                  				}
                  		      $("#waterConservation option[value='" + e.trim() + "']").prop("selected", true);
                  		  });
                  		 }	
                     
                  	// Multi selected for Service Center
                  		var selectedServiceCentres =  '<s:property value="farm.serviceCentres" />';
                		 if(selectedServiceCentres!=null&&selectedServiceCentres.trim()!=""){
                		  var values = selectedServiceCentres.split("\\,");
                		  
                		  $.each(selectedServiceCentres.split(","), function(i,e){
                			  if (e.trim() == "99") {
                					jQuery(".serviceCentresOther").show();
                				} else {
                					jQuery(".serviceCentresOther").hide();
                				}
                		      $("#serviceCentres option[value='" + e.trim() + "']").prop("selected", true);
                		  });
                		 }	
                  		 
                  	//Multi selected for Traning and Program

                        var selectedTrainingProgram = '<s:property value="farm.trainingProgram" />';
                        if (selectedTrainingProgram != null && selectedTrainingProgram.trim() != "") {
                            var values = selectedTrainingProgram.split("\\,");

                            $.each(selectedTrainingProgram.split(","), function (i, e) {
                            	 if (e.trim() == "99") {
                   					jQuery(".trainingProgramOther").show();
                   				} else {
                   					jQuery(".trainingProgramOtherOther").hide();
                   				}
                                $("#trainingProgram option[value='" + e.trim() + "']")
                                        .prop("selected", true);
                            });
                        }
     		if(tenant!='pratibha' && tenant!='griffith'){
                		calculateLandHect();
                		calculatePlantHect();
                		}
                         selectedIrrigationValue(jQuery("#farmIrrigation").val());
                         irrigationOtherValue(jQuery("#irrigationSource").val());
                         
                		$('.select2Multi').selectize({
                			 plugins: ['remove_button'],
                			 delimiter: ',',
                			 persist: false,
                		/* 	 create: function(input) {
                			  return {
                			   value: input,
                			   text: input
                			  }
                			 } */
                			});
                		
                		if(tenant=='indev'||tenant=='chetna'||tenant=='mhr'){
                    		jQuery("#ics").hide();
                    	}
                		
                		
                		$("#calendarInsp").datepicker(
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
                		
                		
                  

             		$("#calendarLastDateChemical").datepicker(
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
             		
             		$("#calendarAudit").datepicker(
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
            		jQuery(".totalOrganic").removeClass('hide');
            		$('#tableTemplate').hide();
            		refreshTreeDetails();
            	
            		
                });
                
                    
                    function hideByEleName(name){
                    	$('[name="'+name+'"]').closest( ".flexform-item" ).addClass( "hide" );
                    }
                    

                    function showByEleName(name){
                    	$('[name="'+name+'"]').closest( ".flexform-item" ).removeClass( "hide" );
                    }

                    function hideByEleClass(className){
                    	$("."+className).closest( ".flexform-item" ).addClass( "hide" );
                    }
                    function getTxnType(){
                		
            			return "359";
            		}
                    function showByEleClass(className){
                    	$("."+className).closest( ".flexform-item" ).removeClass( "hide" );
                    }

                    function hideByEleId(id){
                    	$("#"+id).closest( ".flexform-item" ).addClass( "hide" );
                    }

                    function showByEleId(id){
                    	$("#"+id).closest( ".flexform-item" ).removeClass( "hide" );
                    }
    function isAlpahaNumeric(e){
    	var regex = new RegExp("^[a-zA-Z0-9\b]+$");
	    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	    if (regex.test(str)) {
	        return true;
	    }

	    e.preventDefault();
	    return false;
    }
    
    function soilTesting(evt)
	{
		var val=$(evt).val();
		if(val==1)
			{
			jQuery("#wDoc").show();
			}
		else{
			jQuery("#wDoc").hide();
		}
	}
    
    

    function checkForCertifiedFarmer() {
        var farmer = document.getElementById('farmerId').value;
        //alert(farmer);
        if (farmer != null && farmer != "") {
            $.post("farm_detailCheckForCertifiedFarmer", {
                selectedFarmerId: farmer
            }, function (data) {
                if ("YES" == data) {
                    columnsForCertifiedFarmer();
                    validationForCertifiedFarmer = true;
                    
                    	jQuery(".organicStatusDiv").show();
                    	organicStatus();
                    	jQuery(".certYear").show();
            		
                } else {
                	
                    columnsForUnCertifiedFarmer();
                    validationForCertifiedFarmer = false;
                    jQuery(".organicStatusDiv").hide();
                    jQuery(".certYear").hide();
                	
                }
            });
        } else
            columnsForUnCertifiedFarmer();
    }
	
    function callAWI(){
    	jQuery("#farmLocationInfo").removeClass( "hide" );
    }   


    function hideFields(){
    	 var app = $(".appContentWrapper");
    	 $(app).addClass("hide");
    	 $(app).not(".farmerDynamicField").find(".flexform-item").each(function(){
    	 	 $(this).addClass("hide");
    	 });
    	  
    	}
    function columnsForCertifiedFarmer() {
        //document.getElementById('tr3').className="hide";
        //document.getElementById('tr5').className="odd";
        //document.getElementById('tr6').className="odd";
        //document.getElementById('tr7').className="odd";
        //document.getElementById('tr8').className="odd";
        // document.getElementById('tr9').className="odd";
        // document.getElementById('tr10').className="odd";
        //document.getElementById('tr11').className="odd";
        //document.getElementById('tr12').className="odd";
        //document.getElementById('tr13').className="odd";
        //document.getElementById('table2').className="odd";
          if(tenant!="welspun"){
         jQuery(".farmLabourInfo").removeClass("hide");
         jQuery(".conversionInfo").removeClass("hide");
         jQuery(".conversionStatus").removeClass("hide");
           }
          if(tenant=="avt"){
           jQuery(".farmLabourInfo").addClass("hide");
           jQuery(".conversionInfo").addClass("hide");
           jQuery(".conversionStatus").addClass("hide");
         }
           
        if(tenant=='iccoa')
        {
        
    	 jQuery(".farmLabourInfo").addClass("hide");
    	        
        }
         if(tenant=="wilmar"){
         jQuery(".soilIrrigationInfo").removeClass("hide");
         jQuery(".conversionInfo").addClass("hide");
         jQuery(".fieldHistoryInfo").removeClass("hide");
         }
         if(tenant=="symrise"){
         jQuery(".farmLabourInfo").addClass("hide");
         jQuery(".conversionInfo").addClass("hide");
         jQuery(".soilIrrigationInfo").addClass("hide");
         jQuery(".conversionStatus").addClass("hide");}
         
    }
    
    function ffsSchool(evt){
    	var val=$(evt).val();
		if(val==1){
			$('.bene').show();
			$('.isFfsbene').show();
			
		}
		else{
			$('.bene').hide();
			$('.isFfsbene').hide();
			
		}
	}
    
    function millestcultivation(evt){
    	var val=$(evt).val();
		if(val==1){
			$('.millCrop').show();
			$('.milletCrop').show();
			$('.millCount').show();
			$('.milletCount').show();
		}else{
			$('.millCrop').hide();
			$('.milletCrop').hide();
			$('.millCount').hide();
			$('.milletCount').hide();
		}
    }
    

    function columnsForUnCertifiedFarmer() {
        //document.getElementById('tr3').className="odd";
        //	document.getElementById('tr5').className="hide";
        //document.getElementById('tr6').className="hide";
        //document.getElementById('tr7').className="hide";
        //document.getElementById('tr8').className="hide";
        //document.getElementById('tr9').className="hide";
        //document.getElementById('tr10').className="hide";
        //document.getElementById('tr11').className="hide";
        //document.getElementById('tr12').className="hide";
        // document.getElementById('tr13').className="hide";
        //document.getElementById('table2').className="hide";
         jQuery(".farmLabourInfo").addClass("hide");
         jQuery(".conversionInfo").addClass("hide");
         jQuery(".conversionStatus").addClass("hide");
         if(tenant=="wilmar"){
         jQuery(".soilIrrigationInfo").addClass("hide");
         jQuery(".fieldHistoryInfo").removeClass("hide");

         }
         if(tenant=="livelihood"){
        	 jQuery(".farmLabourInfo").removeClass("hide");
        	 jQuery(".conversionInfo").removeClass("hide");
             
         }
         
    }

    function sameAsFarmerAddress(element) {
        var group = document.getElementsByName(element);
        var farmer;
        if (group[0].checked) {
            farmer = '<s:property value="farmerId" />';
            if (farmer == null || farmer == "") {
                farmer = document.getElementById('farmer').value;
            }
            $.post("farm_detailFarmAddressSameAsFarmer", {
                selectedFarmerId: farmer
            }, function (data) {
                if (data != "") {
                    document.getElementById('addressTxt').value = data;
                    document.getElementById('addressTxt').disabled = true;
                }
            });
        } else {
            document.getElementById('addressTxt').value = "";
            document.getElementById('addressTxt').disabled = false;
        }
    }
    function organicStatus(element) {     
    	 var command=$("#command").val();
    	var farmer;     
            farmer = '<s:property value="farmerId" />';
            var id = '<s:property value="farmId" />';
            //alert(id);
            if (farmer == null || farmer == "") {
                farmer = document.getElementById('farmer').value;
            }
         /*    if(command.toLowerCase()!="update"){ */
            $.post("farm_organicStatusFarm", {
                selectedFarmerId: farmer,
                id:id
            }, function (data) {
                if (data != "") {
                    document.getElementById('organicStatus').value = data;
                    document.getElementById('organicStatus').disabled = true;
                }
            });
            /* }else{
            	 document.getElementById('organicStatus').disabled = true;
            } */
    }
    function selectedIrrigationValue(data) {
        if (isEmpty(data)&& data==null) {
            //	jQuery("#otherValueDiv").hide();            
            jQuery("#otherValue").hide();
            jQuery("#farmIrrigationType").hide();
            //jQuery("#farmIrrigationType").show();
              
            
             		$(".other").hide();
                 	$("#otherValueDiv").hide();
                 	$("#otherValue").val("");
                     $("#otherValue").hide();
             	
            	
            }
           // document.getElementById('irrigationSource').selectedIndex = ""; 
        //} 
    else if (data == 1) {
        	if($("#farmIrrigation").val()!="1,2"){
        	$("#irrigationType").hide();
        	$("#irrigationTypeLabel").hide();
            jQuery("#otherValueDiv").hide();
            jQuery("#otherValue").val("");
            jQuery("#otherValue").hide();
            jQuery(".other").hide();
            document.getElementById('irrigationSource').selectedIndex = "";
            jQuery("#farmIrrigationType").hide();
            
        	}
        	else if($("#farmIrrigation").val()!="1") {
        		$("#irrigationType").show();
        		$("#farmIrrigationType").show();
            	$("#irrigationTypeLabel").show();
                jQuery("#otherValueDiv").hide();
                jQuery("#otherValue").val("");
                jQuery("#otherValue").hide();
                jQuery(".other").hide();
                document.getElementById('irrigationSource').selectedIndex = "";
        	}       	

        } else if (data == 2) {	

        	$("#irrigationType").show();
        	$("#irrigationTypeLabel").show();
        	$("#farmIrrigationType").show();
        	$("#irrigationSource").show();
        	$("#farmIrrigationType").show();
        	if($("#irrigationSource option:selected").val()!=-1)
        	{
        		var val = $("#irrigationSource option:selected").val();
        		if(val==99)
        		{
        			document.getElementById('irrigationSource').selectedValue = val;
        			jQuery("#otherValue").show();
        		}else{
        			document.getElementById('irrigationSource').selectedValue = val;
        		}
        	}
        	else{
        		document.getElementById('irrigationSource').selectedIndex = "";
        	}
        }
        else{
        	if(data==""){
        		$("#irrigationType").hide();
            	$("#irrigationTypeLabel").hide();
            	
            	document.getElementById('irrigationSource').selectedIndex = "";
            	
            	$(".other").hide();
            	$("#otherValueDiv").hide();
            	$("#otherValue").val("");
                $("#otherValue").hide();
        	}
        	else if(data!="1,2"){ 
        		$("#irrigationType").show();
            	$("#irrigationTypeLabel").show();
            	
                //document.getElementById('irrigationSource').selectedIndex = "";
                
                if($("#irrigationSource option:selected").val()==99){
                	$(".other").show();
                	$("#otherValueDiv").show();
                    $("#otherValue").show();               	
            	}else{
            		$(".other").hide();
                	$("#otherValueDiv").hide();
                	$("#otherValue").val("");
                    $("#otherValue").hide();
            	}
        	}
        	else{
        		$("#irrigationType").show();
            	$("#irrigationTypeLabel").show();
        	}
        }
      
    }

    function irrigationOtherValue(data) {
        if (data == 99) {
            jQuery("#otherValueDiv").show();
            jQuery("#otherValue").show();
            //jQuery(".other").show();
        } else {
            jQuery("#otherValueDiv").hide();
            jQuery("#otherValue").hide();
            //	jQuery("#otherValue").val("");
            //jQuery(".other").hide();
        }
    }
    if(enableSoil=='1'){
    function validateDocument(){
    	var allowedFiles = [".pdf",".xls",".xlxs",".doc",".docx",".jpg"];
		var maxFileSize= 1048576;/* maximum File Size: 1048576 bytes=1MB*/	
		var isError = true;
		var wDocsave1 = $("#wDocsave1");
		var lblError= $("#lblError");
		var filesizeWD1;
		
		filesizeWD1=document.getElementById('wDocsave1').files[0];
		
		if( filesizeWD1== undefined){
			 filesizeWD1=0;
			}else{
				filesizeWD1=filesizeWD1.size;
			}
			
		
		var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(" + allowedFiles.join('|') + ")$");
		if (!regex.test(wDocsave1.val().toLowerCase())&& wDocsave1.val()!=""){
			lblError.html("Please upload files having extensions: " + allowedFiles.join(', ') + " only.");
			isError=false;
			return false;	
		}
		else if(filesizeWD1>maxFileSize){
			 lblError.html("File size is too large");
			 isError=false;
			 return false;	
		}else {
			lblError.html('');
		}
		 return isError;
    }
    }
	

    function validateImage() {

        var file = document.getElementById('farmImage').files[0];
        var filename = document.getElementById('farmImage').value;
        var fileExt = filename.split('.').pop();
		
        if (file != undefined) {

            if (fileExt == 'jpg' || fileExt == 'jpeg' || fileExt == 'png'
                    || fileExt == 'JPG' || fileExt == 'JPEG'
                    || fileExt == 'PNG') {
                if (file.size > 51200) {
                    alert('<s:text name="fileSizeExceeds"/>');
                    file.focus();
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
                //document.getElementById('farmImageExist').value = "1";
            } else {
                alert('<s:text name="invalidFileExtension"/>')
                file.focus();
                return false;
            }
        }

        return true;
    }

    function checkImgHeightAndWidth(val) {

        var _URL = window.URL || window.webkitURL;
        var img;
        var file = document.getElementById('farmImage').files[0];

        if (file) {

            img = new Image();
            img.onload = function () {
                imgHeight = this.height;
                imgWidth = this.width;
            };
            img.src = _URL.createObjectURL(file);
        }
    }
    function deleteFile(id) {
    	//var img =document.getElementById('farmImageFileName').value;
    	//alert(img);
    	//if(document.getElementById('image').value==''){
       /*  if(document.getElementById('farmImageFileName').value==''){
    		return false;
    	} */
    	
        if (confirm('<s:text name="confirmToDelete"/>')) {

            if (id != undefined) {

                $.post("farm_deletefile.action", {
                    fileid: id
                }, function (data, status) {
                    if (status === '<s:text name="success"/>') {
                        $('#image').attr("src", 'img/no-img.png');
                        $('#farmImageFileName').hide();
                        $("#farmImage").css({
                            "display": "block",
                            "float": "left"
                        });
                        $(".delBtnCon").addClass('noFile');
                        document.getElementById('farmImage').value = "";
                        document.getElementById('farmImageExist').value = "0";
                        alert('<s:text name="imgDelSuccessfully"/>');
                        $('#remImg').hide();
                    }
                });
            } else if (id == undefined) {

                $('#image').attr("src", 'img/no-img.png');
                $('#farmImageFileName').hide();
                $("#farmImage").css({
                    "display": "block",
                    "float": "left"
                });
                $(".delBtnCon").addClass('noFile');
                document.getElementById('farmImage').value = "";
                document.getElementById('farmImageExist').value = "0";
                alert('<s:text name="imgDelSuccessfully"/>');
               // $('#remImg').hide();
            }
        }
    }

    function checkImgHeightAndWidth(value) {
        $("#remImg").show();
        $(".farmImage").removeClass('farmImage');
        }

    jQuery(function ($) {
        $("#calendar").datepicker({});
    });
    jQuery(function ($) {
        $("#calendarBOC1").datepicker({});
    });
    jQuery(function ($) {
        $("#calendarBOC2").datepicker({});
    });
    jQuery(function ($) {
        $("#calendarBOC3").datepicker({});
    });

    jQuery(function ($) {

        /* $("#calendarDOC").datepicker({
            maxDate: '0',
            beforeShow: function () {
                jQuery(this).datepicker({
                    maxDate: 0
                });
            },
            changeMonth: true,
            changeYear: true
        }); */
    	
    });

    jQuery(function ($) {
        $("#calendarDOJ").datepicker(
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
    });

    function addSoilDetail() {
        //alert("inside add");
        $('#soilTypeName').val('');
        document.getElementById("validateError").innerHTML = "";
        
    }

    function addSoilTexDetail() {
        //alert("inside add");
        $('#soilTexName').val('');
        document.getElementById("validateSoilTexError").innerHTML = "";

    }

    function buttonSoilCance() {
        //refreshPopup();
        document.getElementById("model-close-soil-btn").click();
    }

    function buttonSoilTexCancels() {
        //refreshPopup();
        document.getElementById("model-close-soilTex-btn").click();
    }

    function saveSoilTexInfor() {
      var valid = true;
        var soilTex = $('#soilTexName').val();
        var alreadySelected = $("#texture").val();
        if (soilTex == "") {
            document.getElementById("validateSoilTexError").innerHTML = '<s:text name="empty.soilTex"/>';
            valid = false;
        }
        if(valid){
        jQuery.post("farm_populateSoilTex.action",{soilTexName: soilTex},
                function (result) {
        			if (result != 0) {
                    	insertOptions("texture", JSON.parse(result));
                        document.getElementById("model-close-soilTex-btn").click();
                   	} else {
                                document.getElementById("validateSoilTexError").innerHTML = '<s:text name="soilTex.exists"/>';
                            }
        			if(alreadySelected!=""){
        		        $.each(alreadySelected.toString().split(","), function (i, e) {
        		            $("#texture option[value='" + e.trim() + "']")
        		                    .prop("selected", true);
        		        });
        	        }
                        });
    }
    }

    function saveSoilTypeInfor() {
    	var valid = true;
        var soilType = $('#soilTypeName').val();
        var alreadySelected = $("#soilType").val();
        if (soilType == "") {
            document.getElementById("validateError").innerHTML = '<s:text name="empty.soilType"/>';
            valid = false;
        }
        if(valid){
        	jQuery.post("farm_populateSoilType.action",{soilTypeName: soilType},function (result) {
        		
        		
       console.log(result);
       if (result != 0) {
                	insertOptions("soilType",JSON.parse(result));
                    document.getElementById("model-close-soil-btn")
                            .click();
                } else {
                	document.getElementById("validateError").innerHTML = '<s:text name="soilType.exists"/>';
                }
                if(alreadySelected!=null&&alreadySelected!=""){
                	$.each(alreadySelected.toString().split(","), function (i, e) {
        	            $("#soilType option[value='" + e.trim() + "']")
        	                    .prop("selected", true);
        	        });
                }
            });    }
        var selectedSoil = '<s:property value="selectedSoilType" />';

        if (selectedSoil != null && selectedSoil.trim() != "") {
            var values = selectedSoil.split("\\,");
       
            $.each(selectedSoil.split(","), function (i, e) {
          
                $("#soilType option[value='" + e.trim() + "']")
                        .prop("selected", true);
            });
        }
    }
    
    function processIfs(val) {	
    	
		 var selectedIfs =$("#ifs").val();
		 if(selectedIfs!=null && selectedIfs!="")
		 {
			 var ifsTrim=selectedIfs.toString().trim();
			 if(ifsTrim.includes('99'))
			 {
				  jQuery(".ifsOther").show();
				}
				else
				{
					
					jQuery(".ifsOther").hide();
				}
	
		 }	
		 else
			 {
				 jQuery(".ifsOther").hide();
			 }
		
		
		}
   
   function processSoilConservation(val) {			
		
		 var selectedSoilConservation =$("#soilConservation").val();
		 if(selectedSoilConservation!=null && selectedSoilConservation!="")
		 {
			 var soilConservationTrim=selectedSoilConservation.toString().trim();
			 if(soilConservationTrim.includes('99'))
			 {
				 jQuery(".soilConservationOther").show();
						
			}
				else
				{
					
					jQuery(".soilConservationOther").hide();
				}
	
		 }	
		 else
			 {
				 jQuery(".soilConservationOther").hide();
			 }
		
		}
function processWaterConservation(val) {
		
		 var selectedWaterConservation =$("#waterConservation").val();
		 if(selectedWaterConservation!=null && selectedWaterConservation!="")
		 {
			 var waterConservationTrim=selectedWaterConservation.toString().trim();
			 if(waterConservationTrim.includes('99'))
			 {
				
					jQuery(".waterConservationOther").show();
				
				}
				else
				{
					
					jQuery(".waterConservationOther").hide();
				}
	
		 }	
		 else
			 {
				 jQuery(".waterConservationOther").hide();
			 }
		
		
		
		}
function saveAnimalHusbandary(){
	/* var paramObj = {};	
 	var farmId = $("#farm").val();

	var faimingtype= jQuery("#enrollmentPlace").val();
	//alert(faimingtype);
	var farmtype ='<s:text name="farmer.farmingtypeseasonland1"/>';
	var irrigatedLand = jQuery("#totalLandone").val();
	//alert(irrigatedLand);
	var irrigatedFarmingLand = jQuery("#landIfs").val();
	var farmtype1='<s:text name="farmer.farmingtypeseasonland2"/>';
	var fedtotaland = jQuery("#totalLandRain").val();
	var fedtotalics =jQuery("#landIfsRain").val();
	
//	var irrigatedDetail=irrigatedLand+"%"+irrigatedFarmingLand+"%"+ fedtotaland+"%"+fedtotalics;

	/* console.log("----------"+irrigatedLand);
	console.log("----------"+rainFeedDetail); */
	//alert("check1");
/* 	 jQuery.post("farm_populateFarmingtype.action", {irrigateDetail:irrigatedDetail,rainFeedDetail:rainFeedDetail}, function (result) {
		
	});  */
	 
	/* var rowCount = $('#tableTemplate2 tr').length;
	var id=rowCount+1;
	
    $( "#tableTemplate2 tbody" ).append(        		       
      	"<tr class='tableTr2'>"+
      	"<td>" + faimingtype + "<input type='hidden' value='"+faimingtype+"' id='faimingtype"+(id)+"' /></td>" +
      	 "<td>" + farmtype + "<input type='hidden' value='"+farmtype+"' id='farmtype"+(id)+"' /></td>" +
         "<td>" + irrigatedLand + "<input type='hidden' value='"+irrigatedLand+"' id='irrigatedLand"+(id)+"' /></td>" +
         "<td>" + irrigatedFarmingLand + "<input type='hidden' value='"+irrigatedFarmingLand+"' id='irrigatedFarmingLand"+(id)+"' /></td>" +        
         "<td><button id='"+id+"' class='btn deleteBank btn-warning' href='#' onclick='deleteBank(this);'><label><s:text name='delete.button'/></label></button></td>" +
        "</tr>"+
		"<tr class='tableTr2'>"+
		"<td>" + faimingtype + "<input type='hidden' value='"+faimingtype+"' id='faimingtype1"+(id)+"' /></td>" +
		 "<td>" + farmtype1 + "<input type='hidden' value='"+farmtype1+"' id='farmtype1"+(id)+"' /></td>" +
         "<td>" + fedtotaland + "<input type='hidden' value='"+fedtotaland+"' id='fedtotaland"+(id)+"' /></td>" +
         "<td>" + fedtotalics + "<input type='hidden' value='"+fedtotalics+"' id='fedtotalics"+(id)+"' /></td>" +        
         "<td><button id='"+id+"' class='btn deleteBank btn-warning' href='#' onclick='deleteBank(this);'><label><s:text name='delete.button'/></label></button></td>" +
        	"</tr>"    
        	
    ); */ 
}  


function savefarming(){/* 
	//var tableFoot=document.getElementById("tableTemplate2");
   //var rows = tableFoot.getElementsByClassName("tableTr2");
 
 
    var FarmerseasonJsonString=[];
//alert(rows.length);
    for(i=2;i<=rows.length;i++){
     var objfI1=new Object();
/*      var irrigatedLand=jQuery("#irrigatedLand"+i).val();
     alert("**irrigatedLand**"+irrigatedLand);
     var irrigatedFarmingLand=jQuery("#irrigatedFarmingLand"+i).val();
     var fedtotaland=jQuery("#fedtotaland"+i).val();
     var fedtotalics=jQuery("#fedtotalics"+i).val();
     alert("***fedtotalics***"+fedtotalics);
     var faimingtype=jQuery("#faimingtype"+i).val(); */
    /*  if (objfI1 !=='' && objfI1 !== 'undefined' && objfI1 !== null){   
     objfI1.irrigatedTotLand=jQuery("#irrigatedLand"+i).val();
     objfI1.irrigatedIfsPractices=jQuery("#irrigatedFarmingLand"+i).val();
     objfI1.rainfedTotLand=jQuery("#fedtotaland"+i).val();
     objfI1.ranifedIfsPractices=jQuery("#fedtotalics"+i).val();
     objfI1.seasonCode=jQuery("#faimingtype"+i).val();
    	 
     FarmerseasonJsonString.push(objfI1);
     }
    }
  
     var jsonArray=new Object();
     jsonArray=JSON.stringify(FarmerseasonJsonString);
     jQuery("#FarmerseasonJsonString").val(jsonArray);
 	
     console.log(jsonArray); */ 
    }

function processServiceCentres(val) {			
	
	 var selectedServiceCentres =$("#serviceCentres").val();
	 if(selectedServiceCentres!=null && selectedServiceCentres!="")
	 {
		 var serviceCentresTrim=selectedServiceCentres.toString().trim();
		 if(serviceCentresTrim.includes('99'))
		 {
				  jQuery(".serviceCentresOther").show();
			}
			else
			{
				
					jQuery(".serviceCentresOther").hide();
			}

	 }	
	 else
		 {
			 jQuery(".serviceCentresOther").hide();
		 }
	
	}
	
function processTrainingProgram(val) {
	
	 var selectedTrainingProgram =$("#trainingProgram").val();
	 if(selectedTrainingProgram!=null && selectedTrainingProgram!="")
	 {
		 var trainingProgramTrim=selectedTrainingProgram.toString().trim();
		 if(trainingProgramTrim.includes('99'))
		 {
			
				jQuery(".trainingProgramOther").show();
			
			}
			else
			{
				
				jQuery(".trainingProgramOther").hide();
			}

	 }	
	 else
		 {
			 jQuery(".trainingProgramOther").hide();
		 }
	
	
	
	}
	
function deleteBank(evt){
	//	var result = confirm("Do you want to delete the selected record?");
	var result =confirm('<s:text name="txt.delete"/>');	
	if(result){
			var $tr= $(evt).closest('tr'); 
			$tr.remove();
			evt.preventDefault();
		   }
		
		}
function addInventry1(){
	/* var table = document.getElementById("tblData1");
    var rows = table.getElementsByTagName("tr");
	$("#tblData1 tbody").append(
			"<tr class='tableTr1'>"+
			"<td align='center'>"+'<s:text name="farmer.farmingtypeseasonland1"/>'+"</td>"+
			"<td align='center'><input type='text' class='tableTd2 form-control ' name='textVal1' maxlength='5' id='totalLandone'/><div id='msg1'></div></td>"+
			"<td align='center'><input type='text' class='tableTd3 form-control ' name='textVal2' maxlength='5' id='landIfs'/><div id='msg2'></div></td>"+
			"</tr>"+
			"<tr class='tableTr1'>"+
			"<td align='center'>"+'<s:text name="farmer.farmingtypeseasonland2"/>'+"</td>"+
			"<td align='center'><input type='text' class='tableTd4 form-control ' name='textVal3' maxlength='5' id='totalLandRain'/><div id='msg3'></div></td>"+
			"<td align='center'><input type='text' class='tableTd5 form-control ' name='textVal4' maxlength='5' id='landIfsRain'/><div id='msg4'></div></td>"+
			"</tr>" 
		
	); */
	
}
$(document).ready(function () {
    //called when key is pressed in textbox
  	$(".tableTd2").keypress(function (e) {
     	//if the letter is not digit then display error and don't type anything
     	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        	//display error message
        	$("#msg1").html("Digits Only").show();
               return false;
     	}
   	});
    
  
  	$(".tableTd4").keypress(function (e) {
     	//if the letter is not digit then display error and don't type anything
     	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        	//display error message
        	$("#msg3").html("Digits Only").show();
               return false;
     	}
   	});
  	
  	 var  url = window.location.href;
  	  var command=$("#command").val();
  	if(url.indexOf('farmerUniqueId=') < 0){
	   //if(url.indexOf('farmerId=') < 0){ 
      if(command.toLowerCase()=="update"){
  	
	     url = url+'?id='+'<s:property value="farm.id"/>'+'&farmerUniqueId='+'<s:property value="farm.farmer.id"/>'+'&farmerId='+'<s:property value="farm.farmer.farmerId"/>';
  	 }else{
  		  url = url+'?id='+'<s:property value="farm.id"/>'+'&farmerUniqueId='+'<s:property value="farmerUniqueId"/>'+'&farmerId='+'<s:property value="farmerId"/>';
     }
      $( ".lanMenu" ).each(function() {
	    	 var url1 = $(this).attr("href") +'&url='+ encodeURIComponent(url);
	    	  $( this ).attr( "href",url1);
	    	});
	     }

    var stag = $('a[href="farmer_detail.action?id=&tabValue=tabs-2"]');
	 $(stag).attr("href", "javascript:onCancel();");
     
  	
});


function refreshFarming(){
	$(".tableTd2").val("");
	$(".tableTd3").val("");
	$(".tableTd4").val("");
	$(".tableTd5").val("");

}	
var results = [];
function addRowFarmingSystem(tableID) 
{ 
	var harvestSeasonVal=$("#harvestSeason").val();
	if(harvestSeasonVal==-1){
		alert("Please select the Season");
	}else{
		/* 
	 	if(results.length ==0){
	 		alert(results);
			 results.push(harvestSeasonVal);
		} 
		 for (var i = 0; i < results.length - 1; i++) {
		
		if (harvestSeasonVal ==results[i]) {
			alert("Farming Type already added");
		}else{
			results.push(harvestSeasonVal);
			alert(results);
		}
		
		
	} 
		 */
		
	$(".frmrld").show();
	 $("#addressesTable").show();
	  var table = document.getElementById(tableID);
	 // $('#addressesTable').append( '<tr><td style="center" colspan="3">dcdfdfdfdf</td></tr>' );
     var rowCount= table.rows.length;
      var counts;
      if(rowCount=='1'){
      	counts = rowCount - 1;
      }
      else{
      	counts=$("#rowIdentifier").val();
      }
      var row = table.insertRow(rowCount);
     	var cell1 = row.insertCell(0);
      cell1.innerHTML= "Irrigated Land";
    	var cell2 = row.insertCell(1);
      var irrigatedLand = document.createElement("input");
      irrigatedLand.type = "text";
      irrigatedLand.name = "farmerLandDetailsList[" + counts + "].irrigatedLand";
      var att = document.createAttribute("class");       // Create a "class" attribute
      att.value = "checkText";                           // Set the value of the class attribute
      irrigatedLand.setAttributeNode(att);
      cell2.appendChild(irrigatedLand);
      
      var cell3 = row.insertCell(2);
      var irrigatedFarmingLand = document.createElement("input");
      irrigatedFarmingLand.type = "text";
      irrigatedFarmingLand.name = "farmerLandDetailsList[" + counts + "].irrigatedFarmingLand";
      cell3.appendChild(irrigatedFarmingLand);
      
      var cell4 = row.insertCell(3);
		var element4 = document.createElement("input");
		element4.type = "checkbox";
		element4.name="chkbox[]";
		element4.value=rowCount;
		cell4.appendChild(element4);
      
      addRainFedlandRow(tableID,counts);
      $("#rowIdentifier").val(++counts);
	}
}

function addRainFedlandRow(tableID,counts){
	var  counts=counts;
	var table = document.getElementById(tableID);
	
    var rowCount= table.rows.length;
   
    var row = table.insertRow(rowCount);
   
    var cell1 = row.insertCell(0);
    cell1.innerHTML= "Rain fed land";
	
	var cell2 = row.insertCell(1);
    var fedtotaland = document.createElement("input");
    fedtotaland.type = "text";
    fedtotaland.name = "farmerLandDetailsList[" + counts + "].fedtotaland";
    cell2.appendChild(fedtotaland);
    
    var cell3 = row.insertCell(2);
    var fedtotalics = document.createElement("input");
    fedtotalics.type = "text";
    fedtotalics.name = "farmerLandDetailsList[" + counts + "].fedtotalics";
    cell3.appendChild(fedtotalics);

    var cell4 = row.insertCell(3);
   	var tempSeasonCode = document.createElement("input");
	tempSeasonCode.setAttribute("type", "hidden");
	tempSeasonCode.setAttribute("name", "farmerLandDetailsList[" + counts + "].tempSeasonCode");
	tempSeasonCode.setAttribute("value", $("#harvestSeason").val());
    cell4.appendChild(tempSeasonCode);
  
}


function validateTableData(){
var table = document.getElementById("addressesTable");
var flag=true;
if(table!=null)
{
var rowCount= table.rows.length;
var rowLimit=$("#rowIdentifier").val();
for(var i=0;i<=rowLimit-1;i++){
	var irrigatedLandVal=$("input[name~='farmerLandDetailsList["+i+"].irrigatedLand']").val();
	if(irrigatedLandVal !=undefined && irrigatedLandVal !=''){
		
	 if(isNaN(irrigatedLandVal)){
		
		flag=false;
		$("#irrigatedLandError").html("Please Enter the Valid Total Irrigated  Land (in Acres)");
		break;
		} else{
			$("#irrigatedLandError").html("");
		}
	}else{
		$("#irrigatedLandError").html("");
	}
}
// validation for RainfeedLand
for(var i=0;i<=rowLimit-1;i++){
	var fedtotalandVal=$("input[name~='farmerLandDetailsList["+i+"].fedtotaland']").val();
	if(fedtotalandVal !=undefined && fedtotalandVal !=''){
		if(isNaN(fedtotalandVal)){
		flag=false;
		$("#rainFedlandError").html("Please Enter the Valid Total Rain fed Land (in Acres)");
		break;
		} else{
			$("#rainFedlandError").html("");
		}
	}else{
		$("#rainFedlandError").html("");
	}
}

}
return flag;
}

function validateUpdateTable(){
	var table = document.getElementById("updatableTbl");
	var flag=true;
	if(table!=null)
	{
	var rowCount= table.rows.length;
	
	var rowLimit=$("#landDltUpdateRowCount").val();
	
	for(var i=0;i<=rowLimit-1;i++){
		var irrigatedLandVal=$("input[name~='updatefarmerLandDetailsList["+i+"].irrigatedTotLand']").val();
		
		if(irrigatedLandVal !=undefined && irrigatedLandVal !=''){
			
		 if(isNaN(irrigatedLandVal)){
			
			flag=false;
			$("#irrigatedLandError").html("Please Enter the Valid Total Irrigated  Land (in Acres)");
			break;
			} else{
				$("#irrigatedLandError").html("");
			}
		}else{
			$("#irrigatedLandError").html("");
		}
		
	}
	// validation for RainfeedLand
	for(var i=0;i<=rowLimit-1;i++){
		var fedtotalandVal=$("input[name~='updatefarmerLandDetailsList["+i+"].rainfedTotLand']").val();
		if(fedtotalandVal !=undefined && fedtotalandVal !=''){
			fedtotalandVal=parseFloat(fedtotalandVal);
			if(isNaN(fedtotalandVal)){
			
			flag=false;
			$("#rainFedlandError").html("Please Enter the Valid Total Rain fed Land (in Acres)");
			break;
			} else{
				$("#rainFedlandError").html("");
			}
		}else{
			$("#rainFedlandError").html("");
		}
	
	}

	}
	return flag;
	
	}




function clearRow(tableId){
var table = document.getElementById(tableId);

try {
var table = document.getElementById(tableId);
var rowCount = table.rows.length;

for(var i=1; i<rowCount; i++) {
	var row = table.rows[i];
	var chkbox = row.cells[3].childNodes[0];
	if(null != chkbox && true == chkbox.checked) {
		if(rowCount <= 1) {
			
			//break;
		}
		table.deleteRow(i);
		table.deleteRow(i);
		rowCount--;
		i--;
	}


}

}catch(e) {
	//alert(e);
}

var table = document.getElementById(tableId);
var rowCount = table.rows.length;
if(rowCount==1){
	$("#addressesTable").hide();
}
}
function deleteRowSelected(rowCount){
var farmerLandId=$("#farmerLandDltId").val();
$.post("farm_populateDeleteFarmerland",{farmerLandId:farmerLandId},function(result){
	var table = document.getElementById("updatableTbl");
	
	$(".frLandDetail"+rowCount).hide();
	//table.hideRow(rowCount);
	//table.deleteRow(rowCount);
	
	//table.deleteRow(rowCount);
	var newRowCount=$("#farmerLandDltUpdateRowCount").val();
	$("#farmerLandDltUpdateRowCount").val(newRowCount-2);
	$("#landDltUpdateRowCount").val(newRowCount-2);
	if(newRowCount==1){
		$("#updatableTbl").hide();
	}
	
});
}
function addFramerLandId(val){
	$("#farmerLandDltId").val(val);
}

function soilTestsVisibility(){
	var soilTestsClass = $("#tblSoilData").attr('class');
	if(soilTestsClass == "panel-collapse collapse"){		
		 $("#tblSoilData").addClass("hide");
	}
	else{
		$("#tblSoilData").removeClass("hide");
	}
	
}


function appendRow(){
	var expendDetail=$("#expendDetail").val();
	var expendVal=$("#expendVal").val();
	var expendTfoot=document.getElementById("expenditure")
	var rows = expendTfoot.getElementsByTagName("tr");

	if(expendDetail!=''||expendVal!=''){
		
		$("#expenditure").append(
				"<tr class='tableTr1' id='expenditureRow"+((rows.length)+1)+"'>"+
					"<td align='center'><div id='expndDtl"+((rows.length)+1)+"'>"+expendDetail+"</div></td>"+
					"<td align='center'><div id='expndValue"+((rows.length)+1)+"'>"+expendVal+"</div></td>"+
				'<td style="text-align:center;">'+
				
				'<button type="button" class="btn btn-sm btn-success" aria-hidden="true" onclick="editExpndRow('+((rows.length)+1)+')"><i class=" fa fa-pencil-square-o"></i></button>'+
				
				' <button type="button" class="btn btn-sm btn-danger" aria-hidden="true" onclick="deleteExpndRow('+((rows.length)+1)+')"><i class="fa fa-trash" aria-hidden="true"></i></button></td>'+
				+"</tr><input type='hidden' value='0' id='expenditureId"+((rows.length)+1)+"'>"
		);
	}
	resetExpndData();
}

function editExpndRow(value){
	var expndDtlId="#expndDtl"+value;
	var expndValueId="#expndValue"+value;
	jQuery("#expendDetail").val(jQuery(expndDtlId).text());
	jQuery("#expendVal").val(jQuery(expndValueId).text());
	resetExpndData
	$("#appendBtnId").attr("onclick","editedExpndRows("+value+")");
}
function editedExpndRows(value){
	var expendDetail=jQuery("#expendDetail").val();
	var expendVal=jQuery("#expendVal").val();
	
	var expndDtlId="#expndDtl"+value;
	var expndValueId="#expndValue"+value;
	jQuery(expndValueId).text(expendVal);
	jQuery(expndDtlId).text(expendDetail);
	
	
	resetExpndData();
	 $("#appendBtnId").attr("onclick","appendRow()"); 
}
function deleteExpndRow(value){
	var expndDtlId="#expndDtl"+value;
	var expndValId="#expndVal"+value;
	
	jQuery(expndDtlId).text('');
	jQuery(expndValId).text('');
	jQuery("#expenditureRow"+value).attr("class","hide");
	
	
}

function resetExpndData(){
	jQuery("#expendDetail").val('');
	jQuery("#expendVal").val('');
	
	$("#appendBtnId").attr("onclick","appendRow()"); 
}

function listMunicipality(obj){
	var selectedLocality = $('#localities').val();
	jQuery.post("farm_populateCity.action",{id:obj.value,dt:new Date(),selectedLocality:obj.value},function(result){
		insertOptions("city",$.parseJSON(result));
		if(isGramPanchayatEnable=='1'){
			listPanchayat(document.getElementById("city"));
		}else{
			listVillageByCity(document.getElementById("city"));
		}
	});
}

function listPanchayat(obj){
	try{
	var selectedCity = $('#city').val();
	
	jQuery.post("farm_populatePanchayath.action",{id:obj.value,dt:new Date(),selectedCity:obj.value},function(result){
		insertOptions("panchayath",$.parseJSON(result));
		listVillage(document.getElementById("panchayath"));
	});
	}catch(e){
	}
}

function listVillage(obj){
	if(isGramPanchayatEnable=='1'){
		var selectedPanchayat = $('#panchayath').val();
		var enableGramPanch=document.getElementById("gramPanchayatEnable").value;
		jQuery.post("farm_populateVillage.action",{id:obj.value,dt:new Date(),selectedPanchayat:obj.value,gramPanchayatEnable:enableGramPanch},function(result){
			insertOptions("village",$.parseJSON(result));
		//	listSamithi(document.getElementById("village"));
		});
	}else{
		listVillageByCity(document.getElementById("city"));
	}
}

function listVillageByCity(obj){
		var selectedCity = $('#city').val();
		jQuery.post("farm_populateVillageByCity.action",{id:obj.value,dt:new Date(),selectedCity:obj.value},function(result){
			insertOptions("village",$.parseJSON(result));
			//listSamithi(document.getElementById("village"));
		});
}

function isDecimal(evt) {
	
	 evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) {
	        return false;
	    }
	    return true;
}

function listVariety(obj){
	var selectedCrop = $('#farmCropsMasters').val();
	jQuery.post("farm_populateVariety.action",{id:obj.value,dt:new Date(),selectedCrop:obj.value},function(result){
		insertOptions("farmVarietyMaster",$.parseJSON(result));
	});
}
function saveTreeDetails(obj){
	var flag=0;
	var paramObj = {};	
	refreshTreeTemplateList(obj);
		
	
		
}

function refreshTreeDetails(){
	$(".tableTd27").val("");
	$(".tableTd28").val("");
	$(".tableTd29").val("");
	$(".tableTd30").val("");
}
var totalOrgTrees=0.0;
var totalConvTrees=0.0;
var noOfTrees =0.0;
var bodyContentTree="";
var varietyValTxt="";
var varietyId="";
function refreshTreeTemplateList(obj){
	  var bodyContent = "";
	 
	  var flag=0;
	  var rowCount = $('#treeData tr').length;
	  rowCount++;
	 var prodStatus= $(".tableTd27 option:selected").text();
	  var farmVarietyMaster= $(".tableTd28 option:selected").text();
	  var farmVarietyMasterVal= $(".tableTd28 option:selected").val();
	  var years =$(".tableTd29 option:selected").text();
	  var yearsVal =$(".tableTd29 option:selected").val();
	  var noOfTrees=$('.tableTd30').val();
	  var prodStatusId= $(".tableTd27 option:selected").val();
	  if(prodStatus == ''||prodStatus == "Select"){
			alert('<s:text name="Please Select the ProductStatus"/>');
			flag=1;
			
		}
	  
	  if(farmVarietyMasterVal == ''||farmVarietyMasterVal == '-1'){
			alert('<s:text name="Please Select the Cultivar"/>');
			flag=1;
			
		} 
	  
	  if(yearsVal == ''){
			alert('<s:text name="Please Select the Year"/>');
			flag=1;
			
		} 
	  
	  if(noOfTrees == ''){
			alert('<s:text name="Please Enter the Number of Trees"/>');
			flag=1;
			
		} 
	  
	  
	  if(flag==0){
		    var idd = $('#treeDataDetail').children('tr').length+1;
		    bodyContent+='<tr id='+rowCount+' class="tableTr1">';
		    bodyContent+='<td class="prodStatus"   align="left">'+$(".tableTd27 option:selected").text()+'</td>';
		    bodyContent+='<td class="farmVarietyMaster"  align="left">'+$(".tableTd28 option:selected").text()+'</td>';
		    bodyContent+='<td class="years"  align="left">'+$(".tableTd29 option:selected").text()+'</td>';
		    bodyContent+='<td class="noOfTrees"   align="left">'+$('.tableTd30').val()+'</td>';
		    bodyContent+='<td align="left"><a href="#" class="fa fa-trash" onclick="butTreeDelete('+rowCount+');"/></td>';
		    
		    bodyContent+='<td class="hide"   align="left">'+$(".tableTd27 option:selected").val()+'</td>';
		    bodyContent+='<td class="hide"  align="left">'+$(".tableTd28 option:selected").val()+'</td>';
		    bodyContent+='<td class="hide"  align="left">'+$(".tableTd29 option:selected").val()+'</td>';
		    bodyContent+='</tr>';
		 $('#treeData').append(bodyContent);
		 
		

		    $('.tableTd27').val('');
		    $('.tableTd28').val('');
		    $('.tableTd29').val('');
		    $('.tableTd30').val('');
		  
		   
		  }
	 
	 
	}
	
function butTreeDelete(indx){
	if(confirm('<s:text name="confirm.delete"/>')){
	var index=indx-1;
	$("#treeData tr:eq("+index+")").remove();
		 
	}
}


/*  function addTreeDetails(){
	var idd = $('#treeDataDetail').children('tr').length;
	} 
 */




</script>
<body>

	<div class="error">
	
		<div style="float: right; color: #000000">
			<s:hidden name="farmerUniqueId" id="farmerUniqueId" />
			
					<h4 class="mb-0" style="padding-right: 5px; text-align: right;"><b><s:property
								value="%{getLocaleProperty('Farmer : ')}" /></b> <s:if
							test='"update".equalsIgnoreCase(command)'>


							<s:property value="farm.farmer.farmerId" /> - <s:property
								value="farm.farmer.name" />
						</s:if> <s:else>
							<s:property value="farmerName" />
						</s:else></h4>
				
		</div>
	</div>
	<br>

	


	<s:form name="form" cssClass="fillform" action="farm_%{command}"
		role="form" method="post" enctype="multipart/form-data">
		<s:hidden key="currentPage" />

		<s:hidden id="farmerId" name="farmerId" />
		<s:hidden id="farmerUniqueId" name="farmerUniqueId" />
		<s:hidden id="farmerName" name="farmerName" />
		<s:hidden id="plantDetailString" name="plantDetailString" />
		<s:hidden name="tabIndex" />
		<s:hidden id="dateOfInspection" name="dateOfInspection" />
		<s:hidden id="benefitaryString" name="benefitaryString" />
		<s:hidden id="sangham" name="sangham" />
		<s:hidden id="prodEditArray" name="prodEditArray" />
		<s:hidden id="rowIdentifier" name="rowIdentifier" />
		<s:hidden id="farmerLandDltId" name="farmerLandDltId" />
		<s:hidden id="farmerLandDltUpdateRowCount"
			name="farmerLandDltUpdateRowCount" />
		<s:hidden id="status" name="farm.farmIcsConv.status" />
		<s:hidden id="season" name="farm.farmIcsConv.season" />
		<s:hidden id="insMobile" name="farm.farmIcsConv.inspectorMobile" />
		<s:hidden id="totalLand" name="farm.farmIcsConv.totalLand" />
		<s:hidden id="organicLand" name="farm.farmIcsConv.organicLand" />
		<s:hidden id="totalSite" name="farm.farmIcsConv.totalSite" />
		<s:hidden id="insType" name="farm.farmIcsConv.insType" />
		<s:hidden id="jsonStr" name="treeDetailJsonString" />
		<s:hidden id="jsonString" name="farm.jsonString" />
		<s:hidden id="dynamicFieldsArray" name="dynamicFieldsArray" />
		<s:hidden id="dynamicListArray" name="dynamicListArray" />

		<s:if test='"update".equalsIgnoreCase(command)'>
			<s:hidden key="farm.id" class="uId" />
		</s:if>
		<s:if test='"updateActPlan".equalsIgnoreCase(command)'>
			<s:hidden key="farm.id" class="uId" />
		</s:if>
		<s:hidden key="command" id="command" />
		<s:hidden id="treeDetailToJson" name="treeDetailToJson" />
		
		 <div class="ferror" id="errorDiv" class=" hide alert alert-danger" >
					<s:actionerror theme="bootstrap" />
					<s:fielderror theme="bootstrap" />
					<div id="validateSoilTexError"
				style="text-align: center; padding: 5px 0 0 0; color: red;"></div>
				<div id="irrigatedLandError"
		style="text-align: left; padding: 5px 0 0 0; color: red;"></div>
	<div id="rainFedlandError"
		style="text-align: left; padding: 5px 0 0 0; color: red;"></div>
				</div> 
		<div id="accordion" class="custom-accordion farm_info" >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#farmInfo" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseOne">
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
																	
																<h3 class="wizard-title"><s:property value="%{getLocaleProperty('info.farm')}" /></h3>
																<div class="wizard-desc">Setup Farm Basic Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="farmInfo" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
				<div class="card-body">

				<div class="row">
                               
                                                <div class="col-md-4">
                                                   <div class="form-group farmName">
					<label for="txt"> <s:property value="%{getLocaleProperty('farm.farmName')}" /><sup style="color: red;">*</sup></label>
						<div class="">
							<s:textfield name="farm.farmName" id="farmName" cssClass="form-control" />
						</div>
					</div>
                                                </div>
                                                
                 <div class="col-md-4">
                                                   	<div class="form-group surveyNo">
						<label for="txt"><s:property value="%{getLocaleProperty('farm.surveyNo')}" /> </label>
						<div class="">
								<s:textfield name="farm.farmDetailedInfo.surveyNumber" id="surveyNo" cssClass="form-control" />
						</div>
					</div>
                                                </div>  
                             
                                           	 <div class="col-md-4">
                       <div class="form-group plantArea">
								<label for="txt"> <s:property value="%{getLocaleProperty('farm.proposedPlantingArea')}" /> (<s:property value="%{getAreaType()}" />) 
								<sup style="color: red;">*</sup></label>
							
						<div class="">
							<s:textfield name="farm.farmDetailedInfo.proposedPlantingArea"
								id="plantingArea" cssClass="form-control" 
								maxlength="12" onchange="calculatePlantHect();"
								onkeypress="return isDecimal(event)" />
						</div>
					</div>
            </div>     
                                  
                                                
                                                
                   			 </div>	

				<div class="row">
			
				 <div class="col-md-4">
                       <div class="form-group landOwned">
					<label for="txt">
								<s:property value="%{getLocaleProperty('farm.landOwned')}" />
								<sup style="color: red;">*</sup>
							
							</label>
						<div class="">
							<s:select list="farmOwnedList" headerKey="-1"
									headerValue="%{getText('txt.select')}" listKey="key"
									listValue="value" cssClass="form-control"
									name="selectedFarmOwned" theme="simple" id="farmOwned"
									onchange="showFarmOther(this.value)" />
						</div>
					</div>
            </div>
				 <div class="col-md-4">
                       <div class="form-group landGradient">
						<label for="txt">  
							<s:property value="%{getLocaleProperty('farm.landGradient')}" />
						</label>
						<div class="">
							<s:select name="selectedGradient" list="landGradientList"
								listKey="key" listValue="value"  id="land"
								cssClass="form-control select2" multiple="true" />
						</div>
					</div>
            </div>
             <div class="col-md-4">
                       <div class="form-group farmAddress">
						<label for="txt"> <s:property
								value="%{getLocaleProperty('farm.farmAddress')}" />
						</label>
						<div class="">
							<s:textarea id="addressTxt"
								name="farm.farmDetailedInfo.farmAddress"
								cssClass="form-control" cssStyle="height:50px"/>
						</div>
					</div>
            </div>
				</div>
				
				<div class="row">
			
				 <div class="col-md-4">
                       <div class="form-group appRoad">
					<label for="txt"><s:property
								value="%{getLocaleProperty('farm.appRoad')}" /> </label>
						<div class="">
							<s:select name="selectedRoad" list="approadList" listKey="key"
								listValue="value" id="appRoad"
								cssClass="form-control select2" multiple="true" />
						</div>
					</div>
            </div>
				 <div class="col-md-4">
                       <div class="form-group topo">
						<label for="txt"><s:property
								value="%{getLocaleProperty('farm.topo')}" /> </label>
						<div class="">
							<s:select list="topologyList" listKey="key" listValue="value"
								cssClass="form-control" headerKey="-1"
								headerValue="%{getText('txt.select')}" name="farm.landTopology"
								id="landTopo" />
						</div>
					</div>
            </div>
            <!--  <div class="col-md-4 ">
                       <div class="form-group farmAddress">
						<label for="txt"><s:property
								value="%{getLocaleProperty('organicStatus')}" /> </label>
						<div class="">
							<s:textfield id="organicStatus"
								name="farm.farmIcsConv.organicStatus" cssClass="form-control" />
						</div>
					</div>
            </div> -->
				
				<!--  <div class="row">  -->
			
				 <div class="col-md-4">
                       <div class="form-group totalLand">
					<label for="txt">
								<s:property	value="%{getLocaleProperty('farm.totalLand')}" />(<s:property	value="%{getAreaType()}" />)
								<sup style="color: red;">*</sup>
							</label>
						<div class="">
							<s:textfield name="farm.farmDetailedInfo.totalLandHolding"
										id="totalLand" cssClass="form-control" 
										maxlength="12" onchange="calculateLandHect();"
										onkeypress="return isDecimal(event)" />
						</div>
					</div>
            </div>
           <!--  </div> -->
           
           </div>

</div></div></div>
		
<div id="accordion" class="custom-accordion soil_Irrigation_Info" >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#soil_Irrigation_Info" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseTwo">
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
																	
																<h3 class="wizard-title"><s:property value="%{getLocaleProperty('info.soil')}" /></h3>
																<div class="wizard-desc">Setup Soil and Irrigation Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="soil_Irrigation_Info" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
				<div class="card-body">
			
				<div class="row">
                               
                                                <div class="col-md-4">
                                                   <div class="form-group soilType">
					<label for="txt"> <s:property
								value="%{getLocaleProperty('farm.soilType')}" />
						</label>
						<div class="">
							<s:select name="selectedSoilType" list="soilTypeList"
								listKey="key" listValue="value"  id="soilType"
								cssClass="form-control input-sm select2" multiple="true"  />
						</div>
					</div>
                                                </div>
                                                
                 <div class="col-md-4">
                                                   	<div class="form-group soilTexture">
						<label for="txt">
						<s:property
								value="%{getLocaleProperty('farm.soilTexture')}" />
						</label>
						<div class="">
								<s:select name="selectedTexture" list="soilTextureList"
								listKey="key" listValue="value" id="texture"
								cssClass="form-control input-sm select2" multiple="true" />
						</div>
					</div>
                                                </div>  
                             
                                           	 <div class="col-md-4">
                       <div class="form-group soilFertilityStatus">
								<label for="txt">
						<s:property value="%{getLocaleProperty('farm.soilFertilityStatus')}" />
						</label>
							
						<div class="">
							<s:select name="selectedSoilFertility" list="soilFertilityList"
								headerKey="-1" headerValue="%{getText('txt.select')}"
								listKey="key" listValue="value" 
								id="soilFertility" class="form-control " />
						</div>
					</div>
            </div>     
                                  
                                                
                                                
                   			 </div>	

				<div class="row">
			
				 <div class="col-md-4">
                       <div class="form-group farmIrrigationSource">
					<label for="txt"><%-- <s:text name="farm.farmIrrigationSource" /> --%>
						<s:property value="%{getLocaleProperty('farm.farmIrrigationSource')}" />
						</label>
						<div class="">
							<s:select name="selectedIrrigation" list="farmIrrigationList"
								listKey="key" listValue="value" 
								id="farmIrrigation" cssClass="form-control select2"
								multiple="true" onchange="selectedIrrigationValue(this.value);" />
						</div>
					</div>
            </div>
				 <div class="col-md-4" id="farmIrrigationType">
                       <div class="form-group farmIrrigationType">
						<label for="txt"> <s:property
								value="%{getLocaleProperty('farm.farmIrrigationType')}" />
						</label>
						<div class="">
							<s:select name="selectedIrrigationSource"
								list="irrigationSourceList" headerKey="-1" headerValue="Select"
								listKey="key" listValue="value" id="irrigationSource"
								onchange="irrigationOtherValue(this.value);"
								cssClass="form-control" />
						</div>
					</div>
            </div>
             <div class="col-md-4">
                       <div class="form-group methodOfIrrigation">
						<label for="txt"><s:text name="farm.methodOfIrrigation" />
						</label>
						<div class="">
							<s:select name="selectedMethodOfIrrigation"
								list="methodOfIrrigationList" listKey="key" listValue="value"
								id="methodIrrigation"
								cssClass="form-control select2" multiple="true" />
						</div>
					</div>
            </div>
				</div>
	
	

</div></div></div>
		
<div id="accordion" class="custom-accordion conversion_Info" >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#conversion_Info" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseThree">
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
																	
																<h3 class="wizard-title"><s:property value="%{getLocaleProperty('info.conversion')}" /></h3>
																<div class="wizard-desc">Setup Conversion Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="conversion_Info" class="collapse show" aria-labelledby="headingThree" data-parent="#accordion">
				<div class="card-body">
			
				<div class="row">
                               
                                                <div class="col-md-4">
                                                   <div class="form-group lastDateofChemicalApply">
					<label for="txt"><s:property value="%{getLocaleProperty('farm.lastDateofChemicalApply')}" /> </label>
						<div class="">
							<s:textfield data-date-format="mm/yyyy"
									data-date-viewmode="months"
									cssClass="date-picker form-control" id="calendarDOC"
									name="farm.farmDetailedInfo.lastDateOfChemicalApplication"
									size="23" readonly="true" />
						</div>
					</div>
                                                </div>
                                                
                 <div class="col-md-4">
                                                   	<div class="form-group conventionalLands">
						<label for="txt"> <s:property
									value="%{getLocaleProperty('farm.conventionalLands')}" />
							</label>
						<div class="">
								<s:textfield name="farm.farmDetailedInfo.conventionalLand"
									 id="conventionalLand" maxlength="12"
									cssClass="form-control " />
						</div>
					</div>
                                                </div>  
                             
                                           	 <div class="col-md-4">
                       <div class="form-group fallowLand">
								<label for="txt"> <s:property
									value="%{getLocaleProperty('farm.fallowLand')}" />
							</label>
							
						<div class="">
							<s:textfield name="farm.farmDetailedInfo.fallowOrPastureLand"
									id="pastureLand" maxlength="12"
									cssClass="form-control " />
						</div>
					</div>
            </div>     
                                  
                                                
                                                
                   			 </div>	

				<div class="row">
			
				 <div class="col-md-4">
                       <div class="form-group conventionalCrops">
					<label for="txt"> <s:property
									value="%{getLocaleProperty('farm.conventionalCrops')}" />
							</label>
						<div class="">
							<s:textfield name="farm.farmDetailedInfo.conventionalCrops"
									id="conventionalCrops" maxlength="12"
									cssClass="form-control " />
						</div>
					</div>
            </div>
				 <div class="col-md-4" >
                       <div class="form-group conventionalEstimatedYields">
						<label for="txt"> <s:property
									value="%{getLocaleProperty('farm.conventionalEstimatedYields')}" />
							</label>
						<div class="">
							<s:textfield
									name="farm.farmDetailedInfo.conventionalEstimatedYield"
									id="estimatedYield" maxlength="12"
									cssClass="form-control " />
						</div>
					</div>
            </div>
         
				</div>
				
				
	

</div></div></div>
	
	<div id="accordion" class="custom-accordion field_History_Info" >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#field_History_Info" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseFour">
                                                    <div class="card-header" id="headingFour">
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
																	
																<h3 class="wizard-title"><s:property value="%{getLocaleProperty('Fiel History Details')}" /></h3>
																<div class="wizard-desc">Setup Field History Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="field_History_Info" class="collapse show" aria-labelledby="headingFour" data-parent="#accordion">
				<div class="card-body">
			
				<div class="row">
                               
                                                <div class="col-md-4">
                                                   <div class="form-group fieldName">
					<label for="txt"> <s:property
									value="%{getLocaleProperty('farm.fieldName')}" />
							</label>
						<div class="">
							<s:textfield name="farm.farmDetailedInfo.fieldName"
									id="fieldName" maxlength="45"
									cssClass="form-control "
									onkeypress="return isAlpahaNumeric(event)" />
						</div>
					</div>
                                                </div>
                                                
                 <div class="col-md-4">
                                                   	<div class="form-group fieldCrop">
						<label for="txt"> <s:property
									value="%{getLocaleProperty('farm.fieldCrop')}" />
							</label>
						<div class="">
								<s:textfield name="farm.farmDetailedInfo.fieldCrop"
									id="fieldCrop" maxlength="12"
									cssClass="form-control "
									onkeypress="return isAlpahaNumeric(event)" />
						</div>
					</div>
                                                </div>  
                             
                                           	 <div class="col-md-4">
                       <div class="form-group fieldArea">
								<label for="txt"> <s:property
									value="%{getLocaleProperty('farm.area')}" />
							</label>
							
						<div class="">
							<s:textfield name="farm.farmDetailedInfo.fieldArea"
									id="fieldArea" maxlength="12"
									cssClass="form-control" onkeypress="return isDecimal(event)" />
						</div>
					</div>
            </div>     
                                  
                                                
                                                
                   			 </div>	

				<div class="row">
			
				 <div class="col-md-4">
                       <div class="form-group inputApplied">
					<label for="txt"> <s:property
									value="%{getLocaleProperty('farm.inputApplied')}" />
							</label>
						<div class="">
							<s:textfield name="farm.farmDetailedInfo.inputApplied"
									id="inputApplied" maxlength="150"
									cssClass="form-control "
									onkeypress="return isAlpahaNumeric(event)" />
						</div>
					</div>
            </div>
				 <div class="col-md-4" >
                       <div class="form-group quantityApplied">
						<label for="txt"> <s:property
									value="%{getLocaleProperty('farm.quantity')}" />
							</label>
						<div class="">
							<s:textfield name="farm.farmDetailedInfo.quantityApplied"
									id="quantity" maxlength="12"
									cssClass="form-control " onkeypress="return isDecimal(event)" />
						</div>
					</div>
            </div>
            
            	 <div class="col-md-4" >
                       <div class="form-group lastDateOfChemicalString">
						<label for="txt"><s:property
									value="%{getLocaleProperty('farm.lastDateofChemicalApply')}" /></label>
						<div class="">
							<s:textfield
									name="farm.farmDetailedInfo.lastDateOfChemicalString"
									id="calendarLastDateChemical" readonly="true" 
									cssClass="date-picker form-control" />
						</div>
					</div>
            </div>
         
				</div>
				
				
	

</div></div></div>
		
	<div id="accordion" class="custom-accordion farmICS_info" >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#farmICS_info" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseFive">
                                                    <div class="card-header" id="headingFive">
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
																	
																<h3 class="wizard-title"><s:property value="%{getLocaleProperty('info.ics')}" /></h3>
																<div class="wizard-desc">Setup Land ICS Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="farmICS_info" class="collapse show" aria-labelledby="headingFive" data-parent="#accordion">
				<div class="card-body">
			
				<div class="row">
                               
                                                <div class="col-md-4">
                                                   <div class="form-group certType">
					<label for="txt"> <s:property value="%{getLocaleProperty('certType')}" /><sup style="color: red;">*</sup>
							</label>
						<div class="">
							<s:select cssClass="form-control" id="certType"
												name="farm.farmIcsConv.scope" list="certList" headerKey=""
												headerValue="%{getText('txt.select')}" />
						</div>
					</div>
                                                </div>
                                                
                 <div class="col-md-4">
                                                   	<div class="form-group conversionStatus">
						<label for="txt"><s:text name="%{getLocaleProperty('conversionStatus')}" /><sup
											style="color: red;">*</sup>
							</label>
						<div class="">
								<s:select cssClass="form-control " id="icsType"
												name="farm.farmIcsConv.icsType" list="icsStatusList"
												headerKey="" headerValue="%{getText('txt.select')}" />
						</div>
					</div>
                                                </div>  
                             
                                           	 <div class="col-md-4">
                       <div class="form-group inspectionDate">
								<label for="txt"> <s:text name="inspectionDate" /> 
							</label>
							
						<div class="">
							<s:textfield name="farm.farmIcsConv.inspectionDateString"
											id="calendarInsp" cssClass="form-control" readonly="true" />
						</div>
					</div>
            </div>     
                                  
                                                
                                                
                   			 </div>	

				<div class="row">
			
				 <div class="col-md-4">
                       <div class="form-group nameOfInspector">
					<label for="txt"> <s:text name="nameOfInspector" />
							</label>
						<div class="">
						<s:textfield name="farm.farmIcsConv.inspectorName" cssClass="form-control " />
						</div>
					</div>
            </div>
				 <div class="col-md-4" >
                       <div class="form-group qualified">
						<label for="txt"> <s:text name="%{getLocaleProperty('qualified')}" />
							</label>
						<div class="">
							<s:radio id="sTesing" list="qualifiedTestMap"
											name="farm.farmIcsConv.qualified" listKey="key"
											onchange="setQualified(this.value)" listValue="value"/>
						</div>
					</div>
            </div>
            
            	 <div class="col-md-4 qualNo hide" >
                       <div class="form-group sanctionReason">
						<label for="txt"><s:text name="sanctionReason" /></label>
						<div class="">
							<s:textfield name="farm.farmIcsConv.sanctionreason"
											cssClass="form-control " />
						</div>
					</div>
            </div>
         
				</div>
				
				<div class="row">
			
				 <div class="col-md-4 qualNo hide">
                       <div class="form-group durationOfSanction">
					<label for="txt"> <s:text name="durationOfSanction" />
							</label>
						<div class="">
						<s:textfield name="farm.farmIcsConv.sanctionDuration"
											cssClass="form-control " />
						</div>
					</div>
            </div></div>
	

</div></div></div>
		
		
		<div id="accordion" class="custom-accordion gps_Info" >
			<div class="card-header card mb-1 shadow-none">
			 <a href="#gps_Info" class="text-dark" data-toggle="collapse" aria-expanded="true"  aria-controls="collapseSix">
                                                    <div class="card-header" id="headingSix">
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
																	
																<h3 class="wizard-title"><s:property value="%{getLocaleProperty('gps.prop')}" /></h3>
																<div class="wizard-desc">Setup GPS Information Details</div>
															</div>
														</div>   
                                                            <i class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
                                                        </h6>
                                                    </div>
                                                </a>
			
			</div>

			<div id="gps_Info" class="collapse show" aria-labelledby="headingSix" data-parent="#accordion">
				<div class="card-body">
			
				<div class="row">
                               
                                                <div class="col-md-4">
                                                   <div class="form-group latitude">
					<label for="txt"><s:text name="farm.latitude" />
							</label>
						<div class="">
							<s:textfield name="farm.latitude" maxlength="20" cssClass="form-control " />
						</div>
					</div>
                                                </div>
                                                
                 <div class="col-md-4">
                                                   	<div class="form-group longitude">
						<label for="txt"><s:text name="farm.longitude" />
							</label>
						<div class="">
								<s:textfield name="farm.longitude" maxlength="20" cssClass="form-control " />
						</div>
					</div>
                                                </div>  
                             
                                           	 <div class="col-md-4">
                       <div class="form-group landmark">
								<label for="txt"> <s:property value="%{getLocaleProperty('farm.landmark')}" />
							</label>
							
						<div class="">
							<s:textfield name="farm.landmark" maxlength="100" cssClass="form-control " />
						</div>
					</div>
            </div>     
                                  
                                                
                                                
                   			 </div>	


	

</div></div></div>
		
		

	
	
		<div class="clear"></div>
		<div class="dynamicFieldsRender"></div>


		<div class="button-items float-right">
		
		  <s:if test="command =='create'">
                                            <button type="submit" id="buttonAdd1" onclick="event.preventDefault();onSubmit();"class="btn btn-success waves-effect waves-light">
                                                <i class="ri-check-line align-middle mr-2"></i> Save
                                            </button></s:if>
                                            <s:else>
                                            <button type="submit" id="buttonUpdate" onclick="event.preventDefault();onSubmit();" class="btn btn-primary waves-effect waves-light">
                                                <i class="ri-error-warning-line align-middle mr-2"></i> Update
                                            </button></s:else>
                                            <button type="button" onclick="onCancel();" class="btn btn-danger waves-effect waves-light">
                                                <i class="ri-close-line align-middle mr-2"></i> Cancel
                                            </button>
		
		</div>


	</s:form>



	<s:form name="listForm" id="listForm" action="farmer_detail.action">
		<s:hidden name="farmerId" value="%{farmerId}" />
		<s:hidden name="id" value="%{farmerUniqueId}" />
		<s:hidden name="tabIndexFarmer" />
		<s:hidden name="tabIndex" value="%{tabIndexFarmerZ}" />
		<s:hidden name="currentPage" />
	</s:form>

	<script type="text/javascript">
	$("#calendarDOC").datepicker({
		format : "mm-yyyy",
		startView : "months",
		minViewMode : "months"
	});
	
	$("#calendarFormat").datepicker({
		format : "mm-yyyy",
		startView : "months",
		minViewMode : "months"
	});

	 var test='<s:property value="%{getTestDate()}" />';
	 var tenant='<s:property value="getCurrentTenantId()"/>';
	 var farmerCertified ='<s:property value="farm.farmer.isCertifiedFarmer"/>';
		var farmerId = '<s:property value="farmerId" />';
	 $.fn.datepicker.defaults.format = test.toLowerCase();
        function onCancel() {
            document.listForm.submit();
        }

        function onSubmit() {
            //document.getElementById("dateOfInspection").value = document.getElementById("calendar").value;
        // alert(<s:property value="farm.farmer"/>);
            var error = true;
            var certType=$("#certType").val();
 			var icsType=$("#icsType").val();
 			var farmOwned=$("#farmOwned").val();
 			var treeDetailList=new Array();
 			 var insType=$("#inspType").val();
 			 
 			
 			 
 			
 		
 			
 			
 			if(tenant!='griffith'  && tenant!='susagri' && tenant!='welspun' && tenant!='kenyafpo' && tenant!='farmAgg'){
 				if(isEmpty(farmOwned) || farmOwned==''|| farmOwned=='-1'){
 					jQuery("#irrigatedLandError").html("Please Select LandOwnership");
              		error = false;
 				}	
 				}
 			
        	if(!isEmpty(farmerId)){
        	
        		$.post("farm_detailCheckForCertifiedFarmer", {selectedFarmerId: cerf}, function (data) {
        			if (data=='YES') {
        				<s:if test="currentTenantId!='susagri' && currentTenantId!='welspun' && currentTenantId!='olivado' && currentTenantId!='symrise' && currentTenantId!='griffith' && currentTenantId!='livelihood'&& currentTenantId!='avt'&& currentTenantId!='farmAgg'">
        				<s:if test="currentTenantId!='pratibha'  ">
						 if(isEmpty(certType) || certType==''){          		 
		        	   			jQuery("#irrigatedLandError").html("Please Select Certification Type");
		                  		error = false;
		                  		
		       	   			  }/* else{
			     	   				jQuery("#irrigatedLandError").html("");
		     	   			  } */
						 <s:if test="currentTenantId=='susagri'">
						 if(isEmpty(icsType) || icsType==''){          		 
			      	   			jQuery("#irrigatedLandError").html("Please Select Certification Status");
			                		error = false;
			                		
			     	   			  }
						 if(isEmpty(insType) || insType==''){          		 
			      	   			jQuery("#irrigatedLandError").html("Please Select Inspection");
			                		error = false;
			                		
			     	   			  }
						 </s:if>
						 <s:else> 
						 if(isEmpty(icsType) || icsType==''){          		 
			      	   			jQuery("#irrigatedLandError").html("Please Select Conversion Status");
			                		error = false;
			                		
			     	   			  }
			     	   			  
						 </s:else>
						 </s:if>
						<s:else> 
						 if(isEmpty(icsType) || icsType==''){          		 
			      	   			jQuery("#irrigatedLandError").html("Please Select Conversion Status");
			                		error = false;
			                		
			     	   			  }
						 </s:else>
						 </s:if>
        			}
        			if(error){
        				<s:if test="currentTenantId!='griffith'">
        				//validateImage();
        				</s:if>
                 	   
                 	  var tableBody = jQuery("#treeData");
                 	  //alert("table"+tableBody);
                 	 var len =  tableBody.find('tr').length;
                  	 tableBody.find('tr').each(function (el) {
                  		 
 			         	    var prodStatus = $(this).find("td").eq(5).html();    
 			         	   var cultivar = $(this).find("td").eq(6).html();    
 			         	  var years = $(this).find("td").eq(7).html();    
 			         	 var noOfTrees = $(this).find("td").eq(3).html();    
 			         	 var objfI1=new Object();
 			       		objfI1.prodStatus=prodStatus;
 			       		objfI1.variety=cultivar;
 			       		objfI1.years=years;
 			       		objfI1.noOfTrees=noOfTrees;
 			       		treeDetailList.push(objfI1);

  
          	   
          	});
          	
           			if(len>0){
                   	$('#jsonStr').val(JSON.stringify(treeDetailList));
                	    
                	} 
           	              
                       var sanghamVal = '<s:property value="sangham"/>';
                     
                       var command=$("#command").val();
                       if(command.toLowerCase()=="update"){
                       	
                       var flagUpadet=validateUpdateTable();
                       
                      var flag = validateTableData();
                      if(enableSoil=='1'){
                        	 var isError =validateDocument();
                        	 
                        	if(flag && isError==true && addDynamicField()){
                       		 document.form.submit();
                       		}
                         	  }else{
                      		if(flagUpadet==true&&flag==true && addDynamicField()){
                      		 document.form.submit();
                   		}
                         	  }
                       }else{
                       	var flag= validateTableData();
                       	  if(enableSoil=='1'){
                      	 var isError =validateDocument();
                      	if(flag && isError==true && addDynamicField()){
                     		 document.form.submit();
                     		}
                       	  }
                       	  else{
                       		  if(flag && addDynamicField()){
                              		 document.form.submit();
                              		} 
                       	  }
                      }
                      
                   }
                });
        	}
        }
        function formExpenditure(){
      	 	 var tableFoot=document.getElementById("expenditure");
      		var rows = tableFoot.getElementsByTagName("tr");
      		var expenditureList=[];
      		for(i=1;i<=rows.length;i++){
      			var objExpn=new Object();
      			var expndDtlId="#expndDtl"+i;
      			var expndValId="#expndValue"+i;
      			var expenditureInfoId="#expenditureId"+i;
      			
      			objExpn.name=jQuery(expndDtlId).text();
      			objExpn.value=jQuery(expndValId).text();
      			objExpn.id=jQuery(expenditureInfoId).val();
      			
      			expenditureList.push(objExpn);
      		}
      		var jsonExpndArray=new Object();
      		jsonExpndArray=JSON.stringify(expenditureList);
      		jQuery("#expenditureJson").val(jsonExpndArray); 
      		
      	}
        function formsoilTesting(){
    	 	 var tableFoot=document.getElementById("tblSoilData");
    		var rows = tableFoot.getElementsByTagName("tr");
    		var soilList=[];
    		for(i=1;i<=rows.length;i++){
    			var objfI1=new Object();
    			var sugesstionId="#suggestion"+i;
    			var actionTakenId="#actionTaken"+i;
    			var soilId="#soilTestId"+i;
    			
    			objfI1.officersSuggestion=jQuery(sugesstionId).text();
    			objfI1.takenAction=jQuery(actionTakenId).text();
    			objfI1.id=jQuery(soilId).val();
    			
    			soilList.push(objfI1);
    		}
    		var jsonArray=new Object();
    		jsonArray=JSON.stringify(soilList);
    		jQuery("#soilTestJson").val(jsonArray); 
    		console.log(jsonArray); 
    	}
        
        
        jQuery(function ($) {
        	$("#calendar").datepicker({}); 
        	
         });
        
        function calculateLandHect(){
        	var getValue=$("#totalLand").val();
        	if(getValue==""){
        		$("#landHectValues").empty();
        	}
        	else{
        		var landHecVal = $("#totalLand").val()*0.40468564224;
        		
            	//document.getElementById('landHectValues').innerHTML=landHecVal.toFixed(5);
        	}
        }
        
        function calculateNoOfWineOnPlot(){
        	var getAreaPlot=$("#totalLandd").val();
        	var getEstProductionPlot=$("#distanceProcessingUnit").val();
        	var noOfWineOnPlot =0.00;
        	if(getAreaPlot!="" && getEstProductionPlot!="" ){
        	noOfWineOnPlot = getAreaPlot*getEstProductionPlot/0.01;
        	}
        	document.getElementById('noOfWineOnPlot').innerHTML=noOfWineOnPlot.toFixed(2);
        }
        
        function calculatePlantHect(){
        	if(tenant!='griffith'){
        		var value=$("#plantingArea").val();
            	var getValue=$("#totalLand").val();
            	if(value=="")
            		{
            		$("#plantHectValues").empty();
            		}
            	else if(getValue!="" && value!="" && value>getValue)
            		{
            		document.getElementById('errorDiv').innerHTML="Proposed Planting Area can not be greater than the Total Land Holding";
            		}      		
            	else
            		{
            	//var plantHect = $("#plantingArea").val()*0.40468564224;

            	//document.getElementById('plantHectValues').innerHTML=plantHect.toFixed(5);
            		}
        	}
        	
        }
        
     function showFarmOther(val){
    	if(val==99){
    	 jQuery(".farmOtherDiv").show();
    	 }else{
    		 jQuery(".farmOtherDiv").hide();
    		 $("#farmOther").val('');
    	 }
     }
     
     function setQualified(val){
		if(val=='0'){
     	 jQuery(".qualNo").removeClass('hide');
     	 }else{
     		jQuery(".qualNo").find("input").val("");
        	 jQuery(".qualNo").addClass('hide');
        	 }
      }
     
     function isNumber(evt) {
 		
 	    evt = (evt) ? evt : window.event;
 	    var charCode = (evt.which) ? evt.which : evt.keyCode;
 	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
 	        return false;
 	    }
 	    return true;
 	}
     
     function getBranchIdDyn(){
    		return '<s:property value="branch"/>';
    	}

     function enableFarmPhotoModal(idArr) {
    		try {
    			$("#mbody").empty();
    			var mbody = "";
    			mbody = "";
    			mbody = "<div class='item active'>";
    			mbody += '<img src="farm_populateImage.action?id='
    					+ idArr+'"/>';
    			mbody += "</div>";
    			$("#mbody").append(mbody);
    			
    			document.getElementById("enablePhotoModal").click();
    		} catch (e) {
    			alert(e);
    		}
    	}

    </script>
	
	<s:hidden id="gramPanchayatEnable" name="gramPanchayatEnable"></s:hidden>
</body>
