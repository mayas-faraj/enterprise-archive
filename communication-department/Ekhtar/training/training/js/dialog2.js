$(document).ready(function () {
    $(function () {
        $("#searchdialog").dialog({
            autoOpen: false
        });
        $("#key_word_check").on("click", function () {
            $("#key_word_div").css("visibility",
                    $("#key_word_div").css("visibility") == "hidden" ? "visible" : "hidden"
                    );
        });
        $("#date_check").on("click", function () {
            $("#date_div").css("visibility",
                    $("#date_div").css("visibility") == "hidden" ? "visible" : "hidden"
                    );
        });
        $( "#datepicker" ).datepicker();
        $( "#datepicker2" ).datetimepicker();
        $("#datetimepicker1").datetimepicker({
        format: 'dd-MM-yyyy hh:mm:ss',
        language: 'pt-US'
      });
       $("#datetimepicker2").datetimepicker({
        format: 'dd-MM-yyyy hh:mm:ss',
        language: 'pt-US'
      });
    });
});
