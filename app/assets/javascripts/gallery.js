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


  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];


  // 選択された画像が5枚未満の場合に、
  // fileIndexの先頭の数字を使って画像用のinputを生成する
  $('#image-box').on('change', '.js-file', function(e) {
    $(document).ready(function(){
      let SelectedImg = $('.input-group').length
      if (SelectedImg < 5){
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
});