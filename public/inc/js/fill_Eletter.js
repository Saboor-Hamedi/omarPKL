$(function () {

   $("#id_letter").on('keyup change',function () {

      // if ($(this).val() != 'Surat Permohonan Praktek Kerja Lapangan (PKL)') {
      //    $('.hidePKL').show();
      // }
      // else {
      //    $('.hidePKL').hide();
      // }
      if ( this.value == '3')
      {
        $(".hideRecommendationScholarshipLetter").show();
      }
      else
      {
        $(".hideRecommendationScholarshipLetter").hide();
      }
      if ( this.value == '8')
      {
        $(".hidePKL").show();
      }
      else
      {
        $(".hidePKL").hide();
      }
 
    
      
   });

});