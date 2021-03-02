import algoliasearch from "algoliasearch";

const algoliaSearch = () => {
  const inputField = document.querySelector("#search");

  if (inputField) {
    const appId = document.querySelector("meta[name='algolia-app-id']").content;
    const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;

    const client = algoliasearch(appId, searchOnlyApiKey);
    const index = client.initIndex('ProjectLaw');

    inputField.addEventListener("input", () => {
      index.search(inputField.value,{ hitsPerPage: 10, page: 0 }).then((content) => {
        content.hits.forEach(element => console.log(element.name));
        // handle results however you like...


      })
    });
  }
}

export { algoliaSearch };

