import algoliasearch from "algoliasearch";

const algoliaSearch = () => {
  const inputField = document.querySelector("#form1");

  if (inputField) {
    const appId = document.querySelector("meta[name='algolia-app-id']").content;
    const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;

    const client = algoliasearch(appId, searchOnlyApiKey);
    const index = client.initIndex('ProjectLaw');

    inputField.addEventListener("input", () => {
      index.search(inputField.value).then((content) => {
        console.log(content);

      })
    });
  }
}

export { algoliaSearch };
