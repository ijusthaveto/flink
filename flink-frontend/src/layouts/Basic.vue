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
    <router-view />
  </div>

  <!-- tab bar -->
  <van-tabbar route @change="onChange">
    <van-tabbar-item replace to="/" icon="home-o" name="index">主页</van-tabbar-item>
    <van-tabbar-item replace to="/team" icon="search" name="team">队伍</van-tabbar-item>
    <van-tabbar-item replace to="/user" icon="friends-o" name="user">用户</van-tabbar-item>
  </van-tabbar>


</template>

<script setup>
import {showToast} from "vant";

/* nav bar */
const onClickLeft = () => alert("Left");
const onClickRight = () => alert("Right");

/* tab bar */
const onChange = (index) => showToast(`标签 ${index}`);

</script>

<style scoped>

</style>
