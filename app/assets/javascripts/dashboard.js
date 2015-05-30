function inject(key) {
    var r;
    r = $('.highlight').html().replace(new RegExp('"' + key + '".*?("")', "igm"), '"' + key + '": ' + '"' + $('#payment_' + key).val() + '"');
    console.log("\"" + key + "\": " + '"' + $('#payment_' + key).val() + '"');
    $('.highlight').html(r);
}

$(document).ready(function() {
  $('#payment_firstName').on({
    keyup: function() {
        inject('firstName');
    }
  });
});