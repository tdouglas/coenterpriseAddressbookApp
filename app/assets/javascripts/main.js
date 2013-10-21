$('#join-button').click(function() {
  $('.box-body').hide();
  $('.box-join').show();
  $('#member-link').show();
});

$('#top-button').click(function() {
  $('.box-join').hide();
  $('#member-link').hide();
  $('.box-body').show();
});
