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

  $('#male_part').find('tr').click(function() {
      name = $(this).find('td:first').text();
      boulders = $(this).find('td:nth-child(2)').text();
      $('#name').val(name);
      $('#gender').val("m");
      $('#nr_col').val(boulders);
  })

  $('#female_part').find('tr').click(function() {
      name = $(this).find('td:first').text();
      boulders = $(this).find('td:nth-child(2)').text();
      $('#name').val(name);
      $('#gender').val("f");
      $('#nr_col').val(boulders);
  })

})

