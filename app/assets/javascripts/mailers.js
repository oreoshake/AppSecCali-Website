$(document).ready(function() {
  $('#mailer-submit').click(function() {
    var response = confirm("Are you suuuuuuuuuure?????");
    if(response === true) {
      $('#mailer').submit();
    }
  });

  $('textarea').bind('input keyup', function(){
    var $this = $(this);
    var delay = 500;

    clearTimeout($this.data('timer'));
    $this.data('timer', setTimeout(function(){
      $this.removeData('timer');
       $('#frame').contents().find('body').html($this.val());
    }, delay));
  });
})