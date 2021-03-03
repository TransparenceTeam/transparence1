import algoliasearch from "algoliasearch";

const form = document.querySelector("#search")

const appId = document.querySelector("meta[name='algolia-app-id']").content;
const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;
const client = algoliasearch(appId, searchOnlyApiKey);
const index = client.initIndex('ProjectLaw');

const childDom = () => {
  let insertedContent = document.querySelectorAll(".law-name");

  if (insertedContent) {
    console.log(insertedContent);
    insertedContent.forEach((item) =>
      item.remove()
    )
    console.log(insertedContent);
    //insertedContent.remove();
    //console.log(insertedContent)
  }

};

const dom = (option) => {

  const lawContent = `<option class="law-name">${option}</option>`;
  form.insertAdjacentHTML('beforeend', lawContent);

};

const queryDb = (index, inputField) => {
  index.search(inputField.value,{ hitsPerPage: 10, page: 0 })
      .then((content) => {
        content.hits.forEach((element) =>
          dom(element.name)
        );
      })
}


const algoliaSearch = () => {
  const inputField = document.querySelector("#search");

  if (inputField) {

    inputField.addEventListener("input", (event) => {
      event.preventDefault();
      //childDom();
      inputField.innerHTML = "";
      queryDb(index, inputField);

    });
  }
}

export { algoliaSearch };

