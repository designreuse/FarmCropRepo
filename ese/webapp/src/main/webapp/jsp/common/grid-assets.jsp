<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ese-tags" prefix="e"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- <link rel="stylesheet" type="text/css" media="screen" href="plugins/jplayer/jplayer.blue.monday.min.css" /> -->
<%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> --%>
<link rel="stylesheet" type="text/css" media="screen" href="plugins/jqgrid/css/ui.jqgrid-bootstrap4.css" />
	
<script src="plugins/jqgrid/js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="plugins/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	
<%-- <script type="text/javascript" src="plugins/html2PDF/html2canvas.js"></script>
	<script type="text/javascript" src="plugins/html2PDF/jspdf.min.js"></script>
	<script type="text/javascript" src="plugins/html2PDF/html2pdf.js"></script> --%>

  <!-- DataTables -->
        <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/datatables.net-select-bs4/css//select.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <!-- Responsive datatable examples -->
        <link href="assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />     

<script src="js/dynamicReportRelated/dataTablePlugin/pdfmake.min.js"></script>
<script src="js/dynamicReportRelated/dataTablePlugin/jszip.min.js"></script>
<script src="js/dynamicReportRelated/dataTablePlugin/vfs_fonts.js"></script>



<script type="text/javascript">
	//$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
	
	$(function() {
		$('.menuToggle').on('click', function() {
			resizeJqGridWidth("detail", "baseDiv");
		});
		var filters='<s:property value="filterSize"/>';
		//alert(filters);
	});
	var windowHeight="";
	var reportWindowHeight="";
	var postdata='<s:property value="postdata"/>';
	var filterda='';
 jQuery.fn.dataTable.Api.register( 'sum()', function ( ) {
		return this.flatten().reduce( function ( a, b ) {
			if ( typeof a === 'string' ) {
				a = a.replace(/[^\d.-]/g, '') * 1;
			}
			if ( typeof b === 'string' ) {
				b = b.replace(/[^\d.-]/g, '') * 1;
			}

			return a + b;
		}, 0 );
	} ); 
	

	/* jQuery.fn.dataTableExt.afnFiltering.push(
			  function(oSettings, aData, iDataIndex) {
			    if (typeof aData._date == 'undefined') {
			      aData._date = new Date(aData[0]).getTime();
			    }

			    if (minDateFilter && !isNaN(minDateFilter)) {
			      if (aData._date < minDateFilter) {
			        return false;
			      }
			    }

			    if (maxDateFilter && !isNaN(maxDateFilter)) {
			      if (aData._date > maxDateFilter) {
			        return false;
			      }
			    }

			    return true;
			  }
			); */
	
	jQuery(document).ready(function() {
		
		jQuery("#minus").click(function() {
			try{
			var flag = "edit";
			var index = jQuery("#fieldl").val();
			jQuery("." + index).addClass("hide");
			jQuery("." + index + "> select").val("");
			reloadGrid(flag);
			jQuery("#filter-fields").remove(jQuery("." + index));
			jQuery("#fieldl").val("");
			resetReportFilter();
			}catch (e) {
				console.log(e);
			}
		});

		jQuery("#plus").click(function() {
			var index = jQuery("#fieldl").val();
			if(index!=""){
			jQuery(".well").show();
			jQuery("." + index).removeClass("hide");
			jQuery("#searchbtn").append(jQuery("." + index));
			jQuery("#fieldl").val("");
			}			
		});
		windowHeight = ($(window).innerHeight()-260);
		reportWindowHeight= ($(window).innerHeight()-320);
		
	 	if(postdata!=null  && postdata!='null' && !isEmpty(postdata)){
		postdata = postdata.replace(/&quot;/g,'"');
		postdata = postdata.replace("\"{", "{");
		postdata = postdata.replace("}\"", "}");
		filterda= postdata;
		postdata = postdata==null  || postdata=='null'  ?  '' : JSON.stringify(postdata); 

	 	}
	});

	function resizeJqGridWidth(grid_id, div_id) {
		$(window).on('resize', function() {
			$('#' + grid_id).setGridWidth($('#' + div_id).width(), true);
		}).trigger('resize');
	}

	function isDataAvailable(grid_id) {
		return (jQuery(grid_id).getDataIDs() != "" && jQuery(grid_id)
				.getDataIDs() != null)
	}

	function isDataMaximunDownload(grid_id) {
		return (jQuery("#detail").jqGrid("getGridParam", "records") <= 1000)
	}

	function showFields() {
		var path = document.getElementById('fieldl');
		var name = path.value;
		for (var cnt = 1; cnt <= path.options.length - 1; cnt++) {
			if (name == path.options[cnt].value) {
				document.getElementById(cnt).className = "";
				if (cnt == (path.options.length - 1)) {
					if (document.getElementById(cnt + 1) != null)
						jQuery("div#" + (cnt + 1)).attr("class", "");
					//document.getElementById(cnt+1).className=" ";
				}
			}
		}
	}

	function removeFields() {
		var path = document.getElementById('fieldl');
		var name = path.value;
		for (var cnt = 1; cnt <= path.options.length - 1; cnt++) {
			if (name == path.options[cnt].value) {
				findTag(document.getElementById(cnt));
				document.getElementById(cnt).className = "hide";
				if (cnt == (path.options.length - 1)) {
					if (document.getElementById(cnt + 1) != null) {
						findTag(document.getElementById(cnt + 1));
						document.getElementById(cnt + 1).className = "hide";
					}
				}
			}
		}
	}

	function findTag(tds) {
		try {
			if (tds.childNodes[1].getElementsByTagName("td")[1]
					.getElementsByTagName("input")[0] != undefined) {
				tds.childNodes[1].getElementsByTagName("td")[1]
						.getElementsByTagName("input")[0].value = "";
			} else if (tds.childNodes[1].getElementsByTagName("td")[1]
					.getElementsByTagName("select")[0] != undefined) {
				var selectbox = tds.childNodes[1].getElementsByTagName("td")[1]
						.getElementsByTagName("select")[0];
				selectbox.selectedIndex = 0;
			}
		} catch (e) {

		}
	}

	function getSubBranchValues(selectedBranch) {
		jQuery.post("customer_populateChildBranch.action", {
			selectedBranch : selectedBranch
		}, function(result) {
			jQuery("#gs_subBranchId").empty();
			insertOptions("gs_subBranchId", $.parseJSON(result));
			$("#gs_subBranchId").trigger("change");
		});
	}
	
	function populateChildBranch(selectedBranch) {
		jQuery.post("customer_populateChildBranch.action", {
			selectedBranch : selectedBranch
		}, function(result) {
			jQuery("#subBranchIdParam").empty();
			jQuery("#subBranchIdParam").select2();
			insertOptions("subBranchIdParam", $.parseJSON(result));
			/* $("#subBranchIdParam").trigger("change"); */
		});
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

	
    
    function getSubBranchValues(selectedBranch){
    	jQuery.post("customer_populateChildBranch.action",{selectedBranch:selectedBranch},function(result){
    		jQuery("#gs_subBranchId").empty();
    		insertOptions("gs_subBranchId",$.parseJSON(result));
    		$( "#gs_subBranchId" ).trigger( "change" );
    	});
    }
    
    function insertOptions(ctrlName, jsonArr) {
        document.getElementById(ctrlName).length = 0;
        addOption(document.getElementById(ctrlName), "Select", " ");
        for (var i = 0; i < jsonArr.length; i++) {
            addOption(document.getElementById(ctrlName), jsonArr[i].name, jsonArr[i].id);
        }
    }
    
    function addOption(selectbox, text, value){
        var optn = document.createElement("OPTION");
        optn.text = text;
        optn.value = value;
        selectbox.options.add(optn);
    }
    function retainFields(){
    if(postdata!=''){
    	
		  var jsonobj = JSON.parse(filterda);
		  jQuery("#detail").setGridParam ({postData: jsonobj});
		    $(jsonobj).each(function(k,v){
		    	if(v.filters!==undefined)
		    		{
				   $(v.filters.rules).each(function(k,v2){
					   var temp=v2.field;
					   if(v2.op=='eq'){
						   $("select[name='"+temp+"']").val(v2.data);
					   }else{
					   	$("input[name='"+temp+"']").val(v2.data);
					   }
		});    
		    		}
			});  
		     $('#detail').setGridParam({postData: jsonobj});
		     $('#detail')[0].triggerToolbar();
		}
    }
    function postDataSubmit(){
    var postdata =  JSON.stringify($('#detail').getGridParam('postData'));
	  postdata = postdata.replace(/&quot;/g,'"');
		postdata = postdata.replace("\"{", "{");
		postdata = postdata.replace("}\"", "}");
		  document.updateform.postdata.value =postdata;
    }
    
    function isEmpty(val){
  	  if(val==null||val==undefined||val.toString().trim()==""){
  	   	return true;
  	  }
  	  return false;
  	}
</script>


 <!-- Required datatable js -->
        <script src="assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
        <!-- Buttons examples -->
        <script src="assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
        <script src="assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
        <script src="assets/libs/jszip/jszip.min.js"></script>
        <script src="assets/libs/pdfmake/build/pdfmake.min.js"></script>
        <script src="assets/libs/pdfmake/build/vfs_fonts.js"></script>
        <script src="assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
        <script src="assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
        <script src="assets/libs/datatables.net-buttons/js/buttons.colVis.min.js"></script>

        <script src="assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <script src="assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>
        
        <!-- Responsive examples -->
        <script src="assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

        <!-- Datatable init js -->
        <script src="assets/js/pages/datatables.init.js"></script>

