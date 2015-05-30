// I realize this is disgusting.
function inject(key) {
    var r;
    r = $('.highlight').html().replace(new RegExp('"'+ key + '".*?".*?".*?".*?".*?".*?".*?', 'igm'), '"' + key + '"</span><span class="p">:</span> <span class="s2">"' + $('#payment_' + key).val() + '"');
    console.log(r);
    $('.highlight').html(r);
}

$(document).ready(function() {
  $('#payment_firstName').on({
    keyup: function() {
        inject('firstName');
    }
  });
  $('#payment_lastName').on({
    keyup: function() {
        inject('lastName');
    }
  });
  $('#payment_email').on({
    keyup: function() {
        inject('email');
    }
  });
  $('#payment_city').on({
    keyup: function() {
        inject('city');
    }
  });
  $('#payment_state').on({
    keyup: function() {
        inject('state');
    }
  });
  $('#payment_zip').on({
    keyup: function() {
        inject('zip');
    }
  });
});