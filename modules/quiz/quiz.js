(function($){
	$(function(){
		
		$(document).bind('gform_post_render', function(event, formId, currentPage){
			if(formId == 16) {
				gravityFormEdits();
			}
		});

		gravityFormEdits();
		function gravityFormEdits(){
			// Change button texts
			$('.quiz-form .gform_previous_button').val('Back');
			$('.quiz-form .gform_next_button').val('Continue');

			// Change progress bar text
			var modify_progress_bar_text = $('.quiz-form .gf_progressbar_title').text();
			modify_progress_bar_text = modify_progress_bar_text.replace("Step", "").replace("of","/");
			$('.quiz-form .gf_progressbar_title').text(modify_progress_bar_text);
		}

	})
})(jQuery)
