// import algoliasearch from "algoliasearch";

// const algoliaSearch = () => {
//   const inputField = document.querySelector("#form1");

//   if (inputField) {
//     const appId = document.querySelector("meta[name='algolia-app-id']").content;
//     const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;

//     const client = algoliasearch(appId, searchOnlyApiKey);
//     const index = client.initIndex('ProjectLaw');

//     inputField.addEventListener("input", () => {
//       index.search(inputField.value).then((content) => {
//         console.log(content);

//       })
//     });
//   }
// }

// export { algoliaSearch };

import Tagify from '@yaireo/tagify'

const initTagify = () => {
  console.log("Hello Andrew");
  const tagifyInputs = document.querySelectorAll(".tagify-input")
  tagifyInputs.forEach(input => {
    console.log(input.dataset);
    const dropdown = {
      enabled: 0,
      position: "text",
      maxItems: 8
    }
    const options = {
      whitelist: JSON.parse(input.dataset.projectLaws),
      enforceWhitelist: true,
      dropdown: dropdown,
      transformTag:(tag)=> tag.value = tag.title
    }
    const test = new Tagify(input,options)
    console.log(test)
  })
}

export { initTagify };


