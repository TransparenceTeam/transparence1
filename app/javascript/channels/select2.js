import $ from 'jquery';
import 'select2';


$(document).ready(function() {
    $('#law_name').select2({
      allowClear: true,
      placeholder: "Select a law",
      closeOnSelect: true,
      //multiple: true,
      scrollAfterSelect: true,
    });
});
