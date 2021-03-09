import $ from 'jquery';
import 'select2';


$(document).ready(function() {
    $('#match_project_law_id').select2({
      allowClear: true,
      placeholder: "Select a law",
      closeOnSelect: true,
      scrollAfterSelect: true,
    });
});

$(document).ready(function() {
    $('#match_policy_area_id').select2({
      allowClear: true,
      placeholder: "Select a law",
      closeOnSelect: true,
      scrollAfterSelect: true,
    });
});


