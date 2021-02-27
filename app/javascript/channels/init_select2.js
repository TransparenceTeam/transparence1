// 1. import the plugin
import $ from 'jquery';
import 'select2';

// 2. create the function
const initSelect2 = () => {
  $('.select2').select2({ width: '100%' });
}

// 3. export the function
export { initSelect2 };
