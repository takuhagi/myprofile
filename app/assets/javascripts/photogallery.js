$(function(){
  bsCustomFileInput.init();

  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="input-group">
                    <div class="js-file_group custom-file" data-index="${index}">
                      <input class="js-file custom-file-input" type="file"
                      name="profile[images_attributes][${index}][src]"
                      id="profile_images_attributes_${index}_src">
                      <label class="custom-file-label" for="inputFile" data-browse="参照">
                        編集画面での画像追加用 data-index=${index}
                      </label>
                    </div>
                    <div class="input-group-append">
                      <button type="button" class="btn btn-outline-secondary input-group-text js-remove" >
                        削除
                      </button>
                    </div>
                  </div>
                  `;
    return html;
  }
  // 画像用のinputに対応するボタンを生成する関数
  const buildFileField2 = (index)=> {
    const html = `<div class="preview-add" data-index="${index}">
                    <button type="button" class="btn btn-outline-secondary add-img" >
                      画像を追加 data-index=${index}
                    </button>
                  </div>
                  `;
    return html;
  }

  const buildPreview = ( index, url ) => {
    const html = `<div class="preview" data-index="${index}">
                    <div class="preview__photo">
                      <img data-index="${index}" class="image-size" src="${url}">
                    </div>
                    <div class="preview__button">
                      <div class="preview__button--edit">
                        <button class="btn btn-outline-secondary change-img" type="button">
                          変更
                        </button>
                      </div>
                      <div class="preview__button--delete">
                        <button class="btn btn-outline-secondary delete-img" type="button">
                          取消
                        </button>
                      </div>
                    </div>
                  </div>
                `;
    return html;
  }


  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  // 編集画面に初回アクセス時、「プレビュー画像 + 画像追加ボタン = 10」
  // となるように画像追加ボタンを作成する
  let PreviewLength = $('.preview').length
  for (let i = 0; i < 10 - PreviewLength; i++) {
    $('#image-previews').append(buildFileField2(fileIndex[PreviewLength - 1]));
    $('#image-box').append(buildFileField(fileIndex[PreviewLength - 1]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  }


  // 選択された画像が10枚未満の場合に、
  // fileIndexの先頭の数字を使って画像用のinputを生成する
  $('#image-box').on('change', '.js-file', function(e) {
    $(document).ready(function(){
      let SelectedImg = $('.input-group').length
      if (SelectedImg <= 9) {
        $('#image-box').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        // 末尾の数に1足した数を追加する
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
      }
    });
    // ファイルボックス内のファイル名を表示する
    bsCustomFileInput.init();
  });


  // 削除ボタンを押したら該当のinputを削除する
  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) {
      $('#image-box').append(buildFileField(fileIndex[0]));
    }
  });


  // 編集画面の削除ボタンをクリックした際に行う処理
  $('#image-previews').on('click', '.delete-img', function() {
    const targetIndex = $(this).parent().parent().parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"]`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().parent().parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    // 削除ボタンをクリックした分、追加ボタンを増やす
    $('#image-previews').append(buildFileField2(fileIndex[PreviewLength - 1]));
    $('#image-box').append(buildFileField(fileIndex[PreviewLength - 1]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });




  // 追加ボタンをクリックした際の処理
  $('#image-previews').on('click', '.add-img', function(e) {
    // クリックされた追加ボタンを取得
    const clickedButton = e.target;
    // クリックされた追加ボタンのdata-indexを取得する
    const targetIndex = $(this).parent().data('index');
    // クリックされた追加ボタンに対応したインプットを取得する
    const relatedInput = document.getElementById(`profile_images_attributes_${targetIndex}_src`);
    // ちゃんと存在していれば、クリックしたことにする
    if (relatedInput) {
      relatedInput.click();
    }
    console.log(relatedInput);
  
    // ファイルが選択されたときの処理（プレビュー画像を作成する）
    $('#image-box').on('change', '.js-file', function() {
      const file = relatedInput.files[0];
      console.log(file);
      const blobUrl = window.URL.createObjectURL(file);
      console.log(blobUrl);

      console.log(clickedButton);
      // クリックした追加ボタンの位置にプレビューを挿入
      $(clickedButton).parent().before(buildPreview(targetIndex, blobUrl));
      // クリックした追加ボタンをremove
      $(clickedButton).parent().remove();
    })
  });




  // 変更ボタン
  $('#image-previews').on('click', '.change-img', function() {
    const targetIndex = $(this).parent().parent().parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenChange = $(`input[id="profile_images_attributes_${targetIndex}_src"]`);
    console.log(hiddenChange);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenChange) hiddenChange.click();

    // $(this).parent().parent().remove();
    // $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) {
      $('#image-box').append(buildFileField(fileIndex[0]))
    };
  });
});





// モーダル表示用プラグイン「Modaal」のための記述
$(function(){
  $('.modaal').modaal();
});