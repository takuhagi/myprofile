// 日時の場合
$(function () {
  $('.datetimepicker').datetimepicker({
    format: 'YYYY-MM-DD HH:mm'
  });
});
// 日付のみの場合
$(function () {
  $('.datepicker').datetimepicker({
    format: 'YYYY-MM-DD'
  });
});