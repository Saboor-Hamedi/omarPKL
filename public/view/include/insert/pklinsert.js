// inser data into pkl table
$(document).ready(function() {
    $('#pklsubmitBnt').on('click', function(e) {
        e.preventDefault();
        let agencyTitle = $('#agencyTitle').val();
        let agencyID = $('#agencyID').val();
        let agencryDescription = $('#agencryDescription').val();
        let lengthOmonth = $('#lengthOmonth').val();
        let datepicker1 = $('#datepicker1').val();
        let datepicker2 = $('#datepicker2').val();
        let typesofAgencyLetter = $('#typesofAgencyLetter').val();
        if (agencyTitle == '') {
            $('input#agencyTitle').focus();
            return false;
        }
        if (agencyID == '') {
            $('input#agencyID').focus();
            return false;
        }
        if (agencryDescription == '') {
            $('textarea#agencryDescription').focus();
            return false;
        }
        if (lengthOmonth == '') {
            $('input#lengthOmonth').focus();
            return false;
        }
        if (datepicker1 == '') {
            $('input#datepicker1').focus();
            return false;
        }
        if (datepicker2 == '') {
            $('input#datepicker2').focus();
            return false;
        }
        if (typesofAgencyLetter == 0) {
            $('#typesofAgencyLetter').focus();
            return false;
        }
        $.ajax({
            url: '/../../../app/insertData/insertAgency.php',
            type: "POST",
            data: {
                agencyTitle: agencyTitle,
                agencyID: agencyID,
                agencryDescription: agencryDescription,
                lengthOmonth: lengthOmonth,
                datepicker1: datepicker1,
                datepicker2: datepicker2,
                typesofAgencyLetter: typesofAgencyLetter
            },
            success: function(data) {
                $('.custome-alert').html(data).show().fadeIn("slow");
                $('.pkl__form').hide();
                $('form').trigger('reset');
                setTimeout(function() {
                    $('.custome-alert').html('').hide();
                }, 3000);
            },
        });
    });
    // close form
    $('.close_forms').on('click', function(e) {
        e.preventDefault();
        $('.hideOption').hide();
        $('.custome-alert').hide();
        $('#pklform').trigger('reset');
        location.reload();
    });
    // delete letter 
    $('.deleteletter').on('click', function() {
        var id = $(this).attr('id');
        var el = this;
        var confirmalert = confirm("Are you sure?");
        if (confirmalert == true) {
            $.ajax({
                type: 'POST',
                url: '/../../../app/insertData/deleteAgency.php',
                data: { id: id },
                success: function(data) {
                    // Remove row from HTML Table
                    $(el).closest('tr').css('background', 'tomato');
                    $(el).closest('tr').fadeOut(800, function() {
                        $(this).remove();
                    });
                }
            });
        }
    });
});