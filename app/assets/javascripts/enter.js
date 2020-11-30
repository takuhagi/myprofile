// enterキーを押下するとsubmitされてしまうのを防ぐスクリプト
// textareaは改行可能
// tagがenterで区切ることができるようになる
  $(function() {
    $(document).on("keypress", "input:not(.allow_submit)", function(event) {
      return event.which !== 13;
    });
  });