// JavaScript Document

$(document).ready(function() {
	$('#b_edit_client').click(function() {		
		$('#div_edit_client').toggle();
	
		var name = $('select#client_list').val();
		var text = $('#text_clients').val();
		var dataString = 'name=' + name + 'text=' + text;
		
		//alert (dataString);return false;
		
		$.ajax({
			type: "POST",
			url: "process.php",
			data: dataString,
			success: function() {
				$('#contact_form').html("<div id='message'></div>");
				$('#message').html("<h2>Contact Form Submitted!</h2>")
				.append("<p>We will be in touch soon.</p>")
				.hide()
				.fadeIn(1500, function() {
					$('#message').append("<img id='checkmark' src-'images/check.png' />");
				});
			});
		});
	});
});
