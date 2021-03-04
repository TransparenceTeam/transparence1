import $ from 'jquery';
import 'select2';
import algoliasearch from "algoliasearch";

const appId = document.querySelector("meta[name='algolia-app-id']").content;
const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;
const client = algoliasearch(appId, searchOnlyApiKey);
const index = client.initIndex('ProjectLaw');

$(document).ready(function() {
    $('#test').select2({
      placeholder: {
        id: '-1', // the value of the option
        text: 'Select A Contact'
      },
      ajax: {
        transport: function(params,success,failure) {
          var q = params.data.query.term;
          index.search(q, function searchDone(err, content) {
            if( !err ){
              success(params.results(content));
            }
          });
        },
        // build Algolia's query parameters
        data: function(term, page) {
          return { query: term, hitsPerPage: 10, page: (page - 1) };
        },
        // return Algolia's results
        results: function(data, page) {
          return {
            results: data.hits
          };
        }
      },
      escapeMarkup: function (markup) { return markup; },
      minimumInputLength: 1,
      templateSelection: function(contact){
        if( contact.id=='-1' || contact.loading == true ){
          return contact.text;
        } else {
          return contact._highlightResult.email.value;
        }
      },
      templateResult: function(contact){
        if( contact.id=='-1' || contact.loading == true ){
          return contact.text;
        }
      }
    });
});
