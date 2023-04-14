<template>
  <el-container>
    <el-header style="background-color: rgb(48, 65, 86);color: aliceblue">
      <strong style="float: left;size: 1000px;font-size: 25px">后台管理系统</strong>

      <div class="header-avatar">

        <el-avatar size="medium"
                   src="https://tva1.sinaimg.cn/large/00831rSTly1gd1u0jw182j30u00u043b.jpg"></el-avatar>
        <el-dropdown style="color: aliceblue">
						<span class="el-dropdown-link">
						{{ userInfo.username }}<i class="el-icon-arrow-down el-icon--right"></i>
						</span>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item>
              <router-link :to="{name: 'UserCenter'}">个人中心</router-link>
            </el-dropdown-item>
            <el-dropdown-item @click.native="handleLogout">退出</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>

        <el-link href="http://www.liuqingzheng.top" target="_blank" style="color: aliceblue">个人网站</el-link>
      </div>

    </el-header>

    <el-container>
      <el-aside width="200px">

      </el-aside>
      <el-main>
        <MenuTest></MenuTest>
        <div style="margin:0 15px">
          <router-view/>
        </div>

      </el-main>
    </el-container>

  </el-container>
</template>

<script>
import MenuTest from "@/components/MenuTest";

export default {
  name: "Home",
  components: {
    MenuTest
  },
  data() {
    return {
      userInfo: {
        id: "",
        username: "刘清政",
        avatar: ""
      },
      dialogFormVisible: false,
      form: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: ''
      },
      formLabelWidth: '120px',

    }
  },
  created() {
    this.getUserInfo()
  },
  methods: {
    getUserInfo() {
      // this.$http.get("/sys/userInfo").then(res => {
      //   this.userInfo = res.data
      // })
    },
    handleLogout() {
      localStorage.clear()
      sessionStorage.clear()
      this.$store.commit("resetState")
      this.$router.push("/login")
      // this.$http.post("/logout").then(res => {
      //   localStorage.clear()
      //   sessionStorage.clear()
      //   this.$store.commit("resetState")
      //   this.$router.push("/login")
      // })
    }
  }
}
</script>

<style scoped>
.el-container {
  padding: 0;
  margin: 0;
  height: 100%;
}

.header-avatar {
  float: right;
  width: 210px;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.el-dropdown-link {
  cursor: pointer;
}

.el-header {
  background-color: #17B3A3;
  color: #333;
  text-align: center;
  line-height: 60px;
}

.el-aside {
  background-color: #D3DCE6;
  color: #333;
  line-height: 200px;
}

.el-main {
  color: #333;
  padding: 0;
}

a {
  text-decoration: none;
}
</style>