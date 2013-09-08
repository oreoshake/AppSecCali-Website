// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-dropdown
//= require_tree .

!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');


(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-26802093-2', 'appseccalifornia.org');
ga('send', 'pageview');

var fragment = window.location.hash;
if (fragment === '#cfp') {
	window.location = '/speakers/cfp';
}

if (fragment === '#speakers') {
	window.location = '/speakers';
}

$(document).ready(function() {
	$('.dropdown-menu a').click(function(e) {
    e.stopPropagation();
	});

	$('#new_beta_request').on('submit', function(e) {
		ga('send', 'event', 'submission', 'newsletter');

	  // ga.push(['_trackEvent', 'Submissions', 'Newsletter']);
	  console.log("EVENT")
	});

	$('a[href="/speakers/new"').on('click', function(e) {
		// ga.push(['_trackEvent', 'Submissions', 'CFP start']);
		ga('send', 'event', 'submission', 'cfp start');
		console.log("EVENT")
	});	

	$('#new_speaker').on('submit', function(e) {
		console.log("EVENT")
		ga('send', 'event', 'submission', 'cfp submit');
	  // ga.push(['_trackEvent', 'Submissions', 'CFP Submit']);
	});

  var growlData = JSON.parse($('<div/>').html($('script#growl-data').text()).text());
  $.each(growlData, function(index, growl) {
    var level = Object.keys(growl)[0];
    var message = growl[Object.keys(growl)[0]];
    $.growl({"message":$('<div/>').html(message).text(),"style":level,"title":level});
  });
});