<%@ include file="/jsp/common/detail-assets.jsp"%>
<%@ include file="/jsp/common/grid-assets.jsp"%>
<head>
<!-- add this meta information to select layout  -->
<meta name="decorator" content="swithlayout">

<style>
.hide {
	display: none;
}

.wizard-wrapper {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
}

.wizard-icon {
	font-size: 2.5rem;
	margin-right: 1.1rem;
	-webkit-transition: color 0.15s ease, background-color 0.15s ease,
		border-color 0.15s ease, -webkit-box-shadow 0.15s ease;
	transition: color 0.15s ease, background-color 0.15s ease, border-color
		0.15s ease, -webkit-box-shadow 0.15s ease;
	transition: color 0.15s ease, background-color 0.15s ease, border-color
		0.15s ease, box-shadow 0.15s ease;
	transition: color 0.15s ease, background-color 0.15s ease, border-color
		0.15s ease, box-shadow 0.15s ease, -webkit-box-shadow 0.15s ease;
}

.wizard-icon .svg-icon svg g [fill] {
	-webkit-transition: fill 0.3s ease;
	transition: fill 0.3s ease;
	fill: #B5B5C3;
}

.wizard-icon .svg-icon svg:hover g [fill] {
	-webkit-transition: fill 0.3s ease;
	transition: fill 0.3s ease;
}

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
	justify-content: center;
}

.wizard-label .wizard-title {
	color: #181C32;
	font-weight: 500;
	font-size: 1.1rem;
}

.wizard-label .wizard-desc {
	color: #7E8299;
}

.collapse-icon-custom {
	margin-top: -35px;
}
</style>

<!-- <script type="text/javascript" src="js/jquery.qrcode.min.js"></script> -->
</head>
<body>
	<script src="js/dynamicComponents.js?v=20.19"></script>
	<script>
		jQuery(document).ready(function(){
			var tenant='<s:property value="getCurrentTenantId()"/>';
			var branchId='<s:property value="getBranchId()"/>';
			var idProofStr = '<s:property value="idProofCatalogueName"/>';
			var farmer_lat = '<s:property value="farmer.latitude" />';
			var farmer_lon = '<s:property value="farmer.longitude" />';
			var type= '<%=request.getParameter("type")%>';
			var id= '<%=request.getParameter("id")%>';
			var gsmaTenantId = "GSMA";
			//alert(type);
		
			if(isEmpty(idProofStr)){
				$("#idProofStr").hide();
			}else{
				$("#idProofStr").show();
			}
			
			if(isEmpty(farmer_lat) || isEmpty(farmer_lon)){
				$("#latlonStr").hide();
			}else{
				$("#latlonStr").show();
			}
			
			 if(type=='2'){
					$(".breadCrumbNavigation").html('');
					$(".breadCrumbNavigation").append("<li><a href='#'>Profile</a></li>");
					//$(".breadCrumbNavigation").append("<li><a href='#'>IRP</a></li>");
					$(".breadCrumbNavigation").append("<li><a href='farmer_list.action?type=2'>IRP</a></li>");
					$(".type").val(type);
					$(".nav").parent().addClass("hide");
					$("#cancelform").prop("action","farmer_list.action?type=2");
				} 
			 
			 hideFields();
				jQuery.post("farmer_populateHideFn.action", {type:type}, function(result) {
					
					var farmerFieldsArray = jQuery.parseJSON(result);
					$.each(farmerFieldsArray, function(index, value) {
						if(index=='activeFields'){
							$(value).each(function(k,v){
								if(v.id=='1'){
									showByEleName(v.name);
								}if(v.id=='2'){
									showByEleId(v.name);
								}if(v.id=='3'){
									showByEleClass(v.name);
								}if(v.id=='4'){
									$("."+v.name).removeClass("hide");
									
								}
							});
						}
						else if(index=='destroyFileds'){
							$(value).each(function(k,v){
								$("."+v.name).remove();
							});
						}
					});
					$(".farmerDynamicField").removeClass("hide");
					
				});
				$(".detailField").show();
				$(".inputField").hide();
			
			
			callGrids();
			populateInsertComponent();
			
		
	    
		<%-- 	$("ul > li").removeClass("active");
			var tabIndex =<%if (request.getParameter("tabIndex") == null) {
				out.print("'#tabs-1'");
			} else {
				out.print("'" + request.getParameter("tabIndex") + "'");
			}%>;
			
		    var tabObj = $('a[href="' + tabIndex + '"]');
		    $(tabObj).closest("li").addClass('active');
		    $("div").removeClass("in active");
		    $(tabIndex).addClass('in active');
			
		    //below code to set tab as 2 when bread crumb value is sent.    
		    var tabSelected = getUrlParameter('tabValue');
		  
		    if (tabSelected == "tabs-2"){
			    $(tabIndex).removeClass("in active");
			    $('#tabs-2').addClass('in active');
			    $(tabObj).closest("li").removeClass('active');
			    tabObj = $('a[href="#tabs-2"]');
			    $(tabObj).closest("li").addClass('active');
		    } --%>
		    renderDynamicDetailFeilds();
		   /*  if(tenant.toUpperCase() === gsmaTenantId){
		    makeQrCode();
		    } */
		    
		    
		    
if('<s:property value="getBranchId()"/>'=='Individual'){
	        	
	    		$(".individual").removeClass("hide");
	    		
	    		jQuery(".nameLab").text("<s:property value="%{getLocaleProperty('farmer.nameInv')}"/>");
	    		jQuery(".adarNo").text("<s:property value="%{getLocaleProperty('adhaarInv')}"/>");
	    		jQuery(".dateName").text("<s:property value="%{getLocaleProperty('farmer.dateOfBirth')}"/>");
	    		jQuery(".telephone").text("<s:property value="%{getLocaleProperty('farmer.mobileno')}"/>");
	    		jQuery(".phNumber").text("<s:property value="%{getLocaleProperty('farmer.phNum')}"/>");
	    		jQuery(".addInfo").text("<s:property value="%{getLocaleProperty('farmer.address')}"/>");
	    		jQuery(".cnName").text("<s:property value="%{getLocaleProperty('country.nameInv')}"/>");	
	    		jQuery(".stName").text("<s:property value="%{getLocaleProperty('stNameInv')}"/>");
	    		jQuery(".locName").text("<s:property value="%{getLocaleProperty('locNameInv')}"/>");
	    		jQuery(".ctName").text("<s:property value="%{getLocaleProperty('ctNameInv')}"/>");
	    		jQuery(".gpName").text("<s:property value="%{getLocaleProperty('gpNameInv')}"/>");
	    		jQuery(".villName").text("<s:property value="%{getLocaleProperty('villNameInv')}"/>");
	    	 	
	    		jQuery(".lifAmt").text("<s:property value="%{getLocaleProperty('farmer.phNum')}"/>");
	    		jQuery(".hltAmt").text("<s:property value="%{getLocaleProperty('farmer.phNum')}"/>");
	    	}
	        
	    if('<s:property value="getBranchId()"/>'=='Corporate'){
	        	
	    	    jQuery(".adarNo").text("<s:property value="%{getLocaleProperty('adhaarCorp')}"/>");
	    		jQuery(".nameLab").text("<s:property value="%{getLocaleProperty('farmer.nameCorp')}"/>");
	    		jQuery(".cnName").text("<s:property value="%{getLocaleProperty('country.nameCorp')}"/>");
	    		jQuery(".dateName").text("<s:property value="%{getLocaleProperty('farmer.dateofcorp')}"/>");
	    		jQuery(".telephone").text("<s:property value="%{getLocaleProperty('farmer.mobilenoCorp')}"/>");
	    		jQuery(".addInfo").text("<s:property value="%{getLocaleProperty('farmer.addressCorp')}"/>");
	    		 jQuery(".stName").text("<s:property value="%{getLocaleProperty('stNameCorp')}"/>");
	    		jQuery(".locName").text("<s:property value="%{getLocaleProperty('locNameCorp')}"/>");
	    		jQuery(".ctName").text("<s:property value="%{getLocaleProperty('ctNameCorp')}"/>");
	    		jQuery(".gpName").text("<s:property value="%{getLocaleProperty('gpNameCorp')}"/>");
	    		jQuery(".villName").text("<s:property value="%{getLocaleProperty('villNameCorp')}"/>");
	    		
	    		jQuery(".lifAmt").text("<s:property value="%{getLocaleProperty('farmer.acresCroped')}"/>");
	    		jQuery(".hltAmt").text("<s:property value="%{getLocaleProperty('farmer.acresCroped')}"/>");
	    		
	    	
	      } 
		    
		    
		    
		    
		});
		
		

		function makeQrCode () {      
		    var elText = '<s:property value="farmer.farmerId" />';		   
		    $('#qrcode').qrcode(elText);
		}
		
		function hideFields(){
			 var app = $(".aPanel");
			 $(app).addClass("hide");
			 $(app).not(".farmerDynamicField").find(".dynamic-flexItem2").each(function(){
			 	 $(this).addClass("hide");
			 });
			  
			}
		
		function getUrlParameter(sParam) {
	        var sPageURL = decodeURIComponent(window.location.search.substring(1));
	       // alert("AAAA" + sPageURL);
	        var sURLVariables = sPageURL.split('&');
	        var sParameterName;
	        var i;
	        for (i = 0; i < sURLVariables.length; i++) {
	        sParameterName = sURLVariables[i].split('=');
	        if (sParameterName[0] === sParam) {
	        return sParameterName[1] === undefined ? true : sParameterName[1];
	        }
	        }
	        }
		
		function callGrids(){
			try{
				loadFarmGrid();
				//loadFamilyDetailGrid();
				loadFarmCropsGrid();
				//loadFarmHistoryGrid();
			//	loadInspectionCheckGrid();
			
			
			}catch(e){
				console.log(e);
			}
		}
		
		function hideByEleName(name){
			$('[name="'+name+'"]').closest( ".dynamic-flexItem2" ).addClass( "hide" );
		}

		function showByEleName(name){
			$('[name="'+name+'"]').closest( ".dynamic-flexItem2" ).removeClass( "hide" );
		}

		function hideByEleClass(className){
			$("."+className).closest( ".dynamic-flexItem2" ).addClass( "hide" );
		}

		function showByEleClass(className){
			$("."+className).closest( ".dynamic-flexItem2" ).removeClass( "hide" );
			$("."+className).parent().removeClass( "hide" );
		}

		function hideByEleId(id){
			$("#"+id).closest( ".dynamic-flexItem2" ).addClass( "hide" );
		}

		function showByEleId(id){
			$("#"+id).closest( ".dynamic-flexItem2" ).removeClass( "hide" );
		}
		
		
		function loadFarmGrid(){

		    jQuery("#detail1").jqGrid(
		    {
		    url:'farm_data.action?farmerId=' + document.getElementById('farmerId').value,
		            pager: '#pagerForDetail1',
		            mtype: 'POST',
		            styleUI : 'Bootstrap',
		            datatype: "json",
		                   colNames:[
									<s:if test="currentTenantId=='awi'">
									'<s:property value="%{getLocaleProperty('farm.farmCode')}" />',
									</s:if>
									<s:else>
									'<s:property value="%{getLocaleProperty('farm.farmCode')}" />',
		                            </s:else>
									'<s:property value="%{getLocaleProperty('farm.farmName')}" />',
		                            //  '<s:text name="farm.regYear"/>',
		                            <s:if test="currentTenantId!='blri' && currentTenantId!='efk' && currentTenantId!='wilmar' && currentTenantId!='olivado' && currentTenantId!='griffith' && currentTenantId!='cofBoard' && currentTenantId!='gsma' && currentTenantId!='ecoagri'  && currentTenantId!='livelihood'&& currentTenantId!='symrise'">
		                            '<s:property value="%{getLocaleProperty('farm.surveyNumber')}"/>',
		                            </s:if>
		                          
		                            <s:if test="currentTenantId=='wilmar'">
		                            '<s:property value="%{getLocaleProperty('nameOfInspector')}"/>',
		                            '<s:property value="%{getLocaleProperty('dateOfInspection')}"/>',
		                            '<s:property value="%{getLocaleProperty('totalCoconutArea')}"/>',
		                            '<s:property value="%{getLocaleProperty('organicStatus')}"/>'
		                            </s:if>
		                            <s:if test="currentTenantId!='efk' && branchId =='organic'">
		                            '<s:property value="%{getLocaleProperty('organicStatus')}"/>',
		                            </s:if>
		                           <s:if test="currentTenantId=='griffith'">
		                            '<s:property value="%{getLocaleProperty('farm.farmDetailedInfo.totalLandHolding')}"/>',
		                            </s:if> 
		                         
		                            <s:if test="currentTenantId=='symrise'">
		                            '<s:property value="%{getLocaleProperty('certificate.level')}"/>'
		                            </s:if>
		                            //'<s:text name="farm.landInProduction"/>',
		                            // '<s:text name="farm.landNotInProduction"/>',
		                            //'<s:text name="farm.hectares"/>',
		                            // '<s:text name="farm.photo"/>'
		                            //'<s:text name="farm.map"/>'<sec:authorize ifAllGranted="profile.farmer.delete">,
		                    // '<s:text name="Action"/>'</sec:authorize>
		                            '<s:property value="%{getLocaleProperty('farm.plottingStatus')}"/>'
		            ],
		            colModel:[
					<s:if test="currentTenantId=='awi'">
						{name:'farmCode', index:'farmCode', width:125, sortable:true},
					</s:if>
					<s:else>
			            {name:'farmCode', index:'farmCode', width:125, sortable:true},
			        </s:else>
			            {name:'farmName', index:'farmName', width:125, sortable:true},
		                    //{name:'fdi.regYear',index:'fdi.regYear',width:125,sortable:true},
		                    <s:if test="currentTenantId!='blri' && currentTenantId!='efk' && currentTenantId!='symrise' && currentTenantId!='wilmar' && currentTenantId!='olivado' && currentTenantId!='griffith' && currentTenantId!='cofBoard' && currentTenantId!='gsma' && currentTenantId!='ecoagri' && currentTenantId!='livelihood'">
		                    {name:'fdi.surveyNumber', index:'fdi.surveyNumber', width:125, sortable:true},
		                    </s:if>
		                   
		                    <s:if test="currentTenantId=='wilmar'">
			                {name:'nameOfInspector', index:'nameOfInspector', width:125, sortable:false, search:false},
			                {name:'dateOfInspection', index:'dateOfInspection', width:125, sortable:false, search:false},
			                {name:'totalCoconutArea', index:'totalCoconutArea', width:175, sortable:false, search:false},
			                {name:'organicStatus', index:'organicStatus', width:125, sortable:false, search:false}
                            </s:if>
		                <s:if test="currentTenantId!='efk' && branchId=='organic' ">
		                {name:'organicStatus', index:'organicStatus', width:125, sortable:false, search:false},
		                </s:if>
		                <s:if test="currentTenantId=='griffith'">
		                {name:'farm.farmDetailedInfo.totalLandHolding', index:'farm.farmDetailedInfo.totalLandHolding', width:125, sortable:true},
		                </s:if>  
		                <s:if test="currentTenantId=='symrise'">
		                {name:'farm.farmDetailedInfo.totalLandHolding', index:'farm.certificateStandardLevel', width:125, sortable:true},
                        </s:if>
		            //{name:'f.firstName',index:'f.firstName',width:125,sortable:true},
		            //{name:'landInProduction',index:'landInProduction',width:125,sortable:true},
		            //{name:'landNotInProduction',index:'landNotInProduction',width:125,sortable:true},
		            //{name:'hectares',index:'hectares',width:125,sortable:true},
		                    //{name:'photo',index:'photo',width:125,sortable:false,search:false,align:'center'}
		                    //{name:'map',index:'map',width:125,sortable:false,search:false,align:'center'}<sec:authorize ifAllGranted="profile.farmer.delete">,
		            //{name:'action',index:'action',width:125,sortable:false,search:false,align:'center'}</sec:authorize>
		                {name:'plottingStatus', index:'plottingStatus', width:125, sortable:false, search:false}
		            ],
		            height: 301,
		            width: 960, // assign parent div width
		            shrinkToFit:true,
		            scrollOffset: 0,
		            rowNum:10,
		            rowList : [10, 25, 50],
		            sortname:'id',
		            sortorder: "desc",
		            viewrecords: true, // for viewing noofrecords displaying string at the right side of the table
		            beforeSelectRow:
		            function(rowid, e) {
		            var iCol = jQuery.jgrid.getCellIndex(e.target);
		            if (iCol >= 4){return false; }
		            else{ return true; }
		            },
		            onSelectRow: function(id){
		            	 document.farmdetailform.id.value = id;
		 	            document.farmdetailform.tabIndex.value = "#tabs-2";
		 	            document.farmdetailform.submit();
		            
		            },
		            onSortCol: function (index, idxcol, sortorder) {
		            if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
		                    && this.p.colModel[this.p.lastsort].sortable !== false) {
		            $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
		            }
		            }
		    });
		    jQuery("#detail1").jqGrid('navGrid', '#pagerForDetail1', {edit:false, add:false, del:false, search:false, refresh:true}) // enabled refresh for reloading grid
		            jQuery("#detail1").jqGrid('filterToolbar', {stringResult: true, searchOnEnter : false}); // enabling filters on top of the header.

		    colModel = jQuery("#detail1").jqGrid('getGridParam', 'colModel');
		    $('#gbox_' + jQuery.jgrid.jqID(jQuery("#detail1")[0].id) +
		            ' tr.ui-jqgrid-labels th.ui-th-column').each(function (i) {
		    var cmi = colModel[i], colName = cmi.name;
		    if (cmi.sortable !== false) {
		    $(this).find('>div.ui-jqgrid-sortable>span.s-ico').show();
		    } else if (!cmi.sortable && colName !== 'rn' && colName !== 'cb' && colName !== 'subgrid') {
		    $(this).find('>div.ui-jqgrid-sortable').css({cursor: 'default'});
		    }
		    });
		  //  windowHeight = windowHeight-100;
		    //$('#detail1').jqGrid('setGridHeight',(windowHeight));
		    }
	function loadFamilyDetailGrid(){
		 jQuery("#familyDetail").jqGrid({
      		url:'farmerFamily_data.action?id='+ document.getElementById('farmerId').value,
              pager: '#familyPagerForDetail',
              mtype: 'POST',
              datatype: "json",
              colNames:[
					'<s:text name="Name"/>',
					'<s:text name="Gender"/>',
					'<s:text name="Age"/>',
					'<s:text name="Relationship"/>',
					'<s:text name="education"/>',
					'<s:text name="Disability"/>',
					'<s:text name="Marital"/>',
					'<s:text name="EducationStatus"/>',
                        ],
	                     colModel:[
								{name:'famly.name', index:'famly.name', width:125, sortable:true},
								{name:'famly.gender', index:'famly.gender', width:125, sortable:true,search:true,stype: 'select',searchoptions: { value: '<s:property value="genderText"/>' }},
								{name:'famly.age', index:'famly.age', width:125, search:true,sortable:true},
								{name:'famly.rel', index:'famly.rel', width:125, search:true,sortable:true,stype: 'select',searchoptions: { value: '<s:property value="relationText"/>' }},
								{name:'famly.edu', index:'famly.edu', width:125, search:true,sortable:true,stype: 'select',searchoptions: { value: '<s:property value="educationText"/>' }},
								{name:'famly.abi', index:'famly.abi', width:125, search:true,sortable:true,stype: 'select',searchoptions: { value: '<s:property value="disText"/>' }},
								{name:'famly.marital', index:'famly.marital', width:125, search:true,sortable:true,stype: 'select',searchoptions: { value: '<s:property value="marStText"/>' }},
								{name:'famly.eduStatus', index:'famly.eduStatus', width:125, search:true, sortable:true,stype: 'select',searchoptions: { value: '<s:property value="educationStatusText"/>' }},
	                               
		 ],
		 height: 301,
         width: $("#baseDiv").width(), // assign parent div width
         scrollOffset: 0,
         rowNum:10,
         rowList : [10, 25, 50],
         sortname:'id',
         sortorder: "desc",
         viewrecords: true, // for viewing noofrecords displaying string at the right side of the table
         beforeSelectRow:
         function(rowid, e) {
         var iCol = jQuery.jgrid.getCellIndex(e.target);
         if (iCol >= 8){return false; }
         else{ return true; }
         },
         onSelectRow: function(id){

        	 document.familydetailform.id.value = id;
	            document.familydetailform.tabIndex.value = "#tabs-6";
	            document.familydetailform.submit();
         },
         onSortCol: function (index, idxcol, sortorder) {
         if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
                 && this.p.colModel[this.p.lastsort].sortable !== false) {
         $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
         }
         }
 });
 jQuery("#familyDetail").jqGrid('navGrid', '#familyPagerForDetail', {edit:false, add:false, del:false, search:false, refresh:true}) // enabled refresh for reloading grid
         jQuery("#familyDetail").jqGrid('filterToolbar', {stringResult: true, searchOnEnter : false}); // enabling filters on top of the header.

 colModel = jQuery("#familyDetail").jqGrid('getGridParam', 'colModel');
 $('#gbox_' + jQuery.jgrid.jqID(jQuery("#detail1")[0].id) +
         ' tr.ui-jqgrid-labels th.ui-th-column').each(function (i) {
 var cmi = colModel[i], colName = cmi.name;
 if (cmi.sortable !== false) {
 $(this).find('>div.ui-jqgrid-sortable>span.s-ico').show();
 } else if (!cmi.sortable && colName !== 'rn' && colName !== 'cb' && colName !== 'subgrid') {
 $(this).find('>div.ui-jqgrid-sortable').css({cursor: 'default'});
 }
 });
 windowHeight = windowHeight-100;
 $('#familyDetail').jqGrid('setGridHeight',(windowHeight));
}
		
		 function loadFarmCropsGrid(){
			 jQuery("#cropDetail").jqGrid({
		             		url:'farmCrops_data.action?id='+ document.getElementById('farmerId').value,
		                     pager: '#cropPagerForDetail',
		                     mtype: 'POST',
		                     styleUI : 'Bootstrap',
		                     datatype: "json",
		                     colNames:[
		                             //'<s:text name="farmcrops.code"/>',
		                             //'<s:text name="farmcrops.name"/>',
		                             '<s:text name="cropName"/>',
		                             '<s:property value="%{getLocaleProperty('variety')}" />',
		                             <s:if test="currentTenantId!='griffith'">
		                             '<s:text name="farmcrops.cropCategory.prop"/>',
		                             </s:if>
		                             '<s:property value="%{getLocaleProperty('farm.farmName')}" />',
		                             <s:if test="currentTenantId=='wilmar'"> 
		                             '<s:property value="%{getLocaleProperty('farmfarmcrops.estimatedYeild')}" />',
		          		  		       '<s:property value="%{getLocaleProperty('cultiAreas')}" />',
		          		  		   </s:if>
		          		  		       '<s:property value="%{getLocaleProperty('farmcrops.cropSeason')}" />',
		          		  	 		  
		                             <s:if test="cropInfoEnabled==1 && currentTenantId!='griffith'">
		          		  		     '<s:property value="%{getLocaleProperty('farmcrops.estimatedYeild')}" />',
		                             </s:if>
		                             <%--<sec:authorize ifAllGranted="profile.farmCrop.delete">,
		'<s:text name="Action"/>'</sec:authorize>--%>
		
		                     ],
		                     colModel:[
		                             //{name:'fcm.code',index:'fcm.code', width:125,sortable:true},
		                                     //{name:'fcm.name',index:'fcm.name', width:125,sortable:true},
		                                     {name:'pc.name', index:'pc.name', width:125, sortable:true},
		                             {name:'pv.name', index:'pv.name', width:125, sortable:true},
		                             <s:if test="currentTenantId!='griffith'">
		                             {name:'type', index:'type', width:125, sortable:false, search:true, stype: 'select', searchoptions: { value: '<s:property value="cropTypeFilter"/>' }},
		                             </s:if>
		                             {name:'farmName', index:'farmName', width:125, sortable:true},
		                             <s:if test="currentTenantId=='wilmar'"> 
		                		   		{name:'farmfarmcrops.estimatedYeild.tonnes',index:'farmfarmcrops.estimatedYeild.tonnes', width:125,sortable:true,search:false},
		                		   		{name:'cultiArea',index:'cultiArea', width:200,sortable:true,search:false},
		                		   		</s:if>
		                		   	 <s:if test="currentTenantId=='wilmar'"> 
		                		      	{name:'farmcrops.cropSeason',index:'farmcrops.cropSeason', width:125,sortable:true,search:true, stype: 'select', searchoptions: { value: '<s:property value="seasonTypeFilter"/>' }},
		                		      	</s:if>
		                		      	<s:else>
		                		      	{name:'farmcrops.cropSeason',index:'farmcrops.cropSeason', width:125,sortable:true,search:true, stype: 'select', search:false},
		                		      	</s:else>
		                		      	
		                             <s:if test="cropInfoEnabled==1 && currentTenantId!='griffith'">
		                             {name:'productionPerYear', index:'productionPerYear', width:125, sortable:true, search:false}
		                             </s:if>
		                             <%--<sec:authorize ifAllGranted="profile.farmCrop.delete">,
		{name:'action',index:'action',width:125,sortable:false,search:false}</sec:authorize>--%>
		                             ],
		                                     height: 301,
		                                     width: 960,
		                                     scrollOffset: 0,
		                                     rowNum:10,
		                                     rowList : [10, 25, 50],
		                                     sortname:'id',
		                                     sortorder: "desc",
		                                     viewrecords: true,
		                                     beforeSelectRow:
		                                     function(rowid, e) {
		                                     var iCol = jQuery.jgrid.getCellIndex(e.target);
		                                     if (iCol >= 7){return false; }
		                                     else{ return true; }
		                                     },
		                                     onSelectRow: function(id){
		                                     document.detailfarmCrops.id.value = id;
		                                     document.detailfarmCrops.submit();
		                                     document.detailfarmCrops.tabIndex.value = tabIndex;
		                                     },
		                                     onSortCol: function (index, idxcol, sortorder) {
		                                     if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
		                                             && this.p.colModel[this.p.lastsort].sortable !== false) {
		                                     $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
		                                     }
		                                     }
		                             });
			  
				                     jQuery("#cropDetail").jqGrid('navGrid', '#cropPagerForDetail', {edit:false, add:false, del:false, search:false, refresh:true}); // enabled refresh for reloading grid
				                     jQuery("#cropDetail").jqGrid('filterToolbar', {stringResult: true, searchOnEnter : false}); // enabling filters on top of the header.
				                    
				                     colModel = jQuery("#cropPagerForDetail").jqGrid('getGridParam', 'colModel');
				                     $('#gbox_' + $.jgrid.jqID(jQuery("#cropDetail")[0].id) +
				                             ' tr.ui-jqgrid-labels th.ui-th-column').each(function (i) {
				                    
				                     });
				                     $('#cropDetail').jqGrid('setGridHeight',(windowHeight));
				                   
		                     }

			function loadFarmHistoryGrid(){

			    jQuery("#farmHistoryDetail").jqGrid(
			    {
			    url:'farmHistory_data.action?id='+ document.getElementById('farmerId').value,
			            pager: '#farmHistoryPagerForDetail',
			            mtype: 'POST',
			            datatype: "json",
			                   colNames:[
										<s:if test="currentTenantId=='awi'">
											'<s:text name="year"/>',
										</s:if>
										<s:else>
			                            	'<s:text name="year"/>',
			                            </s:else>
										'<s:property value="%{getLocaleProperty('crops')}" />',
										
										'<s:property value="%{getLocaleProperty('farmerLandDetails.seedlings')}" />',
										'<s:property value="%{getLocaleProperty('estimatedAcreage')}" />',
										'<s:property value="%{getLocaleProperty('farmerLandDetails.noOfTrees')}" />',
										'<s:property value="%{getLocaleProperty('pestdiseases')}" />',
										'<s:property value="%{getLocaleProperty('pestdiseasesControl')}" />',
     
			            ],
			            colModel:[
						<s:if test="currentTenantId=='awi'">
							{name:'year', index:'year', width:125, sortable:true,search:true},
						</s:if>
						<s:else>
				            {name:'year', index:'year', width:125, sortable:true,search:true},
				        </s:else>
				            {name:'crops', index:'crops', width:125, sortable:true,search:true},
				            {name:'seedlings', index:'seedlings', width:125, sortable:true,search:true},
				            {name:'estimatedAcreage', index:'estimatedAcreage', width:125, sortable:true,search:true},
				            {name:'noOfTrees', index:'noOfTrees', width:125, sortable:true,search:true},
				            {name:'pestdiseases', index:'pestdiseases', width:125, sortable:true,search:true},
				            {name:'pestdiseasesControl', index:'pestdiseasesControl', width:125, sortable:true,search:true}
			                    //{name:'fdi.regYear',index:'fdi.regYear',width:125,sortable:true},
			            ],
			            height: 301,
			            width: $("#baseDiv").width(), // assign parent div width
			            scrollOffset: 0,
			            rowNum:10,
			            rowList : [10, 25, 50],
			            sortname:'id',
			            sortorder: "desc",
			            viewrecords: true, // for viewing noofrecords displaying string at the right side of the table
			            beforeSelectRow:
			            function(rowid, e) {
			            var iCol = jQuery.jgrid.getCellIndex(e.target);
			            if (iCol >= 4){return false; }
			            else{ return true; }
			            },
			            onSelectRow: function(id){
			            	document.farmHistorydetailform.id.value = id;
			 	            document.farmHistorydetailform.tabIndex.value = "#tabs-12";
			 	            document.farmHistorydetailform.submit();
			            
			            },
			            onSortCol: function (index, idxcol, sortorder) {
			            if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
			                    && this.p.colModel[this.p.lastsort].sortable !== false) {
			            $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
			            }
			            }
			    });
			    jQuery("#farmHistoryDetail").jqGrid('navGrid', '#farmHistoryPagerForDetail', {edit:false, add:false, del:false, search:false, refresh:true}) // enabled refresh for reloading grid
			            jQuery("#farmHistoryDetail").jqGrid('filterToolbar', {stringResult: true, searchOnEnter : false}); // enabling filters on top of the header.

			    colModel = jQuery("#farmHistoryDetail").jqGrid('getGridParam', 'colModel');
			    $('#gbox_' + jQuery.jgrid.jqID(jQuery("#farmHistoryDetail")[0].id) +
			            ' tr.ui-jqgrid-labels th.ui-th-column').each(function (i) {
			    var cmi = colModel[i], colName = cmi.name;
			    if (cmi.sortable !== false) {
			    $(this).find('>div.ui-jqgrid-sortable>span.s-ico').show();
			    } else if (!cmi.sortable && colName !== 'rn' && colName !== 'cb' && colName !== 'subgrid') {
			    $(this).find('>div.ui-jqgrid-sortable').css({cursor: 'default'});
			    }
			    });
			    windowHeight = windowHeight-100;
			    $('#farmHistoryDetail').jqGrid('setGridHeight',(windowHeight));
			    }
			function loadFarmCertificationDetailsGrid(){

			    jQuery("#detail15").jqGrid(
			    {
			    url:'certificationDetails_detail.action?farmerId='+document.getElementById('farmerId').value,
			            pager: '#pagerForDetail15',
			            mtype: 'POST',
			            datatype: "json",
			        	colNames:[
					   		'<s:property value="%{getLocaleProperty('Farm Name')}" />',
					   		'<s:property value="%{getLocaleProperty('Season')}" />',
					   		'<s:property value="%{getLocaleProperty('Inspection (Inspection 1 / Inspection 2)')}" />',
					   		'<s:property value="%{getLocaleProperty('Certification Type')}" />',
					   		'<s:property value="%{getLocaleProperty('Certification Status')}" />',
					   		'<s:property value="%{getLocaleProperty('Inspector Name')}" />',
					   		'<s:property value="%{getLocaleProperty('Inspection Date')}" />',
					   		'<s:property value="%{getLocaleProperty('Nc Raised')}" />',
	                      	 ],
			 	      	colModel:[
			 	      		{name:'farmName',index:'farmName',sortable:false,frozen:false},
			 	      		{name:'season',index:'season',sortable:false,frozen:false},
			 	      		{name:'inspType',index:'inspType',sortable:false,frozen:false},
			 	      		{name:'certType',index:'certType',sortable:false,frozen:false},
			 	      		{name:'icStatus',index:'icStatus',sortable:false,frozen:false},
			 	      		{name:'inspName',index:'inspName',sortable:false,frozen:false},
			 	      		{name:'inspDate',index:'inspDate',sortable:false,frozen:false},
			 	      		{name:'ncRaised',index:'ncRaised',sortable:false,frozen:false},
										],
			            height: 301,
			            width: $("#baseDiv").width(), // assign parent div width
			            scrollOffset: 0,
			            rowNum:10,
			            rowList : [10, 25, 50],
			            sortname:'id',
			            sortorder: "desc",
			            viewrecords: true, // for viewing noofrecords displaying string at the right side of the table
			            beforeSelectRow:
			            function(rowid, e) {
			            var iCol = jQuery.jgrid.getCellIndex(e.target);
			            if (iCol >= 4){return false; }
			            else{ return true; }
			            },
			            /* onSelectRow: function(id){
			            	 document.certificationDetailsform.id.value = id;
			 	            document.certificationDetailsform.tabIndex.value = "#tabs-15";
			 	            document.certificationDetailsform.submit();
			            
			            }, */
			            onSortCol: function (index, idxcol, sortorder) {
			            if (this.p.lastsort >= 0 && this.p.lastsort !== idxcol
			                    && this.p.colModel[this.p.lastsort].sortable !== false) {
			            $(this.grid.headers[this.p.lastsort].el).find(">div.ui-jqgrid-sortable>span.s-ico").show();
			            }
			            }
			    });
			    jQuery("#detail15").jqGrid('navGrid', '#pagerForDetail15', {edit:false, add:false, del:false, search:false, refresh:true}) // enabled refresh for reloading grid
			            jQuery("#detail15").jqGrid('filterToolbar', {stringResult: true, searchOnEnter : false}); // enabling filters on top of the header.

			    colModel = jQuery("#detail15").jqGrid('getGridParam', 'colModel');
			    $('#gbox_' + jQuery.jgrid.jqID(jQuery("#detail15")[0].id) +
			            ' tr.ui-jqgrid-labels th.ui-th-column').each(function (i) {
			    var cmi = colModel[i], colName = cmi.name;
			    if (cmi.sortable !== false) {
			    $(this).find('>div.ui-jqgrid-sortable>span.s-ico').show();
			    } else if (!cmi.sortable && colName !== 'rn' && colName !== 'cb' && colName !== 'subgrid') {
			    $(this).find('>div.ui-jqgrid-sortable').css({cursor: 'default'});
			    }
			    });
			  //  windowHeight = windowHeight-100;
			   // $('#detail15').jqGrid('setGridHeight',(windowHeight));
			    }
                     function addfarmCrop()
                     {
                     	document.cropCreateform.submit();
                     }
                     
                     function addfamilyDetail(){
                    	 document.familyDetailCreateform.submit();
                     }
                     function addfarmHistory(){
                    	 document.farmHistoryCreateform.submit();
                     }
                     
                     function populateInsertComponent()
                     {
                     	 jQuery.post("farmer_populateDynamicInsertField.action", {}, function(result) {
                     		 var jsonData = jQuery.parseJSON(result);
                     			
                     		 $(jsonData).each(function(k, v) {
                				 var id = "#"+(v.componentName);
                				 if(!isEmpty(v.afterInsert)){
                					 var insertEle = $('[name="'+v.afterInsert+'"]').parent();
                					 var compo =  jQuery(id).parent();
                					 console.log(compo);
                					 $(compo).insertAfter(insertEle);
                				 }
                				 if(!isEmpty(v.beforeInsert)){
                					 var insertEle = $('[name="'+v.beforeInsert+'"]').parent();
                					 console.log(insertEle);
                					 var compo =  jQuery(id).parent();
                					 console.log(compo);
                					 $(compo).insertBefore(insertEle);
                				 }
                			 });
                     		
                     	  });
                     }
                     
                     function getTxnType(){
                    		//return "308";
                    	 var type= '<%=request.getParameter("type")%>';
                    	 /* if(type=='2'){
                    		 return "3008A";
                    	 } */
                    	return "308";
                    	}
                     
                     function getBranchIdDyn(){
                    		return '<s:property value="farmer.branchId"/>';
                    	}

		
	</script>
	<script>
	var tenant='<s:property value="getCurrentTenantId()"/>';
		$(document).ready(function() {
		
			$('#update').on(
					'click',
					function(e) {
						document.updatfrm.id.value = document.getElementById('farmerId').value;
						document.updatfrm.currentPage.value = document.form.currentPage.value;
						document.updatfrm.submit();
					});
							$('#delete')
									.on(
											'click',
											function(e) {
												if (confirm('<s:text name="confirm.deleteFarmer"/> ')) {
													document.deleteform.id.value = document
															.getElementById('farmerId').value;
													document.deleteform.currentPage.value = document.form.currentPage.value;
													document.deleteform
															.submit();
												}
											});
							$('#approve')
							.on(
									'click',
									function(e) {
										if (confirm('<s:property value="%{getLocaleProperty('confirm.approveFarmer')}" />')) {
											document.approveform.id.value = document
													.getElementById('farmerId').value;
											document.approveform.currentPage.value = document.form.currentPage.value;
											document.approveform
													.submit();
										}
									});
							if(tenant!='olivado')
								{
								//populateDistributionTransactionByFarmerId();
								}
							if(tenant=='olivado')
						    {
						    	jQuery(".ggn").addClass("hide");
						    	jQuery(".farmCode").addClass("hide");
						    	jQuery(".ggnRegNo").addClass("hide");
						    	jQuery(".contactName").removeClass("hide");
						    }
						    else
						    {
						    	jQuery(".farmCode").removeClass("hide");
						    	jQuery(".ggn").addClass("hide");
						    	jQuery(".ggnRegNo").addClass("hide");
						    	jQuery(".contactName").addClass("hide");
						    }
							
						});
		
		
		if(tenant!='pgss')
	     {
	    	 $(".hideDob").show();
	    	 $(".hideAge").hide();
	    	 $(".hideLoanTakenScheme").hide();
	    	 $(".hidePreferenceWrk").hide();
	    	 

	    }
		
		
	     else
	     {
	    	 $(".hideDob").hide();
	    	 $(".hideAge").show();
	    	 $(".hideLoanTakenScheme").show();
	    	 $(".hideLoanTakenScheme").removeClass("hide");
	    	 $(".hidePreferenceWrk").show();

	     }
		
		if(tenant=='chetna')
	     {
	    	 $(".familyDet").show();
	    	
	    	 

	    }
	
		
		


		function enableFarmerPhotoModal(idArr) {
			try {
				$("#mbody").empty();
				var mbody = "";
				mbody = "";
				mbody = "<div class='item active'>";
				mbody += '<img src="farmer_populateImage.action?id='
						+ idArr + '&type=2"/>';
				mbody += "</div>";
				$("#mbody").append(mbody);
				
				document.getElementById("enablePhotoModal").click();
			} catch (e) {
				alert(e);
			}
		}
		/* 	var isDisabled="<s:property value='farmer.isDisable'/>"
			if(isDisabled=="0"){
				$(".irpFormHide").hide();
				$(".S02").hide();
				resetAssesment();
			}else if(isDisabled=="1"){
				$(".irpFormHide").show();
				$(".S02").show();
			} */
	
	    

			
			function populateDistributionTransactionByFarmerId(){
				jQuery.post("farmer_distributionToFarmerByFarmerId.action", {id:document.getElementById('farmerId').value}, function(distribution) {
					var distributionData = $.parseJSON(distribution);
					var table = $("<table/>").addClass("table table-bordered ").attr({
								id : "distribution"
					});
					var thead = $("<thead/>");
					var tr = $("<tr/>");
					tr.append($("<th/>").append("Date"));
					tr.append($("<th/>").append("Warehouse"));
					tr.append($("<th/>").append("Mobile User"));
					tr.append($("<th/>").append("Category"));
					tr.append($("<th/>").append("Product"));
					tr.append($("<th/>").append("Season"));
					tr.append($("<th/>").append("Unit"));
					//tr.append($("<th/>").append("Is free distribution"));
					tr.append($("<th/>").append("Total Quantity"));
					tr.append($("<th/>").append("Gross Amount"));
					tr.append($("<th/>").append("Tax"));
					tr.append($("<th/>").append("Final Amount"));
					tr.append($("<th/>").append("Payment Amount"));
					
				    
					
				
					 
				 
					thead.append(tr);
					table.append(thead);
					
					var tbody = $("<tbody/>");
						$.each(distributionData, function(index, value) {
							var tr2 = $("<tr/>");
							tr2.append($("<td/>").append(value.TXN_TIME));
							tr2.append($("<td/>").append(value.SERVICE_POINT_NAME));
							tr2.append($("<td/>").append(value.AGENT_NAME));
							tr2.append($("<td/>").append(value.category));
							tr2.append($("<td/>").append(value.productName));
							tr2.append($("<td/>").append(value.season));
							tr2.append($("<td/>").append(value.unit));
							//tr2.append($("<td/>").append(value.IS_FREE_DISTRIBUTION));
							tr2.append($("<td/>").append(value.QUANTITY));
							tr2.append($("<td/>").append(value.TOTAL_AMOUNT));
							tr2.append($("<td/>").append(value.tax));
							tr2.append($("<td/>").append(value.FINAL_AMOUNT));
							tr2.append($("<td/>").append(value.PAYMENT_AMT));
							tbody.append(tr2);
						});
					table.append(tbody);
				
					
					var wrappedDiv = $('<div/>').attr({
						id : "distribution_mainDiv",
						class :"appContentWrapper marginBottom"
					});
					
					var headerDiv =  $("<div/>").addClass("formContainerWrapper");
					headerDiv.append("<h2>Distribution Transaction <div class='pull-right'><a class='aCollapse'><i class='fa fa-chevron-right' onclick=$('#distribution').parent().slideToggle(1000);$('#exportButtons_distribution').toggle(1000);$('#filterDiv_distribution').toggle(1000);></i></a></div> </h2>");
					headerDiv.append("<div id='exportButtons_distribution' style='float:right;'></div>");
					wrappedDiv.append(headerDiv);
					
					var startDateBox = $('<input/>').attr({
						type : 'text',
						class : 'input-sm',
						id : "startDateBox_distribution",
						readonly : 'readonly',
						'data-date-format' : "dd-mm-yyyy",
						placeholder : "Start date",
					});
					
					var endDateBox = $('<input/>').attr({
						type : 'text',
						class : 'input-sm',
						id : "endDateBox_distribution",
						readonly : 'readonly',
						'data-date-format' : "dd-mm-yyyy",
						placeholder : "End date",
						style : 'margin-left:1%'
					});
					
					var seasonBox = $('<select/>').attr({
						class : "seasonFilter select2",
						id : "season_distribution",
						//style : 'margin-left:1%'
						style : 'float:right'
					});
				
					var filterDiv = $("<div id='filterDiv_distribution'/>");
					filterDiv.append(startDateBox);
					filterDiv.append(endDateBox);
					filterDiv.append(seasonBox);
					filterDiv.append('<button style="margin-left:1%;" type="button" id="submitBtn_distribution" class="btn btn-success btn-sm" >Search <i class="glyphicon glyphicon-search" aria-hidden="true"></i></button>');
					filterDiv.append('<button style="margin-left:1%;" type="button" id="clearBtn_distribution" class="btn btn-warning btn-sm" >Clear <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></button>');
					wrappedDiv.append(filterDiv);
					wrappedDiv.append(table);
					$("#tabs-11").append(wrappedDiv);
					
					if(distributionData != ''){
						
						 var table = $('#distribution').DataTable();
					     var buttons = new $.fn.dataTable.Buttons(table, {
					    	  buttons: [
						                 {
						                     extend: 'excel',
						                     title: 'Distribution Report ( '+'<s:property value="farmer.firstName"/>'+' )',
						                     messageTop: '',
						                     messageBottom: '',
						                   
						                 },
						                 {
						                     extend: 'pdf',
						                     title: 'Distribution Report  ( '+'<s:property value="farmer.firstName"/>'+' )',
						                     messageTop: '',
						                     messageBottom: '',
						                     
						                 }
						             ]
					   }).container().appendTo($('#exportButtons_distribution'));
					     
					}else{
						$('#distribution').DataTable();
					} 
					     
					     
					     
					     $("#startDateBox_distribution" ).datepicker({
						 		dateFormat : "dd-mm-yy",
						 		changeMonth : true,
						 		changeYear : true
						 	}); 
						   
					     $("#endDateBox_distribution" ).datepicker({
						 		dateFormat : "dd-mm-yy",
						 		changeMonth : true,
						 		changeYear : true
						 	});
					     
						      
						    $("#submitBtn_distribution").attr("onclick", "datefilterForDataTable('distribution','distributionToFarmerByFarmerId')");
						    $("#clearBtn_distribution").attr("onclick", "clearFilters('distribution','distributionToFarmerByFarmerId')");  
						  
						 $("#distribution").addClass("dataTableTheme");
						    
						    
					populateCropHarvestTransactionByFarmerId();
					
				});
			}
			
		
			
	  function populateCropHarvestTransactionByFarmerId(){
				
				jQuery.post("farmer_cropHarvestByFarmerId.action", {id:document.getElementById('farmerId').value}, function(cropHarvest) {
					var cropHarvestData = $.parseJSON(cropHarvest);
					var table = $("<table/>").addClass("table table-bordered").attr({
								id : "cropHarvest"
					});
					var thead = $("<thead/>");
					var tr = $("<tr/>");
					tr.append($("<th/>").append("Date"));
					tr.append($("<th/>").append("Farm"));
					tr.append($("<th/>").append("Mobile user"));
					tr.append($("<th/>").append("Product"));
					tr.append($("<th/>").append("Season"));
					tr.append($("<th/>").append("Variety"));
					tr.append($("<th/>").append("Grade"));
					tr.append($("<th/>").append("Total Yield Quantity"));
					tr.append($("<th/>").append("Unit"));
					table.append(thead);
					thead.append(tr);
					var tbody = $("<tbody/>");
						$.each(cropHarvestData, function(index, value) {
							var tr2 = $("<tr/>");
							tr2.append($("<td/>").append(value.HARVEST_DATE));
							tr2.append($("<td/>").append(value.FARM_NAME));
							tr2.append($("<td/>").append(value.agentName));
							tr2.append($("<td/>").append(value.ProductName));
							tr2.append($("<td/>").append(value.season));
							tr2.append($("<td/>").append(value.Variety));
							tr2.append($("<td/>").append(value.Grade));
							tr2.append($("<td/>").append(value.Quantity));
							tr2.append($("<td/>").append(value.UNIT));
							tbody.append(tr2);
						});
					table.append(tbody);
					var wrappedDiv = $("<div/>").addClass("appContentWrapper marginBottom");
					var headerDiv =  $("<div/>").addClass("formContainerWrapper");
					headerDiv.append("<h2>Crop Harvest Transaction  <div class='pull-right'><a class='aCollapse'><i class='fa fa-chevron-right' onclick=$('#cropHarvest').parent().slideToggle(1000);$('#exportButtons_cropHarvest').toggle(1000);$('#filterDiv_cropHarvest').toggle(1000);></i></a></div>  </h2>");
					headerDiv.append("<div id='exportButtons_cropHarvest' style='float:right;'></div>");
					wrappedDiv.append(headerDiv);
					
					var startDateBox = $('<input/>').attr({
						type : 'text',
						id : "startDateBox_cropHarvest",
						readonly : 'readonly',
						'data-date-format' : "dd-mm-yyyy",
						placeholder : "Start date",
					});
					
					var endDateBox = $('<input/>').attr({
						type : 'text',
						id : "endDateBox_cropHarvest",
						readonly : 'readonly',
						'data-date-format' : "dd-mm-yyyy",
						placeholder : "End date",
						style : 'margin-left:1%'
					});
					
					var seasonBox = $('<select/>').attr({
						class : "seasonFilter select2",
						id : "season_cropHarvest",
						style : 'margin-left:1%'
					});
					
					var filterDiv = $("<div id='filterDiv_cropHarvest'/>");
					filterDiv.append(startDateBox);
					filterDiv.append(endDateBox);
					filterDiv.append(seasonBox);
					filterDiv.append('<button style="margin-left:1%;" type="button" id="submitBtn_cropHarvest" class="btn btn-success btn-sm" >Search <i class="glyphicon glyphicon-search" aria-hidden="true"></i></button>');
					filterDiv.append('<button style="margin-left:1%;" type="button" id="clearBtn_cropHarvest" class="btn btn-warning btn-sm" >Clear <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></button>');
					wrappedDiv.append(filterDiv);
					
					wrappedDiv.append(table);
					$("#tabs-11").append(wrappedDiv);
					
					if(cropHarvestData != ''){
						var table = $('#cropHarvest').DataTable();
					    var buttons = new $.fn.dataTable.Buttons(table, {
					    	  buttons: [
						                 {
						                     extend: 'excel',
						                     title: 'Crop Harvest Report ( '+'<s:property value="farmer.firstName"/>'+' )',
						                     messageTop: '',
						                     messageBottom: '',
						                     
						                 },
						                 {
						                     extend: 'pdf',
						                     title: 'Crop Harvest Report ( '+'<s:property value="farmer.firstName"/>'+' )',
						                     messageTop: '',
						                     messageBottom: '',
						                    
						                 }
						             ]
					   }).container().appendTo($('#exportButtons_cropHarvest'));
					}else{
						$('#cropHarvest').DataTable();
					}
					
					 	
					   
					    $("#startDateBox_cropHarvest" ).datepicker({
					 		dateFormat : "dd-mm-yy",
					 		changeMonth : true,
					 		changeYear : true
					 	}); 
					   
				     $("#endDateBox_cropHarvest" ).datepicker({
					 		dateFormat : "dd-mm-yy",
					 		changeMonth : true,
					 		changeYear : true
					 	});
					     
				     $("#submitBtn_cropHarvest").attr("onclick", "datefilterForDataTable('cropHarvest','cropHarvestByFarmerId')");
					 $("#clearBtn_cropHarvest").attr("onclick", "clearFilters('cropHarvest','cropHarvestByFarmerId')"); 
					 
					 $("#cropHarvest").addClass("dataTableTheme");
					 populateProductReturnTransactionByFarmerId();
				});
			}
			
		function populateProductReturnTransactionByFarmerId(){
			jQuery.post("farmer_productReturnByFarmerId.action", {id:document.getElementById('farmerId').value}, function(productReturn) {
				var productReturnData = $.parseJSON(productReturn);
				var table = $("<table/>").addClass("table table-bordered").attr({
							id : "productReturn"
				});
				var thead = $("<thead/>");
				var tr = $("<tr/>");
				tr.append($("<th/>").append("Date"));
				tr.append($("<th/>").append("Stock Type"));
				tr.append($("<th/>").append("Warehouse"));
				tr.append($("<th/>").append("Mobile User"));
				tr.append($("<th/>").append("Product"));
				tr.append($("<th/>").append("Unit"));
				tr.append($("<th/>").append("season"));
				tr.append($("<th/>").append("Existing Quantity"));
				tr.append($("<th/>").append("Return Quantity"));
				tr.append($("<th/>").append("Cost price"));
				//tr.append($("<th/>").append("Selling price"));
				//tr.append($("<th/>").append("Sub total"));
				table.append(thead);
				thead.append(tr);
				var tbody = $("<tbody/>");
					$.each(productReturnData, function(index, value) {
						var tr2 = $("<tr/>");
						tr2.append($("<td/>").append(value.TXN_TIME));
						tr2.append($("<td/>").append(value.STOCK_TYPE));
						tr2.append($("<td/>").append(value.SERVICE_POINT_NAME));
						tr2.append($("<td/>").append(value.AGENT_NAME));
						tr2.append($("<td/>").append(value.productName));
						tr2.append($("<td/>").append(value.UNIT));
						tr2.append($("<td/>").append(value.season));
						
						tr2.append($("<td/>").append(value.EXISTING_QUANTITY));
						tr2.append($("<td/>").append(value.QUANTITY));
						
						tr2.append($("<td/>").append(value.productPrice));
						//tr2.append($("<td/>").append(value.SELLING_PRICE));
						//tr2.append($("<td/>").append(value.SUB_TOTAL));
						tbody.append(tr2);
					});
				table.append(tbody);
				var wrappedDiv = $("<div/>").addClass("appContentWrapper marginBottom");
				var headerDiv =  $("<div/>").addClass("formContainerWrapper");
				headerDiv.append("<h2>Product return Transaction <div class='pull-right'><a class='aCollapse'><i class='fa fa-chevron-right' onclick=$('#productReturn').parent().slideToggle(1000);$('#exportButtons_productReturn').toggle(1000);$('#filterDiv_productReturn').toggle(1000);></i></a></div>  </h2>");
				headerDiv.append("<div id='exportButtons_productReturn' style='float:right;'></div>");
				wrappedDiv.append(headerDiv);
				
				
				/*  */
				var startDateBox = $('<input/>').attr({
						type : 'text',
						id : "startDateBox_productReturn",
						readonly : 'readonly',
						'data-date-format' : "dd-mm-yyyy",
						placeholder : "Start date",
					});
					
					var endDateBox = $('<input/>').attr({
						type : 'text',
						id : "endDateBox_productReturn",
						readonly : 'readonly',
						'data-date-format' : "dd-mm-yyyy",
						placeholder : "End date",
						style : 'margin-left:1%'
					});
					
					var seasonBox = $('<select/>').attr({
						class : "seasonFilter select2",
						id : "season_productReturn",
						style : 'margin-left:1%'
					});
					
					var filterDiv = $("<div id='filterDiv_productReturn'/>");
					filterDiv.append(startDateBox);
					filterDiv.append(endDateBox);
					filterDiv.append(seasonBox);
					filterDiv.append('<button style="margin-left:1%;" type="button" id="submitBtn_productReturn" class="btn btn-success btn-sm" >Search <i class="glyphicon glyphicon-search" aria-hidden="true"></i></button>');
					filterDiv.append('<button style="margin-left:1%;" type="button" id="clearBtn_productReturn" class="btn btn-warning btn-sm" >Clear <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></button>');
					wrappedDiv.append(filterDiv);
				
				/*  */
				/* 
				
				var dateBox = $('<input/>').attr({
					type : 'text',
					id : "dateSearchBox_productReturn",
					readonly : 'readonly',
					'data-date-format' : "dd-mm-yy",
					placeholder : "Select date",
					onchange : "datefilterForDataTable('productReturn',this.value)"
				});
				
				
				var filterDiv = $("<div id='filterDiv_productReturn'/>");
				filterDiv.append(dateBox);
				filterDiv.append('<button style="margin-left:1%;" type="button" id="clearBtn_productReturn" class="btn btn-warning btn-sm" >Clear <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></button>');
				wrappedDiv.append(filterDiv);
				
				 */
				
				wrappedDiv.append(table);
				$("#tabs-11").append(wrappedDiv);
				
				if(productReturnData != ''){
				
					 var table = $('#productReturn').DataTable();
				     var buttons = new $.fn.dataTable.Buttons(table, {
				    	  buttons: [
					                 {
					                     extend: 'excel',
					                     title: 'Product Return Report ( '+'<s:property value="farmer.firstName"/>'+' )',
					                     messageTop: '',
					                     messageBottom: '',
					                     
					                 },
					                 {
					                     extend: 'pdf',
					                     title: 'Product Return Report ( '+'<s:property value="farmer.firstName"/>'+' )',
					                     messageTop: '',
					                     messageBottom: '',
					                    
					                 }
					             ]
				   }).container().appendTo($('#exportButtons_productReturn'));
			   
				}else{
					$('#productReturn').DataTable();
				}
			  /*    $("#dateSearchBox_productReturn" ).datepicker({
				 		dateFormat : "dd-mm-yy",
				 		changeMonth : true,
				 		changeYear : true
				 	}); 
				     
				    $("#clearBtn_productReturn").attr("onclick", "clearFilters('productReturn','dateSearchBox_productReturn')");
			      */
			      
			      
			      $("#startDateBox_productReturn" ).datepicker({
				 		dateFormat : "dd-mm-yy",
				 		changeMonth : true,
				 		changeYear : true
				 	}); 
				   
			     $("#endDateBox_productReturn" ).datepicker({
				 		dateFormat : "dd-mm-yy",
				 		changeMonth : true,
				 		changeYear : true
				 	});
			     
				      
				    $("#submitBtn_productReturn").attr("onclick", "datefilterForDataTable('productReturn','productReturnByFarmerId')");
				    $("#clearBtn_productReturn").attr("onclick", "clearFilters('productReturn','productReturnByFarmerId')");  
				    $("#productReturn").addClass("dataTableTheme");
			     populateTrainingStatusReportByFarmerId();
			});
		}
		
		function populateTrainingStatusReportByFarmerId(){
			jQuery.post("farmer_trainingStatusReportByFarmerId.action", {id:document.getElementById('farmerId').value}, function(trainingStatus) {
				var trainingStatusData = $.parseJSON(trainingStatus);
				var table = $("<table/>").addClass("table table-bordered").attr({
							id : "trainingStatus"
				});
				var thead = $("<thead/>");
				var tr = $("<tr/>");
				tr.append($("<th/>").append("Date"));
				tr.append($("<th/>").append("Mobile user"));
				tr.append($("<th/>").append("Training code"));
				tr.append($("<th/>").append("Training assistant name"));
				tr.append($("<th/>").append("Time taken for training"));
			/* 	tr.append($("<th/>").append("Farmer attended")); */
				tr.append($("<th/>").append("Remarks"));
				table.append(thead);
				thead.append(tr);
				var tbody = $("<tbody/>");
					$.each(trainingStatusData, function(index, value) {
						var tr2 = $("<tr/>");
						tr2.append($("<td/>").append(value.TRAINING_DATE));
						tr2.append($("<td/>").append(value.agentName));
						tr2.append($("<td/>").append(value.TRAINING_CODE));
						tr2.append($("<td/>").append(value.TRAINING_ASSISTANT_NAME));
						tr2.append($("<td/>").append(value.TIME_TAKEN_FOR_TRAINING));
						/* tr2.append($("<td/>").append(value.FARMER_ATTENED)); */
						tr2.append($("<td/>").append(value.REMARKS));
						tbody.append(tr2);
					});
				table.append(tbody);
				var wrappedDiv = $("<div/>").addClass("appContentWrapper marginBottom");
				var headerDiv =  $("<div/>").addClass("formContainerWrapper");
				headerDiv.append("<h2>Training Status <div class='pull-right'><a class='aCollapse'><i class='fa fa-chevron-right' onclick=$('#trainingStatus').parent().slideToggle(1000);$('#exportButtons_trainingStatus').toggle(1000);$('#filterDiv_trainingStatus').toggle(1000);></i></a></div>  </h2>");
				headerDiv.append("<div id='exportButtons_trainingStatus' style='float:right;'></div>");
				wrappedDiv.append(headerDiv);
				
				
				var startDateBox = $('<input/>').attr({
					type : 'text',
					id : "startDateBox_trainingStatus",
					readonly : 'readonly',
					'data-date-format' : "dd-mm-yyyy",
					placeholder : "Start date",
				});
				
				var endDateBox = $('<input/>').attr({
					type : 'text',
					id : "endDateBox_trainingStatus",
					readonly : 'readonly',
					'data-date-format' : "dd-mm-yyyy",
					placeholder : "End date",
					style : 'margin-left:1%'
				});
				
				
				
				var filterDiv = $("<div id='filterDiv_trainingStatus'/>");
				filterDiv.append(startDateBox);
				filterDiv.append(endDateBox);
				
				filterDiv.append('<button style="margin-left:1%;" type="button" id="submitBtn_trainingStatus" class="btn btn-success btn-sm" >Search <i class="glyphicon glyphicon-search" aria-hidden="true"></i></button>');
				filterDiv.append('<button style="margin-left:1%;" type="button" id="clearBtn_trainingStatus" class="btn btn-warning btn-sm" >Clear <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></button>');
				wrappedDiv.append(filterDiv);
				
				/* var dateBox = $('<input/>').attr({
					type : 'text',
					id : "dateSearchBox_trainingStatus",
					readonly : 'readonly',
					'data-date-format' : "dd-mm-yy",
					placeholder : "Select date",
					onchange : "datefilterForDataTable('trainingStatus',this.value)"
				});
				
				
				var filterDiv = $("<div id='filterDiv_trainingStatus'/>");
				filterDiv.append(dateBox);
				filterDiv.append('<button style="margin-left:1%;" type="button" id="clearBtn_trainingStatus" class="btn btn-warning btn-sm" >Clear <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></button>');
				wrappedDiv.append(filterDiv); */
				
				wrappedDiv.append(table);
				$("#tabs-11").append(wrappedDiv);
				
				if(trainingStatusData != ''){
					 var table = $('#trainingStatus').DataTable();
				     var buttons = new $.fn.dataTable.Buttons(table, {
				    	  buttons: [
					                 {
					                     extend: 'excel',
					                     title: 'Training Status Report ( '+'<s:property value="farmer.firstName"/>'+' )',
					                     messageTop: '',
					                     messageBottom: '',
					                     
					                 },
					                 {
					                     extend: 'pdf',
					                     title: 'Training Status Report ( '+'<s:property value="farmer.firstName"/>'+' )',
					                     messageTop: '',
					                     messageBottom: '',
					                    
					                 }
					             ]
				   }).container().appendTo($('#exportButtons_trainingStatus'));
				}else{
					 $('#trainingStatus').DataTable();
				}
				
				
			     
			     /* $("#dateSearchBox_trainingStatus" ).datepicker({
				 		dateFormat : "dd-mm-yy",
				 		changeMonth : true,
				 		changeYear : true
				 	}); 
				     
				    $("#clearBtn_trainingStatus").attr("onclick", "clearFilters('trainingStatus','dateSearchBox_trainingStatus')");
			      */
			      
			      
			      $("#startDateBox_trainingStatus" ).datepicker({
				 		dateFormat : "dd-mm-yy",
				 		changeMonth : true,
				 		changeYear : true
				 	}); 
				   
			     $("#endDateBox_trainingStatus" ).datepicker({
				 		dateFormat : "dd-mm-yy",
				 		changeMonth : true,
				 		changeYear : true
				 	});
			     
				      
				    $("#submitBtn_trainingStatus").attr("onclick", "datefilterForDataTable('trainingStatus','trainingStatusReportByFarmerId')");
				    $("#clearBtn_trainingStatus").attr("onclick", "clearFilters('trainingStatus','trainingStatusReportByFarmerId')"); 
				    $("#trainingStatus").addClass("dataTableTheme");
			     populateFarmerBalanceReportByFarmerId();
			});
		}
		
		function populateFarmerBalanceReportByFarmerId(){
			jQuery.post("farmer_farmerBalanceReportByFarmerId.action", {id:document.getElementById('farmerId').value}, function(farmerBalanceReport) {
				var farmerBalanceReportData = $.parseJSON(farmerBalanceReport);
				var table = $("<table/>").addClass("table table-bordered").attr({
							id : "farmerBalanceReport"
				});
				var thead = $("<thead/>");
				var tr = $("<tr/>");
				tr.append($("<th/>").append("Date"));
				tr.append($("<th/>").append("Transaction Type"));
				tr.append($("<th/>").append("Receipt Number"));
				tr.append($("<th/>").append("Initial Balance"));
				tr.append($("<th/>").append("Transaction Amount"));
				tr.append($("<th/>").append("Balance Amount"));
				table.append(thead);
				thead.append(tr);
				var tbody = $("<tbody/>");
					$.each(farmerBalanceReportData, function(index, value) {
						var tr2 = $("<tr/>");
						tr2.append($("<td/>").append(value.TXN_TIME));
						tr2.append($("<td/>").append(value.TXN_DESC));
						tr2.append($("<td/>").append(value.RECEIPT_NO));
						tr2.append($("<td/>").append(value.INT_BAL));
						tr2.append($("<td/>").append(value.TXN_AMT));
						tr2.append($("<td/>").append(value.BAL_AMT));
						tbody.append(tr2);
					});
				table.append(tbody);
				
				
				
				
				var wrappedDiv = $("<div/>").addClass("appContentWrapper marginBottom");
				var headerDiv =  $("<div/>").addClass("formContainerWrapper");
				headerDiv.append("<h2>Farmer Balance Report <div class='pull-right'><a class='aCollapse'><i class='fa fa-chevron-right' onclick=$('#farmerBalanceReport').parent().slideToggle(1000);$('#exportButtons_farmerBalanceReport').toggle(1000);$('#filterDiv_farmerBalanceReport').toggle(1000);></i></a></div>  </h2>");
				headerDiv.append("<div id='exportButtons_farmerBalanceReport' style='float:right;'></div>");
				wrappedDiv.append(headerDiv);
				
				var startDateBox = $('<input/>').attr({
					type : 'text',
					id : "startDateBox_farmerBalanceReport",
					readonly : 'readonly',
					'data-date-format' : "dd-mm-yyyy",
					placeholder : "Start date",
				});
				
				var endDateBox = $('<input/>').attr({
					type : 'text',
					id : "endDateBox_farmerBalanceReport",
					readonly : 'readonly',
					'data-date-format' : "dd-mm-yyyy",
					placeholder : "End date",
					style : 'margin-left:1%'
				});
				
				
				
				var filterDiv = $("<div id='filterDiv_farmerBalanceReport'/>");
				filterDiv.append(startDateBox);
				filterDiv.append(endDateBox);
				
				filterDiv.append('<button style="margin-left:1%;" type="button" id="submitBtn_farmerBalanceReport" class="btn btn-success btn-sm" >Search <i class="glyphicon glyphicon-search" aria-hidden="true"></i></button>');
				filterDiv.append('<button style="margin-left:1%;" type="button" id="clearBtn_farmerBalanceReport" class="btn btn-warning btn-sm" >Clear <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></button>');
				wrappedDiv.append(filterDiv);
				
				/* var dateBox = $('<input/>').attr({
					type : 'text',
					id : "dateSearchBox_farmerBalanceReport",
					readonly : 'readonly',
					'data-date-format' : "dd-mm-yy",
					placeholder : "Select date",
					onchange : "datefilterForDataTable('farmerBalanceReport',this.value)"
				});
				
				var filterDiv = $("<div id='filterDiv_farmerBalanceReport'/>");
				filterDiv.append(dateBox);
				filterDiv.append('<button style="margin-left:1%;" type="button" id="clearBtn_farmerBalanceReport" class="btn btn-warning btn-sm" >Clear <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></button>');
				wrappedDiv.append(filterDiv); */
				
				wrappedDiv.append(table);
				$("#tabs-11").append(wrappedDiv);
				
				if(farmerBalanceReportData != ''){
					var table = $('#farmerBalanceReport').DataTable();
				     var buttons = new $.fn.dataTable.Buttons(table, {
				       buttons: [
				                 {
				                     extend: 'excel',
				                     title: 'Farmer Balance Report ( '+'<s:property value="farmer.firstName"/>'+' )',
				                     messageTop: '',
				                     messageBottom: '',
				                     
				                 },
				                 {
				                     extend: 'pdf',
				                     title: 'Farmer Balance Report ( '+'<s:property value="farmer.firstName"/>'+' )',
				                     messageTop: '',
				                     messageBottom: '',
				                    
				                 }
				             ]
				   }).container().appendTo($('#exportButtons_farmerBalanceReport')); 
				}else{
					 $('#farmerBalanceReport').DataTable();
				}
				
				  
			    

					
				  $("#startDateBox_farmerBalanceReport" ).datepicker({
					 		dateFormat : "dd-mm-yy",
					 		changeMonth : true,
					 		changeYear : true
					 	}); 
					   
				     $("#endDateBox_farmerBalanceReport" ).datepicker({
					 		dateFormat : "dd-mm-yy",
					 		changeMonth : true,
					 		changeYear : true
					 	});
				     
					      
					    $("#submitBtn_farmerBalanceReport").attr("onclick", "datefilterForDataTable('farmerBalanceReport','farmerBalanceReportByFarmerId')");
					    $("#clearBtn_farmerBalanceReport").attr("onclick", "clearFilters('farmerBalanceReport','farmerBalanceReportByFarmerId')");  
					    $("#farmerBalanceReport").addClass("dataTableTheme");
					    populateProcurementTransactionsByFarmerId();
			     
			  /*    
			    $("#dateSearchBox_farmerBalanceReport" ).datepicker({
			 		dateFormat : "dd-mm-yy",
			 		changeMonth : true,
			 		changeYear : true
			 	}); 
			     
			    $("#clearBtn_farmerBalanceReport").attr("onclick", "clearFilters('farmerBalanceReport','dateSearchBox_farmerBalanceReport')");
			    */  
			});
		}
		
		
		function populateProcurementTransactionsByFarmerId(){

			jQuery.post("farmer_procurementTransactionsByFarmerId.action", {id:document.getElementById('farmerId').value}, function(procurementTransaction) {
				var procurementTransactionData = $.parseJSON(procurementTransaction);
				var table = $("<table/>").addClass("table table-bordered").attr({
							id : "procurementTransactionReport"
				});
				var thead = $("<thead/>");
				var tr = $("<tr/>");
				tr.append($("<th/>").append("Date"));
				tr.append($("<th/>").append("Mobile user"));
				tr.append($("<th/>").append("Season"));
				tr.append($("<th/>").append("Product Name"));
				tr.append($("<th/>").append("Unit"));
				tr.append($("<th/>").append("Number Of Bags"));
				tr.append($("<th/>").append("Net Weight"));
				tr.append($("<th/>").append("Total Amount"));
				tr.append($("<th/>").append("payment Amount"));
				table.append(thead);
				thead.append(tr);
				var tbody = $("<tbody/>");
					$.each(procurementTransactionData, function(index, value) {
						var tr2 = $("<tr/>");
						tr2.append($("<td/>").append(value.CREATED_DATE));
						tr2.append($("<td/>").append(value.agentName));
						tr2.append($("<td/>").append(value.season));
						tr2.append($("<td/>").append(value.ProductName));
						tr2.append($("<td/>").append(value.Unit));
						tr2.append($("<td/>").append(value.NUMBER_OF_BAGS));
						tr2.append($("<td/>").append(value.NET_WEIGHT));
						tr2.append($("<td/>").append(value.TOTAL_AMOUNT));
						tr2.append($("<td/>").append(value.PAYMENT_AMT));
						tbody.append(tr2);
					});
				table.append(tbody);
				
				
				
				
				var wrappedDiv = $("<div/>").addClass("appContentWrapper marginBottom");
				var headerDiv =  $("<div/>").addClass("formContainerWrapper");
				headerDiv.append("<h2>Procurement Transaction Report <div class='pull-right'><a class='aCollapse'><i class='fa fa-chevron-right' onclick=$('#procurementTransactionReport').parent().slideToggle(1000);$('#exportButtons_procurementTransactionReport').toggle(1000);$('#filterDiv_procurementTransactionReport').toggle(1000);></i></a></div>  </h2>");
				headerDiv.append("<div id='exportButtons_procurementTransactionReport' style='float:right;'></div>");
				wrappedDiv.append(headerDiv);
				
				var startDateBox = $('<input/>').attr({
					type : 'text',
					id : "startDateBox_procurementTransactionReport",
					readonly : 'readonly',
					'data-date-format' : "dd-mm-yyyy",
					placeholder : "Start date",
				});
				
				var endDateBox = $('<input/>').attr({
					type : 'text',
					id : "endDateBox_procurementTransactionReport",
					readonly : 'readonly',
					'data-date-format' : "dd-mm-yyyy",
					placeholder : "End date",
					style : 'margin-left:1%'
				});
				
				var seasonBox = $('<select/>').attr({
					class : "seasonFilter select2",
					id : "season_procurementTransactionReport",
					style : 'margin-left:1%'
				});
				
				var filterDiv = $("<div id='filterDiv_procurementTransactionReport'/>");
				filterDiv.append(startDateBox);
				filterDiv.append(endDateBox);
				filterDiv.append(seasonBox);
				filterDiv.append('<button style="margin-left:1%;" type="button" id="submitBtn_procurementTransactionReport" class="btn btn-success btn-sm" >Search <i class="glyphicon glyphicon-search" aria-hidden="true"></i></button>');
				filterDiv.append('<button style="margin-left:1%;" type="button" id="clearBtn_procurementTransactionReport" class="btn btn-warning btn-sm" >Clear <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></button>');
				wrappedDiv.append(filterDiv);
				
				
				wrappedDiv.append(table);
				$("#tabs-11").append(wrappedDiv);
				
				if(procurementTransactionData != ''){
					 var table = $('#procurementTransactionReport').DataTable();
				     var buttons = new $.fn.dataTable.Buttons(table, {
				       buttons: [
				                 {
				                     extend: 'excel',
				                     title: 'Procurement TransactionReport Report ( '+'<s:property value="farmer.firstName"/>'+' )',
				                     messageTop: '',
				                     messageBottom: '',
				                     
				                 },
				                 {
				                     extend: 'pdf',
				                     title: 'Procurement TransactionReport Report ( '+'<s:property value="farmer.firstName"/>'+' )',
				                     messageTop: '',
				                     messageBottom: '',
				                    
				                 }
				             ]
				   }).container().appendTo($('#exportButtons_procurementTransactionReport')); 
				}else{
					$('#procurementTransactionReport').DataTable();
				}
				
				
			    

					
				  $("#startDateBox_procurementTransactionReport" ).datepicker({
					 		dateFormat : "dd-mm-yy",
					 		changeMonth : true,
					 		changeYear : true
					 	}); 
					   
				     $("#endDateBox_procurementTransactionReport" ).datepicker({
					 		dateFormat : "dd-mm-yy",
					 		changeMonth : true,
					 		changeYear : true
					 	});
				     
					      
					    $("#submitBtn_procurementTransactionReport").attr("onclick", "datefilterForDataTable('procurementTransactionReport','procurementTransactionsByFarmerId')");
					    $("#clearBtn_procurementTransactionReport").attr("onclick", "clearFilters('procurementTransactionReport','procurementTransactionsByFarmerId')");  
					    $("#procurementTransactionReport").addClass("dataTableTheme");
					    loadSeasonFilter();  
			  
			});
		}
		 function populatePeriodicInspectionsByFarmerId(){
				jQuery.post("farmer_periodicInspectionsByFarmerId.action", {id:document.getElementById('farmerId').value}, function(periodicInspections) {
					var periodicInspectionsData = $.parseJSON(periodicInspections);
					
					var table = $("<table/>").addClass("table table-bordered").attr({
								id : "periodicInspectionsReport"
					});
					var thead = $("<thead/>");
					var tr = $("<tr/>");
					tr.append($("<th/>").append("Date"));
					tr.append($("<th/>").append("Season"));
					tr.append($("<th/>").append("Farm"));
					tr.append($("<th/>").append("Crop"));
					tr.append($("<th/>").append("Mobile User"));
					tr.append($("<th/>").append("Status Of Growth"));
					tr.append($("<th/>").append("Inter Crop"));
					//tr.append($("<th/>").append("payment Amount"));
					table.append(thead);
					thead.append(tr);
					var tbody = $("<tbody/>");
						$.each(periodicInspectionsData, function(index, value) {
							var tr2 = $("<tr/>");
							tr2.append($("<td/>").append(value.CREATED_DATE));
							tr2.append($("<td/>").append(value.season));
							tr2.append($("<td/>").append(value.farm));
							tr2.append($("<td/>").append(value.crop));
							tr2.append($("<td/>").append(value.mobile));
							tr2.append($("<td/>").append(value.catalogue));
							tr2.append($("<td/>").append(value.interCrop));
							tbody.append(tr2);
						});
					table.append(tbody);
					
					
					
					
					var wrappedDiv = $("<div/>").addClass("appContentWrapper marginBottom");
					var headerDiv =  $("<div/>").addClass("formContainerWrapper");
					headerDiv.append("<h2>Regular Inspection Report <div class='pull-right'><a class='aCollapse'><i class='fa fa-chevron-right' onclick=$('#periodicInspectionsReport').parent().slideToggle(1000);$('#exportButtons_periodicInspectionsReport').toggle(1000);$('#filterDiv_periodicInspectionsReport').toggle(1000);></i></a></div>  </h2>");
					headerDiv.append("<div id='exportButtons_periodicInspectionsReport' style='float:right;'></div>");
					wrappedDiv.append(headerDiv);
					
					 var startDateBox = $('<input/>').attr({
						type : 'text',
						id : "startDateBox_periodicInspectionsReport",
						readonly : 'readonly',
						'data-date-format' : "dd-mm-yyyy",
						placeholder : "Start date",
					});
					
					var endDateBox = $('<input/>').attr({
						type : 'text',
						id : "endDateBox_periodicInspectionsReport",
						readonly : 'readonly',
						'data-date-format' : "dd-mm-yyyy",
						placeholder : "End date",
						style : 'margin-left:1%'
					}); 
					
				 	var seasonBox = $('<select/>').attr({
						class : "seasonFilter select2",
						id : "season_periodicInspectionsReport",
						style : 'margin-left:1%'
					}); 
					
					var filterDiv = $("<div id='filterDiv_periodicInspectionsReport'/>");
					filterDiv.append(startDateBox);
					filterDiv.append(endDateBox);
					filterDiv.append(seasonBox);
					filterDiv.append('<button style="margin-left:1%;" type="button" id="submitBtn_periodicInspectionsReport" class="btn btn-success btn-sm" >Search <i class="glyphicon glyphicon-search" aria-hidden="true"></i></button>');
					filterDiv.append('<button style="margin-left:1%;" type="button" id="clearBtn_periodicInspectionsReport" class="btn btn-warning btn-sm" >Clear <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></button>');
					wrappedDiv.append(filterDiv);
					
					
					wrappedDiv.append(table);
					$("#tabs-11").append(wrappedDiv);
					
					if(periodicInspectionsData != ''){
						var table = $('#periodicInspectionsReport').DataTable();
					     var buttons = new $.fn.dataTable.Buttons(table, {
					       buttons: [
					                 {
					                     extend: 'excel',
					                     title: 'Farm Inspection Report ( '+'<s:property value="farmer.firstName"/>'+' )',
					                     messageTop: '',
					                     messageBottom: '',
					                     
					                 },
					                 {
					                     extend: 'pdf',
					                     title: 'Farm Inspection Report Report ( '+'<s:property value="farmer.firstName"/>'+' )',
					                     messageTop: '',
					                     messageBottom: '',
					                    
					                 }
					             ]
					   }).container().appendTo($('#exportButtons_periodicInspectionsReport')); 
					}else{
						$('#periodicInspectionsReport').DataTable();
					}
					
					 
				    

						
				  $("#startDateBox_periodicInspectionsReport" ).datepicker({
						 		dateFormat : "dd-mm-yy",
						 		changeMonth : true,
						 		changeYear : true
						 	}); 
						   
					     $("#endDateBox_periodicInspectionsReport" ).datepicker({
						 		dateFormat : "dd-mm-yy",
						 		changeMonth : true,
						 		changeYear : true
						 	});
					     
						       
						    $("#submitBtn_periodicInspectionsReport").attr("onclick", "datefilterForDataTable('periodicInspectionsReport','periodicInspectionsByFarmerId')");
						    $("#clearBtn_periodicInspectionsReport").attr("onclick", "clearFilters('periodicInspectionsReport','periodicInspectionsByFarmerId')");  
						    $("#periodicInspectionsReport").addClass("dataTableTheme");
						   // loadSeasonFilter(); 
						    populatePeriodicNeedBasedInspectionsByFarmerId();
				  
				});
			}
			 
			 function populatePeriodicNeedBasedInspectionsByFarmerId(){
					jQuery.post("farmer_periodicNeedBasedInspectionsByFarmerId.action", {id:document.getElementById('farmerId').value}, function(periodicNeedBasedInspection) {
						var periodicNeedBasedInspectionData = $.parseJSON(periodicNeedBasedInspection);
						
						var table = $("<table/>").addClass("table table-bordered").attr({
									id : "periodicNeedBasedInspectionReport"
						});
						var thead = $("<thead/>");
						var tr = $("<tr/>");
						tr.append($("<th/>").append("Date"));
						tr.append($("<th/>").append("Season"));
						tr.append($("<th/>").append("Farm"));
						tr.append($("<th/>").append("Crop"));
						tr.append($("<th/>").append("Mobile User"));
						tr.append($("<th/>").append("Inter Crop"));
						//tr.append($("<th/>").append("payment Amount"));
						table.append(thead);
						thead.append(tr);
						var tbody = $("<tbody/>");
							$.each(periodicNeedBasedInspectionData, function(index, value) {
								var tr2 = $("<tr/>");
								tr2.append($("<td/>").append(value.CREATED_DATE));
								tr2.append($("<td/>").append(value.season));
								tr2.append($("<td/>").append(value.farm));
								tr2.append($("<td/>").append(value.crop));
								tr2.append($("<td/>").append(value.mobile));
								tr2.append($("<td/>").append(value.interCrop));
								tbody.append(tr2);
							});
						table.append(tbody);
						
						
						
						
						var wrappedDiv = $("<div/>").addClass("appContentWrapper marginBottom");
						var headerDiv =  $("<div/>").addClass("formContainerWrapper");
						headerDiv.append("<h2>Need Based Inspection Report <div class='pull-right'><a class='aCollapse'><i class='fa fa-chevron-right' onclick=$('#periodicNeedBasedInspectionReport').parent().slideToggle(1000);$('#exportButtons_periodicNeedBasedInspectionReport').toggle(1000);$('#filterDiv_periodicInspectionsReport').toggle(1000);></i></a></div>  </h2>");
						headerDiv.append("<div id='exportButtons_periodicNeedBasedInspectionReport' style='float:right;'></div>");
						wrappedDiv.append(headerDiv);
						
						 var startDateBox = $('<input/>').attr({
							type : 'text',
							id : "startDateBox_periodicNeedBasedInspectionReport",
							readonly : 'readonly',
							'data-date-format' : "dd-mm-yyyy",
							placeholder : "Start date",
						});
						
						var endDateBox = $('<input/>').attr({
							type : 'text',
							id : "endDateBox_periodicNeedBasedInspectionReport",
							readonly : 'readonly',
							'data-date-format' : "dd-mm-yyyy",
							placeholder : "End date",
							style : 'margin-left:1%'
						}); 
						
					 	var seasonBox = $('<select/>').attr({
							class : "seasonFilter select2",
							id : "season_periodicNeedBasedInspectionReport",
							style : 'margin-left:1%'
						}); 
						
						var filterDiv = $("<div id='filterDiv_periodicNeedBasedInspectionReport'/>");
						filterDiv.append(startDateBox);
						filterDiv.append(endDateBox);
						filterDiv.append(seasonBox);
						filterDiv.append('<button style="margin-left:1%;" type="button" id="submitBtn_periodicNeedBasedInspectionReport class="btn btn-success btn-sm" >Search <i class="glyphicon glyphicon-search" aria-hidden="true"></i></button>');
						filterDiv.append('<button style="margin-left:1%;" type="button" id="clearBtn_periodicNeedBasedInspectionReport" class="btn btn-warning btn-sm" >Clear <i class="glyphicon glyphicon-remove" aria-hidden="true"></i></button>');
						wrappedDiv.append(filterDiv);
						
						
						wrappedDiv.append(table);
						$("#tabs-11").append(wrappedDiv);
						
						if(periodicNeedBasedInspectionData != ''){
							var table = $('#periodicNeedBasedInspectionReport').DataTable();
						     var buttons = new $.fn.dataTable.Buttons(table, {
						       buttons: [
						                 {
						                     extend: 'excel',
						                     title: 'Farm Inspection Report ( '+'<s:property value="farmer.firstName"/>'+' )',
						                     messageTop: '',
						                     messageBottom: '',
						                     
						                 },
						                 {
						                     extend: 'pdf',
						                     title: 'Farm Inspection Report Report ( '+'<s:property value="farmer.firstName"/>'+' )',
						                     messageTop: '',
						                     messageBottom: '',
						                    
						                 }
						             ]
						   }).container().appendTo($('#exportButtons_periodicNeedBasedInspectionReport')); 
						}else{
							$('#periodicNeedBasedInspectionReport').DataTable();
						}
						
						
					    

							
					  $("#startDateBox_periodicNeedBasedInspectionReport" ).datepicker({
							 		dateFormat : "dd-mm-yy",
							 		changeMonth : true,
							 		changeYear : true
							 	}); 
							   
						     $("#endDateBox_periodicNeedBasedInspectionReport" ).datepicker({
							 		dateFormat : "dd-mm-yy",
							 		changeMonth : true,
							 		changeYear : true
							 	});
						     
							       
							    $("#submitBtn_periodicNeedBasedInspectionReportt").attr("onclick", "datefilterForDataTable('periodicNeedBasedInspectionReport','periodicNeedBasedInspectionsByFarmerId')");
							    $("#clearBtn_periodicNeedBasedInspectionReport").attr("onclick", "clearFilters('periodicNeedBasedInspectionReport','periodicNeedBasedInspectionsByFarmerId')");  
							    $("#periodicNeedBasedInspectionReport").addClass("dataTableTheme");
							    loadSeasonFilter();  
					  
					});
			 }
			 
		
	function datefilterForDataTable(tableId,url){
		
		var start = $('#startDateBox_'+tableId).val();
		var end = 	$('#endDateBox_'+tableId).val();
		var season = $("#season_"+tableId).val();
		
		if(!isEmpty(start) && isEmpty(end) || isEmpty(start) && !isEmpty(end) ){
			alert("Please choose both dates")
		}else if(isEmpty(start) && isEmpty(end) && isEmpty(season) ){
			alert("Please choose filter")
		}else{
			$('#'+tableId).DataTable().destroy();	
			if(isEmpty(start)){
				start = "showAll";
			}
			
			if(isEmpty(end)){
				end = "showAll";
			}
			jQuery.post("farmer_"+url+".action", {id:document.getElementById('farmerId').value,startDate:start,endDate:end,seasonCode:season}, function(result) {
					var data = $.parseJSON(result);
					var dataFor_dataTable = [];
					
					for (var i = 0; i < data.length; i++){
					    var obj = data[i];
					    for (var key in obj){
					        var attrName = key;
					        var attrValue = obj[key];
					       
					        if(attrName == "data"){
					        	var result = attrValue.substring(1, attrValue.length-1);
					        	 
					        	 while(result.includes("]")){
					        		 var start =	result.indexOf("[");
							        	var end =	result.indexOf("]");
							            var res = result.substring(start+1, end);
							            var tempArr =	res.split(",");
							           	result = result.slice(start+1);
							        	result = result.slice(end);
							        	
							        	/* for (var i = 0; i < tempArr.length; i++){
							        		 if(tempArr[i].includes("#")){
							        			 tempArr[i] = tempArr[i].replace(/#/g, ",");
							        			}
							        	} */
							        	
							        	dataFor_dataTable.push(tempArr);
					        	 }
					        	
					        	if(dataFor_dataTable.length != 0){
					        		 var table  = $('#'+tableId).DataTable( {
							        	 data: dataFor_dataTable
								        });
						        	
						        	var buttons = new $.fn.dataTable.Buttons(table, {
								    	  buttons: [
									                 {
									                     extend: 'excel',
									                     title: tableId+' Report ( '+'<s:property value="farmer.firstName"/>'+' )',
									                     messageTop: '',
									                     messageBottom: '',
									                     
									                 },
									                 {
									                     extend: 'pdf',
									                     title: tableId+' Report  ( '+'<s:property value="farmer.firstName"/>'+' )',
									                     messageTop: '',
									                     messageBottom: '',
									                    
									                 }
									             ]
								   }).container().appendTo($('#exportButtons_'+tableId));
					        	}else{
					        		$('#'+tableId).DataTable( {
							        	 data: dataFor_dataTable
								        });
					        	}
					        	
					        	
					        	
					       }
					    }
					} 
				 }); 
		}
		
}
		
		function clearFilters(tableId,url){
			if(!isEmpty($("#startDateBox_"+tableId).val())  || !isEmpty($("#endDateBox_"+tableId).val()) || !isEmpty($("#season_"+tableId).val()) ){
				$("#startDateBox_"+tableId).val("");
				$("#endDateBox_"+tableId).val("");
				$("#season_"+tableId).val("");
				refreshDataTable(tableId,url);
			}
		}
		
		
		function refreshDataTable(tableId,url){

				 $('#startDateBox_'+tableId).val("");
				$('#endDateBox_'+tableId).val("");
				//$("#season_"+tableId).val("");
				
				var seasonFilter = document.getElementById("season_"+tableId);
			
				if(seasonFilter != null){
					$("#season_"+tableId).select2("val", "");
				} 
				
					
				$('#'+tableId).DataTable().destroy();	
				var start = "showAll";
				var end = "showAll";
						
						jQuery.post("farmer_"+url+".action", {id:document.getElementById('farmerId').value,startDate:start,endDate:end}, function(result) {
								var data = $.parseJSON(result);
								var dataFor_dataTable = [];
								
								for (var i = 0; i < data.length; i++){
								    var obj = data[i];
								    for (var key in obj){
								        var attrName = key;
								        var attrValue = obj[key];
								       
								        if(attrName == "data"){
								        	var result = attrValue.substring(1, attrValue.length-1);
								        	
								        	 while(result.includes("]")){
								        		 var start =	result.indexOf("[");
										        	var end =	result.indexOf("]");
										            var res = result.substring(start+1, end);
										           	var tempArr =	res.split(",");
										        	result = result.slice(start+1);
										        	result = result.slice(end);
										        	dataFor_dataTable.push(tempArr);
								        	 }
								        	 
								        if(dataFor_dataTable.length != 0){
								        	
								        	var table  = $('#'+tableId).DataTable( {
									        	 data: dataFor_dataTable
									        } );
								        	
								        	
								        	var buttons = new $.fn.dataTable.Buttons(table, {
										    	  buttons: [
											                 {
											                     extend: 'excel',
											                     title: tableId+' Report ( '+'<s:property value="farmer.firstName"/>'+' )',
											                     messageTop: '',
											                     messageBottom: '',
											                     
											                 },
											                 {
											                     extend: 'pdf',
											                     title: tableId+' Report  ( '+'<s:property value="farmer.firstName"/>'+' )',
											                     messageTop: '',
											                     messageBottom: '',
											                    
											                 }
											             ]
										   }).container().appendTo($('#exportButtons_'+tableId));
								        }else{
								        	 $('#'+tableId).DataTable( {
									        	 data: dataFor_dataTable
									        });
								        }
								        	
								       }
								    }
								} 
							 }); 
			
		}
		
		function loadSeasonFilter(){
			var url = "dashboard_populateSeasonList.action";
			var name = "seasonFilter";
			var cat = $.ajax({
				url: url,
				async: false, 
				type: 'post',
				success: function(result) {
					insertOptionsByClass(name,JSON.parse(result));
				}        	

			});
			$('.select2').select2();
		}
		
		 function insertOptionsByClass(ctrlName, jsonArr) {
			
			  $("."+ctrlName).append($('<option>',{
	            	 value: "",
	                 text: "Select season"
		 }));
			 
			 $.each(jsonArr, function(i, value) {
		            $("."+ctrlName).append($('<option>',{
		            	 value: value.id,
		                 text: value.name
			 }));
		});	
		 }
		
		 function getContracteTemplate(){
			 $.ajax({
				 type: "POST",
		         async: false,
		         data:{},
		      	 url: "prefernce_getContracteTemplate",
		      	 success: function(result) {
		      		var json = jQuery.parseJSON(result);
		      		var html_str = json.templateHtml;
		      		
		      		if(html_str.includes("[:farmerName]")){
		      			html_str = html_str.replace("[:farmerName]", '<s:property value="farmer.firstName"/>');
		      		}
		      		
		      		if(html_str.includes("[:fatherName]")){
		      			html_str = html_str.replace("[:fatherName]", '<s:property value="farmer.lastName" />');
		      		}
		      		
		      		if(html_str.includes("[:village]")){
		      			html_str = html_str.replace("[:village]", '<s:property value="farmer.village.name" />');
		      		}
		      		
		      		if(html_str.includes("[:season]")){
		      			html_str = html_str.replace("[:season]", '<s:property value="getCurrentSeason()"/>');
		      		}
		      		
		      		if(html_str.includes("[:currentYear]")){
		      			html_str = html_str.replace("[:currentYear]", (new Date()).getFullYear());
		      		}
		      		
		      		if(html_str.includes("[:currentDate]")){
		      			var d = new Date();
		      			var strDate = d.getFullYear() + "/" + (d.getMonth()+1) + "/" + d.getDate();
		      			html_str = html_str.replace("[:currentDate]", strDate);
		      		}
		      		
		      		if(html_str.includes("[:farmerAge]")){
		      			html_str = html_str.replace("[:farmerAge]", '<s:property value="farmer.age"/>');
		      		}
		      		
		      		if(html_str.includes("[:digitalSignature]")){
		      			
		      			if(!isEmpty('<s:property value="digitalSignatureByteString"/>') && '<s:property value="digitalSignatureByteString"/>' != null){
		      				html_str = html_str.replace("[:digitalSignature]", '<img border="0" width="150px" height="100px" src="data:image/png;base64,<s:property value="digitalSignatureByteString"/>">');
		      			}else{
		      				html_str = html_str.replace("[:digitalSignature]","");
		      			}
		      			
		      		}
		      		
		      		//var win = window.open("", "Title", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=780,height=200,top="+(screen.height-400)+",left="+(screen.width-840));
		      		var win = window.open();
		      		win.document.body.innerHTML = html_str;
		      		//win.print();
		      		
		       }
			});
		 }
		 
		function populateFarmerDataForUpdate(){
			$(".detailField").hide();
			$(".inputField").show();
			
			var firstName = '<s:property value="farmer.firstName" />';
			var lastName = '<s:property value="farmer.lastName" />';
			var surName = '<s:property value="farmer.surName" />';
			var gender = '<s:property value="farmer.gender" />';
			
			$('[name="farmer.firstName"]').val(firstName);
			$('[name="farmer.lastName"]').val(lastName);
			$('[name="farmer.surName"]').val(surName);
			$('[name="farmer.gender"]').val(gender);
			
		 }
		 
	</script>
	<div class="row">
		<div class="card">
			<div class="card-body">

				<!-- Nav tabs -->
				<ul class="nav nav-pills nav-justified" role="tablist">
					<li class="nav-item waves-effect waves-light"><a
			class="nav-link active  border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill"
			href="#farmer-tabs">
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
				class="nav-text font-size-lg py-2 font-weight-bold text-center">Farmer
					Details</span>
		</a></li>
					<li class="nav-item waves-effect waves-light"><a
			class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill"
			href="#farm-tabs">
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
				class="nav-text font-size-lg py-2 font-weight-bolder text-center">Farm
					Details</span>
		</a></li>
					<li class="nav-item waves-effect waves-light"><a
			class="nav-link border py-10 d-flex flex-grow-1 rounded flex-column align-items-center"
			data-toggle="pill"
			href="#sowing-tabs">
				<span class="nav-icon py-2 w-auto"> <span
					class="svg-icon svg-icon-3x"> <!--begin::Svg Icon | path:/metronic/theme/html/demo3/dist/assets/media/svg/icons/Media/Movie-Lane2.svg-->
						<svg xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
							height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
								fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
								d="M6,3 L18,3 C19.1045695,3 20,3.8954305 20,5 L20,19 C20,20.1045695 19.1045695,21 18,21 L6,21 C4.8954305,21 4,20.1045695 4,19 L4,5 C4,3.8954305 4.8954305,3 6,3 Z M5.5,5 C5.22385763,5 5,5.22385763 5,5.5 L5,6.5 C5,6.77614237 5.22385763,7 5.5,7 L6.5,7 C6.77614237,7 7,6.77614237 7,6.5 L7,5.5 C7,5.22385763 6.77614237,5 6.5,5 L5.5,5 Z M17.5,5 C17.2238576,5 17,5.22385763 17,5.5 L17,6.5 C17,6.77614237 17.2238576,7 17.5,7 L18.5,7 C18.7761424,7 19,6.77614237 19,6.5 L19,5.5 C19,5.22385763 18.7761424,5 18.5,5 L17.5,5 Z M5.5,9 C5.22385763,9 5,9.22385763 5,9.5 L5,10.5 C5,10.7761424 5.22385763,11 5.5,11 L6.5,11 C6.77614237,11 7,10.7761424 7,10.5 L7,9.5 C7,9.22385763 6.77614237,9 6.5,9 L5.5,9 Z M17.5,9 C17.2238576,9 17,9.22385763 17,9.5 L17,10.5 C17,10.7761424 17.2238576,11 17.5,11 L18.5,11 C18.7761424,11 19,10.7761424 19,10.5 L19,9.5 C19,9.22385763 18.7761424,9 18.5,9 L17.5,9 Z M5.5,13 C5.22385763,13 5,13.2238576 5,13.5 L5,14.5 C5,14.7761424 5.22385763,15 5.5,15 L6.5,15 C6.77614237,15 7,14.7761424 7,14.5 L7,13.5 C7,13.2238576 6.77614237,13 6.5,13 L5.5,13 Z M17.5,13 C17.2238576,13 17,13.2238576 17,13.5 L17,14.5 C17,14.7761424 17.2238576,15 17.5,15 L18.5,15 C18.7761424,15 19,14.7761424 19,14.5 L19,13.5 C19,13.2238576 18.7761424,13 18.5,13 L17.5,13 Z M17.5,17 C17.2238576,17 17,17.2238576 17,17.5 L17,18.5 C17,18.7761424 17.2238576,19 17.5,19 L18.5,19 C18.7761424,19 19,18.7761424 19,18.5 L19,17.5 C19,17.2238576 18.7761424,17 18.5,17 L17.5,17 Z M5.5,17 C5.22385763,17 5,17.2238576 5,17.5 L5,18.5 C5,18.7761424 5.22385763,19 5.5,19 L6.5,19 C6.77614237,19 7,18.7761424 7,18.5 L7,17.5 C7,17.2238576 6.77614237,17 6.5,17 L5.5,17 Z"
								fill="#000000" opacity="0.3"></path>
																			<path
								d="M11.3521577,14.5722612 L13.9568442,12.7918113 C14.1848159,12.6359797 14.2432972,12.3248456 14.0874656,12.0968739 C14.0526941,12.0460053 14.0088196,12.002002 13.9580532,11.9670814 L11.3533667,10.1754041 C11.1258528,10.0189048 10.8145486,10.0764735 10.6580493,10.3039875 C10.6007019,10.3873574 10.5699997,10.4861652 10.5699997,10.5873545 L10.5699997,14.1594818 C10.5699997,14.4356241 10.7938573,14.6594818 11.0699997,14.6594818 C11.1706891,14.6594818 11.2690327,14.6290818 11.3521577,14.5722612 Z"
								fill="#000000"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
				</span>
			</span> <span
				class="nav-text font-size-lg py-2 font-weight-bolder text-center">Sowing
					Details</span>
		</a></li>
					
				</ul>


				<!-- Tab panes -->
				<div class="tab-content p-3 text-muted">
					<div class="tab-pane active" id="farmer-tabs" role="tabpanel">
						<s:form name="form">
							<s:hidden key="currentPage" />
							<s:hidden key="farmer.id" id="farmerId" class='uId' />
							<s:hidden key="command" />
							<s:hidden key="farmerAndContractStatus" />
							<div class="error">
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
															<s:property value="%{getLocaleProperty('info.personal')}" />
														</h3>
														<div class="wizard-desc">Setup Farmer Basic
															Information Details</div>
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
												<label for="txt"> <s:property
														value="%{getLocaleProperty('farmer.farmerCode')}" /><sup
													style="color: red;">*</sup>
												</label>
												<div class="">
													<p class="form-control detailField" name="farmer.farmerCode">
													<s:property value="farmer.farmerCode" />
												</p>
												</div>
											</div>
										</div>
										
										<div class="col-md-4">
											<div class="dynamic-flexItem2">
												<p class="form-group nameLab">
													<s:property
														value="%{getLocaleProperty('farmer.firstName')}" />
												</p>
												<p class="form-control detailField" name="farmer.firstName">
													<s:property value="farmer.firstName" />
												</p>

												<s:textfield id="firstName" name="farmer.firstName"
													maxlength="50" onkeypress="return isAlphabet(event)"
													cssClass="upercls form-control inputField" />

											</div>

										</div>
										
										<div class="col-md-4">
											<p class="form-group">
												<s:property value="%{getLocaleProperty('farmer.lastName')}" />
											</p>
											<p class="form-control detailField" name="farmer.lastName">
												<s:property value="farmer.lastName" />
											</p>

											<s:textfield id="lastName" name="farmer.lastName"
												maxlength="50" cssClass="upercls form-control inputField" />
										</div>
										
									</div>

									<div class="row">

										
										

										<div class="col-md-4">
											<p class="form-group">
												<s:property value="%{getLocaleProperty('farmer.surName')}" />
											</p>
											<p class="form-control detailField" name="farmer.surName">
												<s:property value="farmer.surName" />
											</p>

											<s:textfield id="surName" name="farmer.surName"
												maxlength="50" cssClass="upercls form-control inputField" />
										</div>

										<div class="col-md-4">
											<p class="form-group">
												<s:property value="%{getLocaleProperty('farmer.gender')}" />
											</p>
											<p class="form-control detailField" name="farmer.gender">
												<s:text name='%{farmer.gender}' />
											</p>

											<s:select list="genderType" listKey="key" listValue="value"
												cssClass="form-control inputField" id="gender"
												name="farmer.gender" />

										</div>
										<div class="col-md-4">
											<p class="form-group dateName">
												<s:text name="farmer.dateOfBirth" />
											</p>
											<p class="form-control font-weight-bold detailField"
												name="calendar">
												<s:property value="dateOfBirth" />
											</p>

											<s:textfield value='%{dateOfBirth}' readonly="true"
												name="calendar" onchange="calculateAge()" id="calendar"
												data-date-format="%{getGeneralDateFormat().toLowerCase()}"
												size="20" cssClass="date-picker form-control inputField" />

										</div>
										<div class="col-md-4">
											<p class="form-group">
												<s:property value="%{getLocaleProperty('farmer.age1')}" />
											</p>
											<p class="form-control" name="age">
												<s:property value="farmer.age" />
											</p>
										</div>
									</div>
								</div>
							</div>
							<div id="accordion" class="custom-accordion contact_info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#contInfo" class="text-dark" data-toggle="collapse"
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
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
																	d="M16.3740377,19.9389434 L22.2226499,11.1660251 C22.4524142,10.8213786 22.3592838,10.3557266 22.0146373,10.1259623 C21.8914367,10.0438285 21.7466809,10 21.5986122,10 L17,10 L17,4.47708173 C17,4.06286817 16.6642136,3.72708173 16.25,3.72708173 C15.9992351,3.72708173 15.7650616,3.85240758 15.6259623,4.06105658 L9.7773501,12.8339749 C9.54758575,13.1786214 9.64071616,13.6442734 9.98536267,13.8740377 C10.1085633,13.9561715 10.2533191,14 10.4013878,14 L15,14 L15,19.5229183 C15,19.9371318 15.3357864,20.2729183 15.75,20.2729183 C16.0007649,20.2729183 16.2349384,20.1475924 16.3740377,19.9389434 Z"
																	fill="#000000"></path>
																			<path
																	d="M4.5,5 L9.5,5 C10.3284271,5 11,5.67157288 11,6.5 C11,7.32842712 10.3284271,8 9.5,8 L4.5,8 C3.67157288,8 3,7.32842712 3,6.5 C3,5.67157288 3.67157288,5 4.5,5 Z M4.5,17 L9.5,17 C10.3284271,17 11,17.6715729 11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L4.5,20 C3.67157288,20 3,19.3284271 3,18.5 C3,17.6715729 3.67157288,17 4.5,17 Z M2.5,11 L6.5,11 C7.32842712,11 8,11.6715729 8,12.5 C8,13.3284271 7.32842712,14 6.5,14 L2.5,14 C1.67157288,14 1,13.3284271 1,12.5 C1,11.6715729 1.67157288,11 2.5,11 Z"
																	fill="#000000" opacity="0.3"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>

													</div>
													<div class="wizard-label">

														<h3 class="wizard-title">
															<s:property value="%{getLocaleProperty('info.cont')}" />
														</h3>
														<div class="wizard-desc">Setup Farmer Contact &
															Location Details</div>
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
											<p class="form-group individual phNumber">
												<s:property
													value="%{getLocaleProperty('farmer.phoneNumber')}" />
											</p>
											<p class="form-control" name="farmer.phoneNumber">
												<s:property value="farmer.phoneNumber" />
											</p>
										</div>
										<div class="col-md-4">
											<p class="form-group mobileNumber">
												<s:property
													value="%{getLocaleProperty('farmer.mobileNumber')}" />
											</p>
											<p class="form-control" name="farmer.mobileNumber">
												<s:property value="farmer.mobileNumber" />
											</p>
										</div>
										<div class="col-md-4">
											<p class="form-group email">
												<s:property value="%{getLocaleProperty('farmer.email')}" />
											</p>
											<p class="form-control" name="farmer.email">
												<s:property value="farmer.email" />
											</p>
										</div>
										<div class="col-md-4">
											<p class="form-group locationInfo">
												<s:property value="%{getLocaleProperty('country.name')}" />
											</p>
											<p class="form-control" name="selectedCountry">
												<s:property
													value="farmer.village.city.locality.state.country.name" />
											</p>
										</div>
										<div class="col-md-4">
											<p class="form-group locationInfo">
												<s:property value="%{getLocaleProperty('state.name')}" />
											</p>
											<p class="form-control" name="selectedState">
												<s:property value="farmer.village.city.locality.state.name" />
											</p>
										</div>
										<div class="col-md-4">
											<p class="form-group locationInfo">
												<s:property value="%{getLocaleProperty('locality.name')}" />
											</p>
											<p class="form-control" name="selectedLocality">
												<s:property value="farmer.village.city.locality.name" />
											</p>
										</div>
										<div class="col-md-4">
											<p class="form-group locationInfo">
												<s:property value="%{getLocaleProperty('city.name')}" />
											</p>
											<p class="form-control" name="selectedCity">
												<s:property value="farmer.village.city.name" />
											</p>
										</div>
										<s:if test="gramPanchayatEnable==1">
											<div class="col-md-4">
												<p class="form-group locationInfo enableGramPanchayat">
													<s:property value="%{getLocaleProperty('panchayat.name')}" />
												</p>
												<p class="form-control" name="selectedPanchayat">
													<s:property value="farmer.village.gramPanchayat.name" />
												</p>
											</div>
										</s:if>
										<div class="col-md-4">
											<p class="form-group locationInfo">
												<s:property value="%{getLocaleProperty('village.name')}" />
											</p>
											<p class="form-control" name="selectedVillage">
												<s:property value="farmer.village.name" />
											</p>
										</div>
										<div class="col-md-4">
											<p class="form-group group">
												<s:property value="%{getLocaleProperty('profile.samithi')}" />
											</p>
											<p class="form-control" name="selectedSamithi">
												<s:property value="farmer.samithi.name" />
											</p>
										</div>
									</div>
								</div>
							</div>


							<div id="accordion" class="custom-accordion farmer_info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#farmerInfo" class="text-dark" data-toggle="collapse"
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
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
																	d="M12,21 C7.02943725,21 3,16.9705627 3,12 C3,7.02943725 7.02943725,3 12,3 C16.9705627,3 21,7.02943725 21,12 C21,16.9705627 16.9705627,21 12,21 Z M14.1654881,7.35483745 L9.61055177,10.3622525 C9.47921741,10.4489666 9.39637436,10.592455 9.38694497,10.7495509 L9.05991526,16.197949 C9.04337012,16.4735952 9.25341309,16.7104632 9.52905936,16.7270083 C9.63705011,16.7334903 9.74423017,16.7047714 9.83451193,16.6451626 L14.3894482,13.6377475 C14.5207826,13.5510334 14.6036256,13.407545 14.613055,13.2504491 L14.9400847,7.80205104 C14.9566299,7.52640477 14.7465869,7.28953682 14.4709406,7.27299168 C14.3629499,7.26650974 14.2557698,7.29522855 14.1654881,7.35483745 Z"
																	fill="#000000"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>

													</div>
													<div class="wizard-label">

														<h3 class="wizard-title">
															<s:property
																value="%{getLocaleProperty('ICS Information')}" />
														</h3>
														<div class="wizard-desc">Get Farmer ICS Details</div>
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
											<p class="form-group certified">
												<s:property
													value="%{getLocaleProperty('farmer.isCertified')}" />
											</p>
											<p class="form-control" name="farmer.isCertifiedFarmer">
												<s:property
													value="isFarmerCertified[farmer.isCertifiedFarmer]" />
											</p>
										</div>


										<%-- 		<div class="col-md-4">
				<p class="form-group icsFieldSelect">
					<s:property value="%{getLocaleProperty('farmer.icsName')}" />
				</p>
				<p class="form-control" name="farmer.icsName">
					<s:property value="farmer.icsName" />
				</p>
			</div>--%>

										<div class="col-md-4">
											<p class="form-group ">
												<s:property value="%{getLocaleProperty('farmer.icsName')}" />
											</p>
											<p class="form-control" name="farmer.icsName">
												<s:property value="icsName" />
											</p>
										</div>

										<div class="col-md-4">
											<p class="form-group ">
												<s:property value="%{getLocaleProperty('farmer.icsCode')}" />
											</p>
											<p class="form-control" name="farmer.icsCode">
												<s:property value="farmer.icsCode" />
											</p>
										</div>
										<s:if test="farmer.isCertifiedFarmer==1">
											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('certification.type')}" />
												</p>
												<p class="form-control" name="farmer.certificationType">
													<s:property
														value="certificationTypes[farmer.certificationType]" />
												</p>
											</div>
										</s:if>

									</div>
								</div>
							</div>

							<div id="accordion" class="custom-accordion other_info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#otherInfo" class="text-dark" data-toggle="collapse"
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
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
																	d="M19,11 L21,11 C21.5522847,11 22,11.4477153 22,12 C22,12.5522847 21.5522847,13 21,13 L19,13 C18.4477153,13 18,12.5522847 18,12 C18,11.4477153 18.4477153,11 19,11 Z M3,11 L5,11 C5.55228475,11 6,11.4477153 6,12 C6,12.5522847 5.55228475,13 5,13 L3,13 C2.44771525,13 2,12.5522847 2,12 C2,11.4477153 2.44771525,11 3,11 Z M12,2 C12.5522847,2 13,2.44771525 13,3 L13,5 C13,5.55228475 12.5522847,6 12,6 C11.4477153,6 11,5.55228475 11,5 L11,3 C11,2.44771525 11.4477153,2 12,2 Z M12,18 C12.5522847,18 13,18.4477153 13,19 L13,21 C13,21.5522847 12.5522847,22 12,22 C11.4477153,22 11,21.5522847 11,21 L11,19 C11,18.4477153 11.4477153,18 12,18 Z"
																	fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<circle fill="#000000" opacity="0.3" cx="12" cy="12"
																	r="2"></circle>
																			<path
																	d="M12,17 C14.7614237,17 17,14.7614237 17,12 C17,9.23857625 14.7614237,7 12,7 C9.23857625,7 7,9.23857625 7,12 C7,14.7614237 9.23857625,17 12,17 Z M12,19 C8.13400675,19 5,15.8659932 5,12 C5,8.13400675 8.13400675,5 12,5 C15.8659932,5 19,8.13400675 19,12 C19,15.8659932 15.8659932,19 12,19 Z"
																	fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>

													</div>
													<div class="wizard-label">

														<h3 class="wizard-title">
															<s:property
																value="%{getLocaleProperty('Other Information')}" />
														</h3>
														<div class="wizard-desc">Get Other Details</div>
													</div>
												</div>
												<i
													class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
											</h6>
										</div>
									</a>

								</div>
								<div id="otherInfo" class="collapse show"
									aria-labelledby="headingFour data-parent="#accordion">
									<div class="card-body">

										<div class="row">


											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.noOfFamilyMembers.prop')}" />
												</p>
												<p class="form-control" name="farmer.noOfFamilyMembers">
													<s:property value="farmer.noOfFamilyMembers" />
												</p>
											</div>

											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.housingOwnershipProp')}" />
												</p>

												<p class="form-control"
													name="farmer.farmerEconomy.housingOwnershipOther">
													<s:property
														value="farmer.farmerEconomy.housingOwnershipOther" />
												</p>




											</div>



											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.housingTypeProp')}" />
												</p>
												<p class="form-control"
													name="farmer.farmerEconomy.housingType">
													<s:property
														value="housingTypeList[farmer.farmerEconomy.housingType]" />
												</p>
											</div>




											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.drinkingWSProp')}" />
												</p>
												<p class="form-control"
													name="farmer.farmerEconomy.drinkingWaterSource">
													<s:property
														value="farmer.farmerEconomy.drinkingWaterSource" />
												</p>
											</div>
											<div class="col-md-4">
												<p class="form-group ">
													<s:property value="%{getLocaleProperty('farmer.life')}" />
												</p>
												<p class="form-control" name="farmer.lifeInsurance">
													<s:property value="farmer.lifeInsurance" />
												</p>
											</div>
											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.isLoanTakenLastYearProp')}" />
												</p>
												<p class="form-control" name="farmer.loanTakenLastYear">
													<s:if test="farmer.loanTakenLastYear==1">
														<s:text name="yes" />
													</s:if>

													<s:else>
														<s:text name="no" />
													</s:else>
												</p>
											</div>
										</div>



									</div>
								</div>


							</div>

							<!-- bank info start -->
							<div id="accordion" class="custom-accordion other_info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#bankInfo" class="text-dark" data-toggle="collapse"
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
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
																	d="M19,11 L21,11 C21.5522847,11 22,11.4477153 22,12 C22,12.5522847 21.5522847,13 21,13 L19,13 C18.4477153,13 18,12.5522847 18,12 C18,11.4477153 18.4477153,11 19,11 Z M3,11 L5,11 C5.55228475,11 6,11.4477153 6,12 C6,12.5522847 5.55228475,13 5,13 L3,13 C2.44771525,13 2,12.5522847 2,12 C2,11.4477153 2.44771525,11 3,11 Z M12,2 C12.5522847,2 13,2.44771525 13,3 L13,5 C13,5.55228475 12.5522847,6 12,6 C11.4477153,6 11,5.55228475 11,5 L11,3 C11,2.44771525 11.4477153,2 12,2 Z M12,18 C12.5522847,18 13,18.4477153 13,19 L13,21 C13,21.5522847 12.5522847,22 12,22 C11.4477153,22 11,21.5522847 11,21 L11,19 C11,18.4477153 11.4477153,18 12,18 Z"
																	fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<circle fill="#000000" opacity="0.3" cx="12" cy="12"
																	r="2"></circle>
																			<path
																	d="M12,17 C14.7614237,17 17,14.7614237 17,12 C17,9.23857625 14.7614237,7 12,7 C9.23857625,7 7,9.23857625 7,12 C7,14.7614237 9.23857625,17 12,17 Z M12,19 C8.13400675,19 5,15.8659932 5,12 C5,8.13400675 8.13400675,5 12,5 C15.8659932,5 19,8.13400675 19,12 C19,15.8659932 15.8659932,19 12,19 Z"
																	fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>

													</div>
													<div class="wizard-label">

														<h3 class="wizard-title">
															<s:property
																value="%{getLocaleProperty('Bank Information')}" />
														</h3>
														<div class="wizard-desc">Get Farmer Bank Information
															Details</div>
													</div>
												</div>
												<i
													class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
											</h6>
										</div>
									</a>

								</div>
								<div id="bankInfo" class="collapse show"
									aria-labelledby="headingFour data-parent="#accordion">
									<div class="card-body">

										<div class="row">


											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.bankInfo.AccountTypeProp')}" />
												</p>
												<p class="form-control" name="farmer.noOfFamilyMembers">
													<s:property value="bankAccType" />
												</p>
											</div>

											<div class="col-md-4">
												<p class="form-group ">
													<s:text name="farmer.bankInfo.accName" />
												</p>

												<p class="form-control"
													name="farmer.farmerEconomy.housingOwnershipOther">
													<s:property value="accName" />
												</p>




											</div>



											<div class="col-md-4">
												<p class="form-group ">
													<s:text name="farmer.bankInfo.accNo" />
												</p>
												<p class="form-control"
													name="farmer.farmerEconomy.housingType">
													<s:property value="accNo" />
												</p>
											</div>




											<div class="col-md-4">
												<p class="form-group ">
													<s:text name="farmer.bankInfo.bankName" />
												</p>
												<p class="form-control"
													name="farmer.farmerEconomy.drinkingWaterSource">
													<s:property value="bankName" />
												</p>
											</div>
											<div class="col-md-4">
												<p class="form-group ">
													<s:text name="farmer.bankInfo.branchName" />
												</p>
												<p class="form-control" name="farmer.lifeInsurance">
													<s:property value="bankBranchName" />
												</p>
											</div>

											<div class="col-md-4">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.bankInfo.sortCode')}" />
												</p>
												<p class="form-control" name="farmer.lifeInsurance">
													<s:property value="sortCode" />
												</p>
											</div>

										</div>



									</div>
								</div>


							</div>
							<!-- bank info end  -->

							<!-- images start -->

							<div id="accordion" class="custom-accordion other_info">
								<div class="card-header card mb-1 shadow-none">
									<a href="#imageInfo" class="text-dark" data-toggle="collapse"
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
																			<rect x="0" y="0" width="24" height="24"></rect>
																			<path
																	d="M19,11 L21,11 C21.5522847,11 22,11.4477153 22,12 C22,12.5522847 21.5522847,13 21,13 L19,13 C18.4477153,13 18,12.5522847 18,12 C18,11.4477153 18.4477153,11 19,11 Z M3,11 L5,11 C5.55228475,11 6,11.4477153 6,12 C6,12.5522847 5.55228475,13 5,13 L3,13 C2.44771525,13 2,12.5522847 2,12 C2,11.4477153 2.44771525,11 3,11 Z M12,2 C12.5522847,2 13,2.44771525 13,3 L13,5 C13,5.55228475 12.5522847,6 12,6 C11.4477153,6 11,5.55228475 11,5 L11,3 C11,2.44771525 11.4477153,2 12,2 Z M12,18 C12.5522847,18 13,18.4477153 13,19 L13,21 C13,21.5522847 12.5522847,22 12,22 C11.4477153,22 11,21.5522847 11,21 L11,19 C11,18.4477153 11.4477153,18 12,18 Z"
																	fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
																			<circle fill="#000000" opacity="0.3" cx="12" cy="12"
																	r="2"></circle>
																			<path
																	d="M12,17 C14.7614237,17 17,14.7614237 17,12 C17,9.23857625 14.7614237,7 12,7 C9.23857625,7 7,9.23857625 7,12 C7,14.7614237 9.23857625,17 12,17 Z M12,19 C8.13400675,19 5,15.8659932 5,12 C5,8.13400675 8.13400675,5 12,5 C15.8659932,5 19,8.13400675 19,12 C19,15.8659932 15.8659932,19 12,19 Z"
																	fill="#000000" fill-rule="nonzero"></path>
																		</g>
																	</svg> <!--end::Svg Icon-->
														</span>

													</div>
													<div class="wizard-label">

														<h3 class="wizard-title">
															<s:property value="%{getLocaleProperty('Image Info')}" />
														</h3>
														<div class="wizard-desc">Farmer photo and Id proof
															photo</div>
													</div>
												</div>
												<i
													class="mdi mdi-minus float-right accor-plus-icon collapse-icon-custom"></i>
											</h6>
										</div>
									</a>

								</div>
								<div id="imageInfo" class="collapse show"
									aria-labelledby="headingFour data-parent="#accordion">
									<div class="card-body">

										<div class="row">


											<div class="col-md-6">
												<p class="form-group ">
													<s:property value="%{getLocaleProperty('farmer.photo')}" />
												</p>

												<img src=<s:property value="farmerImageByteString" /> alt=""
													class="img-fluid mx-auto d-block"
													data-zoom="assets/images/product/img-1.png">

												<p id="latlonStr">
													<s:property value="farmer.latitude" />
													:
													<s:property value="farmer.longitude" />
												</p>
											</div>

											<div class="col-md-6">
												<p class="form-group ">
													<s:property
														value="%{getLocaleProperty('farmer.idProofImg')}" />
												</p>

												<img src=<s:property value="idProofImgString" /> alt=""
													class="img-fluid mx-auto d-block"
													data-zoom="assets/images/product/img-1.png">

												<p id="idProofStr">
													<s:property value="idProofCatalogueName" />
													:
													<s:property value="farmer.proofNo" />
												</p>

											</div>

										</div>



									</div>
								</div>
							</div>


							<!-- images end  -->

							<!-- id proof string start -->

							<!-- id proof string end -->

							<div class="dynamicFieldsRender"></div>
							<div class="button-items float-right">
								<sec:authorize ifAllGranted="profile.farmer.update">
									<button type="button" id="update"
										class="btn btn-success waves-effect waves-light">
										<i class="ri-check-line align-middle mr-2"></i>Edit
									</button>

								</sec:authorize>

								<sec:authorize ifAllGranted="profile.farmer.delete">
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

							</div>

						</s:form>
					</div>
					<s:form name="updatfrm" action="farmer_update.action">
						<s:hidden key="id" />
						<s:hidden name="farmerName" value="%{farmerName}" />
						<s:hidden name="farmerCode" value="%{farmerCode}" />
						<s:hidden key="currentPage" />
						<s:hidden name="type" class="type" />
					</s:form>
					<s:form name="deleteform" action="farmer_delete.action">
						<s:hidden key="id" />
						<s:hidden key="farmerImageByteString" />
						<s:hidden key="currentPage" />
					</s:form>
					<s:form name="approveform" action="farmer_approve.action">
						<s:hidden key="id" />
						<s:hidden key="farmerImageByteString" />
						<s:hidden key="currentPage" />
					</s:form>

					<s:form id="cancelform" name="cancelform"
						action="farmer_list.action">
						<s:hidden key="id" />
						<s:hidden key="currentPage" />
						<s:hidden name="postdata" id="postdata" />
					</s:form>
					<s:form name="redirectform"
						action="distributionAgentLogin_execute.action" method="get">
						<s:hidden key="type" value="distribution" id='type' />
						<s:hidden key="fId" />
					</s:form>
					<div class="tab-pane" id="farm-tabs" role="tabpanel">
						<div id="errorDiv" style="color: red;">
							<s:if test='#session.farmcropsExist!=null'>
								<ul style="list-style-type:">
									<li><%=(String) request.getSession().getAttribute("farmcropsExist")%>
									</li>
								</ul>
							</s:if>
							<%
								request.getSession().removeAttribute("farmcropsExist");
							%>
						</div>

						<sec:authorize ifAllGranted="profile.farmer.create">
							<button type="BUTTON" id="add"
								onclick="document.createform.submit()"
								class="btn btn-success mb-2 float-right">
								Add Farm<i class="ri-menu-add-line align-middle ml-2"></i>
							</button>
						</sec:authorize>
						<div>
							<div class="table-responsive mt-3" id="baseDiv1">
								<table
									class="table table-centered datatable dt-responsive nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;"
									id="detail1"></table>
								<div id="pagerForDetail1"></div>
							</div>
						</div>
						<s:form name="createform" action="farm_create">
							<s:hidden name="farmerId" value="%{farmer.farmerId}" />
							<s:hidden name="farmerUniqueId" value="%{farmer.id}" />
							<s:hidden name="farmerName" value="%{farmer.name}" />
							<s:hidden name="sangham" value="%{farmer.sangham}" />
							<s:hidden name="branch" value="%{farmer.branchId}" />
							<s:hidden name="tabIndex" />
							<s:hidden key="currentPage" />
						</s:form>

						<s:form name="farmdetailform" action="farm_detail">
							<s:hidden name="farmerId" value="%{farmer.farmerId}" />
							<s:hidden name="farmerUniqueId" value="%{farmer.id}" />
							<s:hidden name="sangham" value="%{farmer.sangham}" />
							<s:hidden name="id" />
							<s:hidden name="tabIndex" />
							<s:hidden key="currentPage" />
						</s:form>

						<s:form name="farmupdatfrm" action="farm_update">
							<s:hidden name="farmerId" value="%{farmer.farmerId}" />
							<s:hidden name="farmerUniqueId" value="%{farmer.id}" />
							<s:hidden name="farmerName" value="%{farmer.name}" />
							<s:hidden name="sangham" value="%{farmer.sangham}" />
							<s:hidden name="id" />
							<s:hidden name="tabIndex" />
							<s:hidden key="currentPage" />
						</s:form>

						<s:form name="farmdeleteform" action="farm_delete">
							<s:hidden name="farmerId" value="%{farmer.farmerId}" />
							<s:hidden name="sangham" value="%{farmer.sangham}" />
							<s:hidden name="id" />
							<s:hidden name="tabIndex" />
						</s:form>
					</div>
					<div class="tab-pane" id="sowing-tabs" role="tabpanel">


						<sec:authorize ifAllGranted="profile.farmer.create">
							<button type="BUTTON" id="add" onclick="addfarmCrop()"
								class="btn btn-success mb-2 float-right">
								Add Farm Crop<i class="ri-menu-add-line align-middle ml-2"></i>
							</button>
						</sec:authorize>


						<div>
							<div class="table-responsive mt-3" id="baseDiv">
								<table
									class="table table-centered datatable dt-responsive nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;"
									id="cropDetail"></table>
								<div id="cropPagerForDetail"></div>
							</div>
						</div>


						<s:form name="cropCreateform" action="farmCrops_create.action">
							<s:hidden name="farmId" value="%{farm.id}" />
							<s:hidden name="farmName" value="%{farm.farmName}" />
							<s:hidden name="farmerId" value="%{farmer.id}" />
							<s:hidden name="farmerName" value="%{farm.farmer.name}" />
							<s:hidden name="branch" value="%{farm.farmer.branchId}" />
							<%-- <s:hidden name="tabIndexz" value="#tabs-5" /> --%>
							<s:hidden key="currentPage" />
						</s:form>

						<s:form name="detailfarmCrops" action="farmCrops_detail">
							<s:hidden name="farmId" value="%{farm.id}" />
							<s:hidden name="farmerId" value="%{farm.farmer.farmerId}" />
							<s:hidden name="farmerName" value="%{farm.farmer.name}" />
							<s:hidden name="farmName" value="%{farm.farmName}" />
							<s:hidden name="tabIndexz" value="#tabs-3" />
							<s:hidden name="tabIndex" />
							<s:hidden key="currentPage" />
							<s:hidden name="id" />
						</s:form>

					</div>
				
				</div>

			</div>
		</div>
	</div>
	<!-- JAVASCRIPT -->
	<script src="assets/libs/jquery/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/libs/metismenu/metisMenu.min.js"></script>
	<script src="assets/libs/simplebar/simplebar.min.js"></script>
	<script src="assets/libs/node-waves/waves.min.js"></script>

	<script src="assets/js/app.js"></script>

	<script src="plugins/jqgrid/js/i18n/grid.locale-en.js"
		type="text/javascript"></script>
	<script src="plugins/jqgrid/js/jquery.jqGrid.min.js"
		type="text/javascript"></script>
</body>


