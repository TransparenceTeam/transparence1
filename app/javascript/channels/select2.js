import $ from 'jquery';
import 'select2';


$(document).ready(function() {
    $('#project_law_id').select2({
      allowClear: true,
      placeholder: "Select a law",
      closeOnSelect: true,
      //multiple: true,
      scrollAfterSelect: true,
    });
});

$(document).ready(function() {
    $('#policy_area_id').select2({
      allowClear: true,
      placeholder: "Select a law",
      closeOnSelect: true,
      //multiple: true,
      scrollAfterSelect: true,
    });
});

