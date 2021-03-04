import algoliasearch from "algoliasearch";

const appId = document.querySelector("meta[name='algolia-app-id']").content;
const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;
const client = algoliasearch(appId, searchOnlyApiKey);
const index = client.initIndex('ProjectLaw');

const select = document.querySelector(".form-control")

const resultsDropDown = document.querySelector("#law")
//const inputField = document.querySelector("#search");

const form = document.querySelector("#search-id")



const dom = (option) => {
  const lawContent = `<option id="law">${option}</option>`;
  resultsDropDown.insertAdjacentHTML('afterend', lawContent);
};


const algoliaSearch = (input) => {
  index.search(input.value,{ hitsPerPage: 10, page: 0 })
      .then((content) => {
        content.hits.forEach((element) =>
          dom(element.name)
        );
      })
}

form.addEventListener("input", (event) => {
  event.preventDefault();
  const input = document.querySelector("#search-id")
  resultsDropDown.innerHTML = '';
  algoliaSearch(input)
});


//export { algoliaSearch };

<input class="prompt form-control" type="text" placeholder="search my friend">
                    <select class='form-control' id='test'>
