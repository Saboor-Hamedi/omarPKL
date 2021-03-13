
    $(document).ready(function () {
        $(document).on('click', '#recommendationScholarshipBtn', function (e) {
            e.preventDefault();
            let recommendationId  =$('input#recommendationId').val();
            let activeRecommendationLetter = $('textarea#activeRecommendationLetter').val();
            let recommendationOption = $('#recommendationOption').val();
            if (recommendationId == '') {
                $('#recommendationId').focus();
                return false;
            }
            if (activeRecommendationLetter == '') {
                $('#activeRecommendationLetter').focus();
                return false;
            }
            if (recommendationOption == 0) {
                $('#recommendationOption').focus();
                return false;
            }
            $.ajax({
                url: '/../../../app/insertRecommendation/insertReco.php',
                type: "POST",
                data: {
                    recommendationId: recommendationId,
                    activeRecommendationLetter: activeRecommendationLetter,
                    recommendationOption: recommendationOption,
                    
                },
                success: function (data) {
                    $('.custome-alert').html(data).show().fadeIn( "slow");
                    $('.hidePKL').hide();
                    $('form').trigger('reset');
                    setTimeout(function () {
                        $('.custome-alert').html('').hide();
                    }, 3000);
                },
            });
        }) 
    });

   

    // delete letter 
    $('.deleteRecommendationLetter').on('click', function () {
        var id = $(this).attr('id');
        var el = this;
        var confirmalert = confirm("Are you sure?");
        if (confirmalert == true) {
            $.ajax({
                type: 'POST',
                url: '/../../../app/insertRecommendation/deleteRecommendation.php',
                data: { id: id },
                success: function (data) {
                    // Remove row from HTML Table
                    $(el).closest('tr').css('background', 'tomato');
                    $(el).closest('tr').fadeOut(800, function () {
                        $(this).remove();
                    });
                }
            });
        }
    });

