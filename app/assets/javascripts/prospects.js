$(document).ready(function() {

    var cleanCurrency = function(amount){
      var cleanAmount = amount.match(/\d/g)
      return cleanAmount.join('')
    }

    var formatCurrency = function(amount){
        var adjustedAmount = '' + amount
        while (adjustedAmount.length<3){
            adjustedAmount = '0' + adjustedAmount
        }
        var values = adjustedAmount.toString().split('').reverse()
        var formatted = []
        $.each(values, function(index, value){

            if (index === 1){
                appended = "." + value
            } else if (index%3 === 1 && index < values.length - 1){
                appended = "," + value
            } else {
                appended = value
            }

            if (index === values.length - 1){
                appended = "$" + appended
            }

            formatted.push(appended)
        });
        return formatted.reverse().join('')
    }

    var updateAmount = function(amount){
      var change = amount
      $.ajax({
        method: "POST",
        url: "/prospects_update",
        data: { id: $(".element").data("business-id"), change: change }
      })
      .done(function( msg ) {
      });
    }

    var timeoutId;

    var invalidKeyCodes = {
      37: "left arrow",
      38: "up arrow",
      39: "right arrow",
      40: "down arrow"
    }

    $(".update-box").keyup(function(event){
        var input = this;
        if (!invalidKeyCodes[event.keyCode]) {
          clearTimeout(timeoutId)
          timeoutId = setTimeout(function() {
            var amount = $(input).val()
            var clean  = cleanCurrency(amount)
            var formatted = formatCurrency(clean)
            updateAmount(clean)
            $(input).val(formatted)
          }, 1200)  
        }
    });

    $(".lend-box").keyup(function(event){
        var input = this;
        if (!invalidKeyCodes[event.keyCode]) {
          clearTimeout(timeoutId)
          timeoutId = setTimeout(function() {
            var amount = $(input).val()
            var clean  = cleanCurrency(amount)
            var formatted = formatCurrency(clean)
            $(input).val(formatted)
          }, 1200)  
        }
    });

});
