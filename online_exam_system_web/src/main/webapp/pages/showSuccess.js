/**
 * This tiny script just helps us demonstrate
 * what the various example callbacks are doing
 */

 function showSuccessDialog(str){
	 bootbox.dialog({
		 message : "<center><h3>" + str + "</h3></center>",
		 buttons:{
			 success:{
				 label:"成功",
				 className:"btn-success",
				 id:"btn_success"
			 }
		 }
	 });
    // setTimeout(function () {
    //     bootbox.dialog('close');
    //
    // }, 5000);
  }

  function showErrorDialog( errCode , errMsg, cb){
/*  	var str = "<center><h3 class='errorAlert'>"+ errCode +"</h3></center>"+"<br/>"+
        "<center><h3 class='errorAlert'>"+ errMsg +"</h3></center>";
  
     bootbox.alert(str,cb);*/
	 bootbox.dialog({
		 title: "<center><h3 class='errorAlert'>"+ errCode +"</h3></center>",
		 message : "<center><h3 class='errorAlert'>"+ errMsg +"</h3></center>",
		 buttons:{
			 success:{
				 label:"失败",
				 className:"btn-danger",
			 }
		 }
	 })
  }
function showWarnDialog( warnCode , warnMsg, cb){
    /*  	var str = "<center><h3 class='errorAlert'>"+ errCode +"</h3></center>"+"<br/>"+
            "<center><h3 class='errorAlert'>"+ errMsg +"</h3></center>";

         bootbox.alert(str,cb);*/
    bootbox.dialog({
        title: "<center><h3 class='warnAlert'>"+ warnCode +"</h3></center>",
        message : "<center><h3 class='warnAlert'>"+ warnMsg +"</h3></center>",
        buttons:{
            success:{
                label:"确定",
                className:"btn-warning",
            }
        }
    })
}
    function showWarnningDialog(options){
        var defaults = {
            callbackFn : null
        };
        var config = $.extend(defaults, options || {});
        var resultObj={
            result:false
        };
        bootbox.setDefaults("locale","zh_CN");
        bootbox.confirm("<p><h3>"+ options.errMsg+"</h3></p>", function(result) {
            resultObj.result = result ;
            if ( typeof config.callbackFn == 'function') {
                config.callbackFn(resultObj);
            }
        });
    }
  (function($){
    $.fn.extend({
    	"showCallBackWarnningDialog" : function(options) {
    		var defaults = {
		           callbackFn : null
		        }
	     	var config = $.extend(defaults, options || {});
	        var resultObj={
	        		  result:false
	        }
	        bootbox.setDefaults("locale","zh_CN");
	        bootbox.confirm("<p><center><h3>"+ options.errMsg+"</h3></center></p>", function(result) {
			  	resultObj.result = result ;
			  	if ( typeof config.callbackFn == 'function') { 
                	config.callbackFn(resultObj); 
            	}
			}); 
			
		}
	})
   })(jQuery);
