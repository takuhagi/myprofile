$(function(){
  bsCustomFileInput.init();
  
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="input-group">
                    <div data-index="${index}" class="js-file_group custom-file">
                      <input class="js-file custom-file-input" type="file" id="inputFile"
                      name="product[images_attributes][${index}][src]"
                      id="product_images_attributes_${index}_src">
                      <label class="custom-file-label" for="inputFile" data-browse="参照">
                        ファイルを選択
                      </label>
                    </div>
                    <div class="input-group-append">
                      <button type="button" class="btn btn-outline-secondary input-group-text js-remove" id="inputFileRest" >
                        削除
                      </button>
                    </div>
                  </div>
                  `;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    bsCustomFileInput.init();
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

  $(document).ready(function(){
    var image_num = $('.item-image').length
    if (image_num==10){
      $('#image-box__container').css('display', 'none')
    }
  });
});