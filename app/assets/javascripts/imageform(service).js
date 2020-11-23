// $(function(){

//   // 画像用のinputを生成する関数
//   const buildFileField = ( index ) => {
//     const html = `<div class="input-group">
//                     <div class="js-file_group custom-file" data-index="${index}">
//                       <input class="js-file custom-file-input" type="file"
//                       name="service_profile[service_images_attributes][${index}][src]"
//                       id="service_profile_service_images_attributes_${index}_src">
//                       <label class="custom-file-label" for="inputFile" data-browse="参照">
//                         編集画面での画像追加用 data-index=${index}
//                       </label>
//                     </div>
//                     <div class="input-group-append">
//                       <button type="button" class="btn btn-outline-secondary input-group-text" >
//                         削除
//                       </button>
//                     </div>
//                   </div>
//                   `;
//     return html;
//   }

//   // 画像用のinputに対応する追加ボタンを生成する関数
//   const buildAddButton = ( index )=> {
//     const html = `<div class="preview-add" data-index="${index}">
//                     <button type="button" class="btn btn-outline-secondary add-img" >
//                       <i class="fa fa-plus"></i>
//                     </button>
//                   </div>
//                   `;
//     return html;
//   }

//   // プレビューを作成する関数
//   const buildPreview = ( index, url ) => {
//     const html = `<div class="preview" data-index="${index}">
//                     <div class="preview__photo">
//                       <img data-index="${index}" class="image-size" src="${url}">
//                     </div>
//                     <div class="preview__button">
//                       <div class="preview__button--edit">
//                         <button class="btn btn-outline-secondary change-img" type="button">
//                           変更
//                         </button>
//                       </div>
//                       <div class="preview__button--delete">
//                         <button class="btn btn-outline-secondary delete-img cancel-img" type="button">
//                           取消
//                         </button>
//                       </div>
//                     </div>
//                   </div>
//                 `;
//     return html;
//   }


//   // file_fieldのnameに動的なindexをつける為の配列
//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];


//   // 初回アクセス時、「プレビュー画像 + 画像追加ボタン = 10個」
//   // となるように画像追加ボタンを作成する
//   let PreviewLength = $('.preview').length
//   for (let i = 0; i < 10 - PreviewLength; i++) {
//     if (PreviewLength === 0) {
//       // 新規画面用
//       $('#image-previews').append(buildAddButton(fileIndex[PreviewLength]));
//       $('#image-box').append(buildFileField(fileIndex[PreviewLength]));
//       fileIndex.shift();
//       fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
//     } else {
//       // 編集画面用
//       $('#image-previews').append(buildAddButton(fileIndex[PreviewLength - 1]));
//       $('#image-box').append(buildFileField(fileIndex[PreviewLength - 1]));
//       fileIndex.shift();
//       fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
//     }
//   }


//   // 削除・取消ボタン
//   $('#image-previews').on('click', '.delete-img', function() {
//     const targetIndex = $(this).parent().parent().parent().data('index');

//     // 該当indexを振られているチェックボックスを取得する
//     const destroyCheck = $(`input[data-index="${targetIndex}"]`);

//     // もしチェックボックスが存在すればチェックを入れる
//     if (destroyCheck) {
//       destroyCheck.prop('checked', true);
//     }

//     $(this).parent().parent().parent().remove();
//     $(`img[data-index="${targetIndex}"]`).remove();

//     // 削除した分、追加ボタンを増やす
//     if (PreviewLength === 0) {
//       // 新規画面用
//       $('#image-previews').append(buildAddButton(fileIndex[PreviewLength]));
//       $('#image-box').append(buildFileField(fileIndex[PreviewLength]));
//       fileIndex.shift();
//       fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
//     } else {
//       // 編集画面用
//       $('#image-previews').append(buildAddButton(fileIndex[PreviewLength - 1]));
//       $('#image-box').append(buildFileField(fileIndex[PreviewLength - 1]));
//       fileIndex.shift();
//       fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
//     }
//   });


//   // 取消ボタン
//   $('#image-previews').on('click', '.cancel-img', function() {
//     const targetIndex = $(this).parent().parent().parent().data('index');

//     // クリックされた追加ボタンに対応したインプットを取得する
//     const relatedInput = document.getElementById(`service_profile_service_images_attributes_${targetIndex}_src`);
//     $(relatedInput).parent().parent().remove();
//   });



//   // 追加ボタン
//   $('#image-previews').on('click', '.add-img', function(e) {
//     // クリックされた追加ボタンを取得
//     const clickedButton = e.target;
//     // クリックされた追加ボタンのdata-indexを取得する
//     const targetIndex = $(this).parent().data('index');
//     // クリックされた追加ボタンに対応したインプットを取得する
//     const relatedInput = document.getElementById(`service_profile_service_images_attributes_${targetIndex}_src`);
//     // ちゃんと存在していれば、クリックしたことにする
//     if (relatedInput) {
//       relatedInput.click();
//     }
//     // ファイルが選択されたときの処理（プレビュー画像を作成する）
//     $('#image-box').on('change', '.js-file', function() {
//       const file = relatedInput.files[0];
//       const blobUrl = window.URL.createObjectURL(file);
//       // クリックした追加ボタンの位置にプレビューを挿入
//       $(clickedButton).parent().before(buildPreview(targetIndex, blobUrl));
//       // クリックした追加ボタンをremove
//       $(clickedButton).parent().remove();
//     })
//   });




//   // 変更ボタン
//   $('#image-previews').on('click', '.change-img', function(e) {
//     // クリックされた追加ボタンを取得
//     const clickedButton = e.target;

//     // クリックされた追加ボタンに関するindexを取得
//     const targetIndex = $(this).parent().parent().parent().data('index');
    
//     // クリックされた追加ボタンに対応したインプットを取得する
//     const relatedInput = document.getElementById(`service_profile_service_images_attributes_${targetIndex}_src`);
//     // inputが存在すればクリックする（画像選択画面が表示される）
//     if (relatedInput) {
//       relatedInput.click();
//     }

//     // 実際にファイルが選択されたときの処理（プレビュー画像を作成する）
//     $('#image-box').on('change', '.js-file', function() {
//       const file = relatedInput.files[0];
//       const blobUrl = window.URL.createObjectURL(file);
//       // クリックした追加ボタンの位置にプレビューを挿入
//       $(clickedButton).parent().parent().parent().before(buildPreview(targetIndex, blobUrl));
//       // クリックした追加ボタンをremove
//       $(clickedButton).parent().parent().parent().remove();
//     })
//   });
// });