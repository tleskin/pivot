$(document).ready(function() {

    // $(".update-box").focusout(function(){
    //   // console.log($(this).val());
    //   var amount = $(this).val()
    //   $.ajax({
    //     method: "POST",
    //     url: "/prospects",
    //     data: {prospect:{ business_id: $(".element").data("business-id"), amount: amount }}
    //   })
    //   .done(function( msg ) {
    //     return $(".update-box")    // $(".update-box").focusout(function(){
    // //   // console.log($(this).val());
    // //   var amount = $(this).val()
    // //   $.ajax({
    // //     method: "POST",
    // //     url: "/prospects",
    // //     data: {prospect:{ business_id: $(".element").data("business-id"), amount: amount }}
    // //   })
    // //   .done(function( msg ) {
    // //     return $(".update-box").val(formatCurrency(amount))
    // //   });
    // // });.val(formatCurrency(amount))
    //   });
    // });

    var formatCurrency = function(amount){
        var dec = "$" + Number(amount).toFixed(2);
        return dec
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
            // console.log($(this))
            // var amount = amount.replace("$","")
            debugger
            // console.log(amount)
            $(input).val(formatted)
          }, 2000)  
        }
    })



    var cleanCurrency = function(amount){
      debugger
      var cleanAmount = amount.match(/\d+(\.\d{2})?/g)
      return cleanAmount.join('')
    }



})
