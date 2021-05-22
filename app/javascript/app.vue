<template>
  <div id="app">
    <div id="overlay" v-show="showContent">
      <div id="content">
        <form>
          <label for="task">タスク:</label>
          <input type="text" id="task" v-model="task">
          <p>{{task}}</p>
          <label for="startTime">開始</label>
          <input type="time" id="startTime" v-model="startTime">
          <label for="finishTime">終了</label>
          <input type="time" id="finishTime" v-model="finishTime">
        </form>
        <p><button v-on:click="closeModal">保存</button></p>
      </div>
    </div>
    
    <table>
      <tr>
        <th colspan="3">5-21(月)</th>
      </tr>
      <tr>
        <th>時刻</th>
        <th>予定</th>
        <th>実際</th>
      </tr>
      <tr>
        <td>9時</td>
        <td v-on:click="openModal"></td>
        <td v-on:click="openModal"></td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  data () {
    return {
        showContent:false,
        task:"",
        startTime:'',
        finishTime:'',
    }
  },
  methods:{
    openModal: function(){
      this.showContent = true
    },
    closeModal: function(){
      this.showContent = false
    },
  }
}
</script>

<style scoped>

#overlay{
  /*　要素を重ねた時の順番　*/
  z-index:1;

  /*　画面全体を覆う設定　*/
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background-color:rgba(0,0,0,0.5);

  /*　画面の中央に要素を表示させる設定　*/
  display: flex;
  align-items: center;
  justify-content: center;

}
#content{
  z-index:2;
  width:50%;
  padding: 1em;
  background:#fff;
}
td {
    background-color: white;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all  0.3s ease;
    width: 60px;
    }
td:hover {
    background-color :#ffc9d7;
    cursor: pointer;
    cursor: hand;
    }

</style>
