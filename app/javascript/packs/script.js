new Vue({
  el: '#app',
  data() {
    return {
      red: 0,
      blue: 0,
      green: 0,
      color: 0
    };
  },
  computed: {
    bindStyle() {
      return `background: rgb(${this.red}, ${this.green}, ${this.blue})`;
    }
  }
});