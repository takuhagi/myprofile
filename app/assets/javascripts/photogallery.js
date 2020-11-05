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
                        ファイルを選択
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
  const buildFileField2 = ()=> {
    const html = `<div class="preview">
                    <button type="button" class="btn btn-outline-secondary test" >
                      画像を追加
                    </button>
                  </div>
                  `;
    return html;
  }


  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];


  let PreviewLength = $('.preview').length
  console.log(PreviewLength);
  if (PreviewLength < 10) {
    $('#image-previews').append(buildFileField2(fileIndex[0]));

    $('#image-box').append(buildFileField(fileIndex[PreviewLength]));
  }


  // 選択された画像が10枚未満の場合に、
  // fileIndexの先頭の数字を使って画像用のinputを生成する
  $('#image-box').on('change', '.js-file', function(e) {
    $(document).ready(function(){
      let SelectedImg = $('.input-group').length
      if (SelectedImg <= 9){
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


  // 削除ボタン
  $('#image-previews').on('click', '.delete-img', function() {
    const targetIndex = $(this).parent().parent().parent().data('index');

    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"]`);

    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().parent().parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    // $('.js-file_group').remove();


    // 画像入力欄が0個にならないようにしておく
    if ($('.preview').length === 0) {
      console.log("ないよ");
      $('#image-box').append(buildFileField(fileIndex[0]))
    };
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