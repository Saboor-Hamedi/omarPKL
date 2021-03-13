<script src="../../view/include/jquery.js"></script>
<script src="../include/insert/pklinsert.js"></script>
<script src="../include/insert/recommendationInsert.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<!-- datepicker -->
<link rel="stylesheet" href="../include/datePicker/jquery-ui.css">
<script src="../include/datePicker/jquery-1.12.4.js"></script>
<script src="../include/datePicker/jquery-ui.js"></script>
<script>
    $.noConflict();
    jQuery(document).ready(function($) {
        $("#datepicker1").datepicker();
    });
</script>
<script>
    $.noConflict();
    jQuery(document).ready(function($) {
        $("#datepicker2").datepicker();
    });
</script>
<script>
    $(document).ready(function() {
        $('#sidebarCollapse').on('click', function() {
            $('#sidebar').toggleClass('active');
        });
    });
</script>

<script>

</script>
</body>

</html>