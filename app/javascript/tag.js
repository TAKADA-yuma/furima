document.addEventListener("DOMContentLoaded", () => {
  const tagNameInput = document.getElementById("input-box");
    if (tagNameInput){
      const inputElement = document.getElementById("input-box");
       inputElement.addEventListener("input", () => {
          const keyword = document.getElementById("input-box").value;
          const XHR = new XMLHttpRequest();
          XHR.open("GET", `/items/search/?keyword=${keyword}`, true);
          XHR.responseType = "json";
          XHR.send();
          XHR.onload = () => {
            const searchResult = document.getElementById("search-result");
            searchResult.innerHTML = "";
            // 検索結果を挿入している要素のinnerHTMLプロパティに対して、空の文字列を指定することで、表示されているタグを消す
            if (XHR.response){
              const tagName = XHR.response.keyword;
              // console.log(keyword)表示される
              // console.log(tagName)表示されない
              tagName.forEach((tag) => {
                const childElement = document.createElement("div");
                childElement.setAttribute("class", "child");
                childElement.setAttribute("id", tag.id);
                childElement.innerHTML = tag.tag_name;
                searchResult.appendChild(childElement);
                // appendChildメソッドを用いて、用意した要素（１８〜２１行目）を検索結果の要素に挿入しています
                const clickElement = document.getElementById(tag.id);
                clickElement.addEventListener("click", () => {
                  document.getElementById("input-box").value = clickElement.textContent;
                  clickElement.remove();
                  searchResult.innerHTML = "";
                  // 髙田の独断で追加
                });
              });
            };
          };
       });
    };
});

