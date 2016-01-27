// See https://github.com/leonid-shevtsov/unobtrusive_flash/blob/master/lib/assets/javascripts/unobtrusive_flash_ui.js
// Types: success, info, warning, danger
var Flash = {};
Flash.flashOptions  = {type: 'info', timeout: 2000};

(function () {
    Flash.showFlashMessage = function(message, options) {
	options = $.extend(Flash.flashOptions, options);
	
	var $flash = $('<div class="alert alert-' + options.type +
		       ' fade in"><button type="button" class="close" data-dismiss="alert">&times;</button>' + message + '</div>');
	
	var $flashContainer = $($('.flash-container')[0] || 
				$('.container')[0] || 
				$('.container-fluid')[0] || 
				$('body')[0]);
	$flashContainer.prepend($flash);
	$flash.hide().delay(300).slideDown(100);
	$flash.alert();
	
	if (options.timeout > 0) {
	    setTimeout(function() {
		$flash.alert('close');
	    }, options.timeout);
	}
    };
    
    var flashHandler = function(params) {
	Flash.showFlashMessage(params.message, {type: params.type});
    };
    
    Shiny.addCustomMessageHandler('flash', flashHandler);
})();
