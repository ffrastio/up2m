// Call the dataTables jQuery plugin
$(document).ready(function () {
    $("#dataTable").DataTable();
});

$("#datepicker").datepicker({
    format: "yyyy",
    viewMode: "years",
    minViewMode: "years",
});
