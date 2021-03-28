$(function() {
    $("#open__box").on('keyup change', function() {
        if (this.value == '1') {
            $(".pkl__recommendation__form").show();
        } else {
            $(".pkl__recommendation__form").hide();
        }
        if (this.value == '2') {
            $(".pkl__form").show();
        } else {
            $(".pkl__form").hide();
        }
    });
});