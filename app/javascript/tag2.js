document.addEventListener("DOMContentLoaded", () => {
  // console.log("ok");
const tagNameInputNewItem = document.getElementById("item_tag_tag_name");
  if (tagNameInputNewItem){
    // console.log("ok");
    const inputElement2 = document.getElementById("item_tag_tag_name");
    inputElement2.addEventListener("input", () => {
      // console.log("ok");
      const keyword = document.getElementById("item_tag_tag_name").value;
      const XHR2 = new XMLHttpRequest();
      XHR2.open("GET", `/items/search/?keyword=${keyword}`, true);
      XHR2.responseType = "json";
      XHR2.send();
      XHR2.onload = () => {
        // console.log("ok");
        const searchResult2 = document.getElementById("search-result");
        searchResult2.innerHTML = "";
        if (XHR2.response) {
          const tagName2 = XHR2.response.keyword;
          tagName2.forEach((tag) => {
            const childElement2 = document.createElement("div");
            childElement2.setAttribute("class", "child");
            childElement2.setAttribute("id", tag.id);
            childElement2.innerHTML = tag.tag_name;
            searchResult2.appendChild(childElement2);
            const clickElement2 = document.getElementById(tag.id);
            clickElement2.addEventListener("click", () => {
              document.getElementById("item_tag_tag_name").value = clickElement2.textContent;
              clickElement2.remove();
              searchResult2.innerHTML = "";
            });
          });
        };
      };
    });
  };
});