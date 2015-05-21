$(document).ready(function() {

    $('.currency').focusout(function() {
        var i = parseFloat(this.value/100);
        // if(isNaN(i)) { i = 0.00; }
        // var minus = '';
        // if(i < 0) { minus = '-'; }
        // i = Math.abs(i);
        // i = parseInt((i + .005) * 100);
        // i = i / 100;
        // s = new String(i);
        // if(s.indexOf('.') < 0) { s += '.00'; }
        // if(s.indexOf('.') == (s.length - 2)) { s += '0'; }
        // s = minus + s;
        return this.value = i;
    });

    // $('.currency').focus(function() {
    //     var i = parseFloat(this.value/100);
    //     // if(isNaN(i)) { i = 0.00; }
    //     // var minus = '';
    //     // if(i < 0) { minus = '-'; }
    //     // i = Math.abs(i);
    //     // i = parseInt((i + .005) * 100);
    //     // i = i / 100;
    //     // s = new String(i);
    //     // if(s.indexOf('.') < 0) { s += '.00'; }
    //     // if(s.indexOf('.') == (s.length - 2)) { s += '0'; }
    //     // s = minus + s;
    //     return this.value = i;
    // });

})