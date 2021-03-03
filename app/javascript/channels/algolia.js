import algoliasearch from "algoliasearch";

//const form = document.querySelector("#search")
const form = document.querySelector("#id-search")

const appId = document.querySelector("meta[name='algolia-app-id']").content;
const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;
const client = algoliasearch(appId, searchOnlyApiKey);
const index = client.initIndex('ProjectLaw');



const dom = (option) => {
  const lawContent = `<option id="law">${option}</option>`;
  form.insertAdjacentHTML('beforeend', lawContent);

};

const queryDb = (index, inputField) => {
  index.search(inputField.value,{ hitsPerPage: 10, page: 0 })
      .then((content) => {
        content.hits.forEach((element) =>
          dom(element.name)
          //console.log(element)
        );
      })
}


const algoliaSearch = () => {
  const inputField = document.querySelector("#search");

  if (inputField) {
    inputField.addEventListener("input", (event) => {
      event.preventDefault();
      queryDb(index, inputField);

    });
  }
}

export { algoliaSearch };
//<input type="submit" class="btn btn-primary mr-auto ml-2" value="Search">
