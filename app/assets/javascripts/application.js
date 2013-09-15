//= require jquery-2.0.0
//= require bootstrap
//= require_tree .

// redirect from old #-based links that are in some tweets
var fragment = window.location.hash;
if (fragment === '#cfp') {
	window.location = '/speakers/cfp';
}

if (fragment === '#speakers') {
	window.location = '/speakers';
}

// twitter widget code
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');

// google analytics initializaer
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-26802093-2', 'appseccalifornia.org');
ga('send', 'pageview');

var track = function(event) {
	ga('send', 'event', 'submission', event);
};

track("page load");

$(document).ready(function() {
	track('document ready');

	$('#new_beta_request').on('submit', function(e) {
		track('newsletter');
	});

	$('a[href="/speakers/new"]').on('click', function(e) {
		track('cfp start');
	});

	$('#new_speaker').on('submit', function(e) {
		track('cfp submit');
	});

	$('span.icon-bar').on('submit', function(e) {
		track('mobile menu expand');
	});

	$('#beta_request_name').on('click', function(e) {
		ga('send', 'event', 'submission', 'newsletter start name');
	});

	$('#beta_request_email').on('click', function(e) {
		ga('send', 'event', 'submission', 'newsletter start email');
	});

	$('#new_speaker input').on('click', function(e) {
		track('cfp start fill');
	});

  var growlData = JSON.parse($('<div/>').html($('script#growl-data').text()).text());
  $.each(growlData, function(index, growl) {
    var level = Object.keys(growl)[0];
    var message = growl[Object.keys(growl)[0]];
    $.growl({"message":$('<div/>').html(message).text(),"style":level,"title":level});
  });
});