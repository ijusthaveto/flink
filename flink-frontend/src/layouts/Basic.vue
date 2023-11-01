<template>
  <!-- nav bar -->
  <van-nav-bar
      title="标题"
      right-text="按钮"
      left-arrow
      @click-left="onClickLeft"
      @click-right="onClickRight"
  >
    <template #right>
      <van-icon name="search" size="18" />
    </template>
  </van-nav-bar>

  <!-- content -->
  <div id="content">
    <template v-if="active === 'index'">
      <Index />
    </template>
    <template v-if="active === 'team'">
      <Team />
    </template>
  </div>

  <!-- tab bar -->
  <van-tabbar v-model="active" @change="onChange">
    <van-tabbar-item icon="home-o" name="index">主页</van-tabbar-item>
    <van-tabbar-item icon="search" name="team">队伍</van-tabbar-item>
    <van-tabbar-item icon="friends-o" name="user">用户</van-tabbar-item>
  </van-tabbar>


</template>

<script setup>
import {ref} from "vue";
import {showToast} from "vant";
import Index from "../pages/Index.vue";
import Team from "../pages/Team.vue";

/* nav bar */
const onClickLeft = () => alert("Left");
const onClickRight = () => alert("Right");

/* tab bar */
const active = ref("index");
const onChange = (index) => showToast(`标签 ${index}`);

</script>

<style scoped>

</style>
