// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


// $(document).on('ready page:load', function(){

//     $('.twitter-tweet').text(response);
//     }
//     $.get('twitter api URL', display_tweets);

$(document).on('ready page:load', function() {
	console.log('document ready!');
		var new_tweets = $('.container-tweets')
	function ajaxCall() {
		$.ajax({
			type: 'GET',
			url:'/home',
			// dataType: 'json',
			success: function(data) {
			$('.refresh-button').fadeIn();
					// console.log(data)
				// $('.twitter-tweet').each(function(i, v) {
				// 	dom_tweet_id = $(v).attr('id')
				// 	// console.log(dom_tweet_id)
				// });

				// $.each(data, function(i, v) {
				// 	data_tweet_id = $(v).attr('id')
				// 	$data_tweet = $(v) //stringify
				// 	// console.log(data_tweet_id)
				// 	// console.log(data_tweet)

				// });
				// console.log('second test')
				// if (data_tweet_id != dom_tweet_id){
				// 	console.log('third test')
				// 	// data_tweet_id.prepend(new_tweets)
				$('.refresh-button').on('click', function(){
					$('.refresh-button').remove();
					$(document).scrollTop(0);
					$('.sign-out').hide();
					$(new_tweets).replaceWith(data);
					// console.log('data prepended bitch')
				})

					// console.log('fourth test')
				// }else{
					// console.log('no new tweets to show')
				// }
			}
		})
	}
	 		setTimeout(ajaxCall, 300000);
})





// $(document).on('ready page:load', function (){
// 	console.log('document ready');
// 	var $new_tweets = $('.twitter-tweet')
// 	// $(function() {
// 	// 	function update() {
// 			$.ajax({
// 				type: 'GET',
// 				url: '/home',
// 				dataType: 'json',
// 				success: function(data) {
// 					console.log('hey');
// 						// $.each(data, function(data) {
// 						// $new_tweets.append('<h1>Testing</h1>');
// 					// });
// 				}
				// setInterval(update, 30000);
			// });
		// });
	// });
// });



			// need to know what URL we are going to get and how we get that information





