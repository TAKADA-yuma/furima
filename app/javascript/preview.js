document.addEventListener('DOMContentLoaded', function(){
  // 新規投稿・編集ページのフォームを取得
  const postForm = document.getElementById('new_item');
  //プレビューを表示するためのスペース
  const previewList = document.getElementById('previews');
  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!postForm) return null;
    const fileField = document.querySelector('input[type="file"][name="item[image]"]');

    // input要素で値の変化が起きた際に呼び出される関数
    fileField.addEventListener('change', function(e){
        // 古いプレビューが存在する場合は削除
        const alreadyPreview = document.querySelector('.preview');
        if (alreadyPreview) {
          alreadyPreview.remove();
        };
        // 選択した画像ファイルは、発火したイベントeの中の、targetの中の、filesという配列に格納されています
        const file = e.target.files[0];
        // 選択された画像ファイルは、ブラウザ側がblobと呼ばれる形のデータで保持しています。
        // 上記データへとアクセスするURLを生成しているため、生成されたURLはblobという変数に代入しています。
        const blob = window.URL.createObjectURL(file);
        // 画像を表示するためのdiv要素を生成
        const previewWrapper = document.createElement('div');
        previewWrapper.setAttribute('class', 'preview');
        // 表示する画像を生成
        const previewImage = document.createElement('img');
        previewImage.setAttribute('class', 'preview-image');
        //imgタグにsrcを指定
        previewImage.setAttribute('src', blob);
         // 生成したHTMLの要素をブラウザに表示させる
         // 親要素.appendChild.子要素で親要素に子要素を入れ込む
        previewWrapper.appendChild(previewImage);
        previewList.appendChild(previewWrapper);

    });


  
});