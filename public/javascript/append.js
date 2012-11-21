$(function() {

  $(document).keypress(function(e) {
    if (e.which == "13") {
      var str = $('#nr').val();
      if(str == '') {
        return false;
      }
      var old = $('#nr_col').val();
      if(old.length > 0){
        old = old + ',';
      }
      old = old + str;
      $('#nr_col').val(old);
      $('#nr').val("");
      return false;
    }
  });

  $('#clear').click(function() {
    $('#nr_col').val("");
  })

})

