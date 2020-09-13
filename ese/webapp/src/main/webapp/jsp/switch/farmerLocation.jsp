<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ include file="/jsp/common/form-assets.jsp"%>


<script src="js/farmer.js?v=3.9"></script>
<head>
<META name="decorator" content="swithlayout">
</head>

<body>
<div class="appContentWrapper dashboardPage" style="height: 100% !Important;">
		<div class="mapWrapper">
			<div class="mapOverlay">
				<div class="popUpWrapper">
					<div class="popupWidget">
						<div class="close">
							<a href="#"> <i class="fa fa-times"></i>
							</a>
						</div>
						<div class="popupheader">
							<div class="frmrImageWrapper">
								<img border="0" id="farmerImage" width="115px" height="115px"/>
							</div>
							<div class="lstEdtTxt"></div>
						</div>
						<div class="popupContent">
							<div class="frmrNameWrapper">
								<h4 class="farmerName"></h4>
								<h6 class="farmerId"></h6>
							</div>
							<div class="crpDetailsWrapper cropInfo">
								<div class="crpDetails column">
									<div class="crpIcnImg">
										<img src="img/plant.png" />
									</div>
									<div class="crpTxt">
										<h4 class="cropNameTxt">
											<s:property value="%{getLocaleProperty('crop')}" />
										</h4>
										<h6 class="cropName"></h6>
									</div>
								</div>
								<div class="crpAreaDetails column">
									<div class="crpIcnImg">
										<img src="img/map.png" />
									</div>
									<div class="crpTxt">
										<h4 class="cropAreaTxt">
											<s:property value="%{getLocaleProperty('Total Area(Acre)')}" />
										</h4>
										<h6 class="cropArea"></h6>
									</div>
								</div>

							</div>

							<div class="farmerDetailsWrapper column">
								<ul>
									<li>

									
										<div class="column">
											<p class="">
												<strong><s:property
														value="%{getLocaleProperty('farmName')}" /></strong> <span
													class="farmName"></span>
											</p>
										</div>
										
											<div class="column">
											<p class="">
												<strong><s:property
														value="%{getLocaleProperty('village')}" /></strong> <span
													class="village"></span>
											</p>
										</div>
										
									</li>
								
									<li>
									
										
										<div class="column estHavstDateInfo">
											<p class="">
												<strong><s:property
														value="%{getLocaleProperty('estHavstDate')}" /></strong> <span
													class="estHavstDate"></span>
											</p>
										</div>
										
												
										<div class="column estYieldInfo">
											<p class="">
												<strong><s:property
														value="%{getLocaleProperty('estYield')}" /></strong> <span
													class="estYield"></span>
											</p>
										</div>
									
                                
										   
									</li>
									<li>
									 
										<div class="column totalLandInfo">
											<p class="">
												<strong><s:property
														value="%{getLocaleProperty('totalLandHolding')}" /></strong> <span
													class="totalLandHold"></span>
											</p>
										</div>
										<div class="column">
											<p class="">
												<strong><s:property
														value="%{getLocaleProperty('havstSeason')}" /></strong> <span
													class="cropSeason"></span>
											</p>
										</div>
								
									</li>
		

								</ul>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 <div id="map" class="customGMap"></div>
                                
	<script>
		var map;
		var markersArray = new Array();
		var isGramPanchayatEnable = 0;
		var longtitude="<s:property value='getLongtitude()'/>";
		var latitude="<s:property value='getLatitude()'/>";
		function initMap() {
			if(isEmpty(longtitude)|| isEmpty(latitude)|| latitude==''||longtitude==''){
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 11.0168,
				     lng : 76.9558
				},
				zoom :7,
				mapTypeId: google.maps.MapTypeId.HYBRID,
			});
			}
			else{
				map = new google.maps.Map(document.getElementById('map'), {
					center : {
					     lat : parseFloat(latitude),
						 lng : parseFloat(longtitude)
					},
					zoom :7,
					mapTypeId: google.maps.MapTypeId.HYBRID,
				});
			}
			

		}
		

		$(document).ready(function () {
			var tenantId='<s:property value="getCurrentTenantId()"/>';

			
			loadDefMap();
			//onFilterData();
			//loadFields()
			
			var winHeight = window.innerHeight - $('.headerBar').height()-500;
		    //alert($('.footerWrapper').height());
		   
		   var dashboardHeight = ($('.dashboardPageWrapper').height()+20);
		  // alert($('.dashboardPageWrapper').height());
		    $('.dashboardPage').height(dashboardHeight);
		    $('.column-left').height(dashboardHeight);
		    $('.column-right').height(dashboardHeight);
		   
           	jQuery.post("farmerLocation_populateHideFields.action", {}, function(result) {
    			var farmerLocHideFields = jQuery.parseJSON(result);
    			
    			$.each(farmerLocHideFields, function(index, value) {
    				if(value.type=='0'){
						hideByEleClass(value.typeName);
 						$("."+value.typeName).remove();
					}
    				if(value.type=='1'){
    					showByEleClass(value.typeName);
					}
				/* 	 if(value.type=='4'){
 						hideByEleClass(value.typeName);
 						$("."+value.typeName).remove();
 					}
					 if(value.type=='5'){
	 						hideByEleId(value.typeName);
	 						$("."+value.typeName).remove();
	 					} */
    			});
    			
    	    });
           	$('.close').click(function() {
        		$(".mapOverlay").hide();
        		});
		});
		
	      function showByEleClass(className){
          	$("."+className).closest( ".flexform-item" ).removeClass( "hide" );
          }

          function hideByEleId(id){
          	$("#"+id).closest( ".flexform-item" ).addClass( "hide" );
          }
          
          function hideByEleClass(className){
          	$("."+className).closest( ".flexform-item" ).addClass( "hide" );
          }
          
          function showByEleId(id){
          	$("#"+id).closest( ".flexform-item" ).removeClass( "hide" );
          }

  
		function loadFarms(obj) {
			setMapOnAll(null);   
			jQuery.post("farmerLocation_populateFarmList.action", {
				selectedFarmer : selectedFarmer,
				dt : new Date()
			}, function(result) {
				insertOptions("farm", jQuery.parseJSON(result));
			});
		}
		

		function loadDefMap(){
			//alert("Called loadDefMap");
			setMapOnAll(null);   
			var geoJs = {};
			geoJs['type']="FeatureCollection";
			var feature = [];
			var dataArr = new Array();
			var state = $("#state").val();
			var locality = $("#localities").val();
			var village = $("#village").val();
			var taluk = $("#division").val();
			var crop = $("#crop").val();
			var season = $("#season").val();
			var organicStatus = $("#organicStatus").val();
			var status = $("#status").val();
			var farmer = $("#farmer").val();
			//alert(farmer);
			var yieldEstimation = $("#yieldEstimation").val();
			$.post('farmerLocation_populateFarmsMap', {
				selectedState : state,
				selectedLocality : locality,
				selectedVillage : village,
				selectedTaluk : taluk,
				selectedCrop : crop,
				selectedSeason:season,
				selectedOrganicStatus:organicStatus,
				selectedFarmer:farmer,
				yieldEstimation:yieldEstimation,
				selectedStatus:status
			}, function(data) {
				//alert(data);
				var arry = JSON.parse(data);
				if (arry.length > 0) {
					$(arry).each(function(k, v) {
						
						 
						if(!isEmpty(v.latitude)&&!isEmpty(v.longtitude)){
							var url = window.location.href;
							
							var temp = url;
			
							 for(var i = 0 ; i < 1 ; i++) {
								  temp = temp.substring(0, temp.lastIndexOf('/'));
							 } 
						
							if(v.certified==0){
								intermediateImg = "marker.png";
								 intermediatePointIcon = temp + '/img/'+intermediateImg;
							}else{
								if(v.organicStatus!=null && v.organicStatus!='' ){
									if(v.certified==1 && v.organicStatus=='3' ) {
										intermediateImg = "marker.png";
										 intermediatePointIcon = temp + '/img/'+intermediateImg;
									}else {
										intermediateImg = "marker.png";
										 intermediatePointIcon = temp + '/img/'+intermediateImg;
									}
								}
								
								
							}
							  
							feature.push({
								"type": "Feature",    
								"properties": {   
									"name": "Coors Field",    
									"show_on_map": true,
									 
									"dta" : v,
									 "icon": intermediatePointIcon,
									},  
								 "geometry": {  
									 "type": "Point",
									 "icon": intermediatePointIcon,
									 "coordinates" : [parseFloat(v.longtitude),parseFloat(v.latitude)]
									 
								 }
									
							});
								
							    	
							dataArr.push({
								latitude : parseFloat(v.latitude),
								longitude : parseFloat(v.longtitude),
								farmerName:v.farmerName,
								farmName:v.farmName,
								village:v.village,
								landmark:v.landmark,
								//totalLand:v.totalLand,
								//proposedLand:v.proposedLand,
								samithi:v.samithi,
								img:v.image,
								id:v.id,
								farmCode:v.farmCode,
								farmId:v.farmId,
								certified:v.certified,
								organicStatus:v.organicStatus
							});
						}
					});
				}
			geoJs["features"]=feature;
			
				loadGeoJSON(geoJs);
				  
				//loadMap(dataArr);
			});
			
		}
		function loadGeoJSON(jsData){
			
			setMapOnAll(null);   
			map.data.setStyle(function(feature) {
			    var icon = null;
			    if (feature.getProperty('icon')) {
			      icon = feature.getProperty('icon');
			    }
			    return /** @type {google.maps.Data.StyleOptions} */ ({
			      icon: icon
			    });
			 });
		
			map.data.forEach(function(feature) {
				  
			    map.data.remove(feature);
			}); 
		
			 map.data.addGeoJson(jsData);
			 map.data.addListener('click', function(event) {
				 var v = event.feature.getProperty('dta');
					
					var village = $("#village").val();
					var taluk = $("#division").val();
					var crop = $("#crop").val();
					var season = $("#season").val();
					    	$.post('farmerLocation_populateImg', {
					    		farmerId : v.id,
					    		farmCode : v.farmCode,
					    		farmId : v.farmId,
					    		selectedVillage : village,
								selectedTaluk : taluk,
								selectedCrop : crop,
								selectedSeason:season
								
							}, function(data) {
					    	var arry = JSON.parse(data);
					    	resetCropDetails();
					    	
							if (arry.length > 0) {
								$(arry).each(function(k, v) {
									$(".mapOverlay").show();
										if(!isEmpty(v)){
										if (v.doj !== undefined)
											{	$(".lstEdtTxt").text(
													"Enrolled on "
													+ v.doj);
											}
									
										$(".farmerName").text(
												v.farmerName);
										$(".farmerId").text(
												v.farmerId);
										$(".cropArea").text(
												v.proposedLand);
										$(".cropName").text(
												v.cropName);
										$(".farmName").text(
												v.farmName);
										$(".group").text(v.samithi);
										$(".inspDate").text(
												v.inspDate);
										$(".inspectedBy").text(
												v.inspectedBy);
										$(".village").text(
												v.village);
										if (v.estHavstDate !== undefined && v.estHavstDate!='null' )
											{
											$(".estHavstDate").text(
													v.estHavstDate);
											}
										
										$(".estYield").text(
												v.estYield);
										$(".cropSeason").text(
												v.cropSeason);
										$(".branch").text(v.branch);
										$(".cropArea").text(v.totalLand);
										$(".icsType").text(
												v.icsType);
											if(v.image!=null)
									    	{
									    			$("#farmerImage").attr('src',v.image);
									    	}
									    	else
											{
												$("#farmerImage").attr('src',"img/no-img.png");
											}
									}
								});
							}
					   
					});
					
					
					
					
					if(v.id!=null && v.id!=0)
						{
						
							$("#farmerIdHidn").val(v.id);
																				
						}
				});
					
			
		}
		function resetForm(){
			$("#division").val("-1");
			$("#village").val("");
			$(".select2").select2();
			setMapOnAll(null);
			//loadDefMap();
		}
		
		 function setMapOnAll(map) {
		        for (var i = 0; i < markersArray.length; i++) {
		        	markersArray[i].setMap(map);
		        }
		        markersArray = new Array();
		 }

		function loadVillage() {
			var talukId = $("#division").val();
			jQuery.post("farmerLocation_populateVillageByCity.action", {
				selectedTaluk : talukId
			}, function(result) {
				insertOptions("village", $.parseJSON(result));
			});
		}

	
		function getRandomColor() {
			var letters = '0123456789ABCDEF';
			var color = '#';
			for (var i = 0; i < 6; i++) {
				color += letters[Math.floor(Math.random() * 16)];
			}
			return color;
		}

		
		function resetCropDetails()
		{
			$(".lstEdtTxt").text('');
			$(".farmerName").text('');
			$(".farmerId").text('');
			$(".cropArea").text('');
			$(".cropName").text('');
			$(".farmName").text('');
			$(".group").text('');
			$(".village").text('');
			$(".estHavstDate").text('');
			$(".estYield").text('');
			$(".cropSeason").text('');
			$(".branch").text('');
			$(".cropArea").text('');
			$(".inspDate").text('');
			$(".inspectedBy").text('');
			$(".icsType").text('');
			$("#farmer").text('');
		}
		
		 function buildDataOnMouseHover(v)
			{
			 var content = "<table class='table table-responsive table-hover table-bordered' style='background:none;'>";
				
				content += "<tr>"
				content += td('<s:property value="%{getLocaleProperty('farmer')}" />');
				content += td(v.farmerName);
				content += "</tr>"
				content += "<tr>"
				content += td('<s:property value="%{getLocaleProperty('farmName')}" />');
				content += td(v.farmName);
				content += "</tr>"
					content += "</table>";
				return content;
			}
		
		function buildData(v){
			
			
			var content = "<table class='table table-responsive table-hover table-bordered'>";
			
			content += "<tr>";
			content += '<td colspan="3"><b><s:property value="%{getLocaleProperty('title.farmer')}" /></b></td>';
			content += "</tr>"
			
			var img = "";
				$.ajax({
					url:'farmerLocation_populateImg.action?farmerId='+v.id+'',
					type: 'post',
				    dataType: 'json',
				    async:false,
				    success: function(result) {
				    	img = "<img src='"+result.image+"' width='150' height='150' alt='Farmer Image'>";
				    }
				});
				
			
			content += "<tr>";
				content += td('<s:property value="%{getLocaleProperty('farmer')}" />');
				content += td(v.farmerName);
				if(!isEmpty(img)){
					content += "<td rowspan='5'>"+img+"</td>";
				}else{
					content += "<td rowspan='5'>"+"<img width='150' height='150' alt='Farmer Image'>"+"</td>";
				}
			content += "</tr>";
			
			content += "<tr>";
				content += td('<s:property value="%{getLocaleProperty('Farm')}" />');
				content += td(v.farmName);
			content += "</tr>";
			
			content += "<tr>";
			content += td('<s:property value="%{getLocaleProperty('profile.location.village')}" />');
			content += td(v.village);
			content += "</tr>";
			
			content += "<tr>";
			content += td('<s:property value="%{getLocaleProperty('farmer.samithi')}" />');
			content += td(v.samithi);
			content += "</tr>";
			
			if(v.totalLand==null||v.totalLand==""){
				content += "<tr>";
				content += td('<s:property value="%{getLocaleProperty('farm.area')}" />');
				content += td('0.00');
				content += "</tr>";
			}else{
				content += "<tr>";
				content += td('<s:property value="%{getLocaleProperty('farm.area')}" />');
				content += td(v.totalLand);
				content += "</tr>";
			}
			
			content += "</table>";
			return content;
		} 
		
		function td(val){
			  return "<td>"+getFormattedValue(val)+"</td>";
		}
		
		function getFormattedValue(val){
			   if(val==null||val==undefined||val.toString().trim()==""){
			    return " ";
			   }
			   return val;
		}
		
		function loadFields() {
			//alert("Called loadFields");
			var state = document.getElementById("state").value;
			var locality = document.getElementById("localities").value;
			var taluk = document.getElementById("division").value;
			var village = document.getElementById("village").value;
			var crop = $("#crop").val();
			var season = $("#season").val();
			var organicStatus = $("#organicStatus").val();
			var status = $("#status").val();
			var farmer = $("#farmer").val();
			//alert(organicStatus);
			$.post("farmerLocation_populateLoadFields", {
				selectedState : state,
				selectedLocality : locality,
				selectedTaluk : taluk,
				selectedVillage : village,
				selectedCrop : crop,
				selectedSeason:season,
				selectedOrganicStatus:organicStatus,
				selectedFarmer:farmer,
				selectedStatus:status
			}, function(data) {
				var json = JSON.parse(data);
				$("#farmerCount").html(json[0].farmerCount);
				$("#totalAcres").html(json[0].totalAcres);
				$("#yield").html(json[0].yield);

			});
		}
		

		function onFilterData() {

			callAjaxMethod("farmerLocation_populateCropList.action", "crop");
			callAjaxMethod("farmerLocation_populateStatusList.action", "status");

		}
		function callAjaxMethod(url, name) {
			var cat = $.ajax({
				url : url,
				async : true,
				type : 'post',
				success : function(result) {
					insertOptions(name, JSON.parse(result));
				}

			});

		}
		
		function redirectFarmer(){
			var farmerIdHidn = jQuery("#farmerIdHidn").val();
			/* var url */
			window.open("farmer_detail.action?id="+farmerIdHidn);
		}
		
	</script>
	    <!-- google maps api -->
        <script src="https://maps.google.com/maps/api/js?key=AIzaSyAdrkzvOdEDEozl1W6H-DregT04kjeCd1Y&v=3.33&callback=initMap"></script>

       
	<s:hidden id="farmerIdHidn" name="farmerIdHidn" />
</body>
