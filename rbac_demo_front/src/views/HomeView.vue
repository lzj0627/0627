<template>
  <el-container>
    <el-header style="padding: 0">
      <el-menu
          class="el-menu-demo"
          mode="horizontal"
          background-color="#545c64"
          text-color="#fff"
          active-text-color="#ffd04b">

        <div class="header-avatar">
          <el-avatar :size="50" :src="userinfo.avatar"></el-avatar>
          <span style="color: white">{{ userinfo.username }}</span>
          <el-dropdown>
            <span class="el-dropdown-link" >
              个人中心<i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item @click.native="drawer=true">修改个人信息</el-dropdown-item>
              <el-dropdown-item @click.native="logout">退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
        <el-menu-item index="4"><a href="#" target="_blank">后台管理DEMO</a></el-menu-item>
      </el-menu>
    </el-header>
    <el-container>
      <el-aside width="200px">
        <el-menu
            default-active="2"
            class="el-menu-vertical-demo"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b">
          <el-menu-item index="index" @click="addTab({title: '首页', name: 'index'})">
            <template slot="title">
              <i class="el-icon-s-home"></i>
              <span>首页</span>
            </template>
          </el-menu-item>
          <el-submenu :index="menu.name" v-for="menu in menu_list" :key="menu.name">
            <template slot="title">
              <i class="el-icon-location"></i>
              <span>{{ menu.name }}</span>
            </template>
            <router-link :to="item.path" v-for="item in menu.children" :key="item.name">
              <el-menu-item :index="item.name" @click="addTab(item)">{{ item.title }}</el-menu-item>
            </router-link>
          </el-submenu>
        </el-menu>

      </el-aside>
      <el-main style="padding: 0">
        <el-tabs v-model="editableTabsValue" type="card" closable @tab-remove="removeTab" @tab-click="page">
          <el-tab-pane
              :key="item.name"
              v-for="(item, index) in editableTabs"
              :label="item.title"
              :name="item.name"
          >
          </el-tab-pane>
        </el-tabs>
        <div>
          <router-view/>
        </div>
      </el-main>
    </el-container>

    <el-drawer
        title="我是标题"
        :visible.sync="drawer"
        :with-header="false">
      <div align="center">
        <h1>修改个人信息</h1>
        <el-upload
            class="avatar-uploader"
            :action="upurl"
            :show-file-list="false"
            :headers="header"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload">
          <el-tooltip class="item" effect="dark" content="点击更换头像" placement="top-start">
            <img v-if="imageUrl" :src="imageUrl" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-tooltip>
        </el-upload>
        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
          <el-form-item label="旧密码" prop="oldpass">
            <el-input type="password" v-model="ruleForm.oldpass" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="新密码" prop="pass">
            <el-input type="password" v-model="ruleForm.pass" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="checkPass">
            <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
            <el-button @click="resetForm('ruleForm')">重置</el-button>
          </el-form-item>
        </el-form>

      </div>

    </el-drawer>
  </el-container>


</template>

<script>
// @ is an alias to /src

export default {
  name: 'HomeView',
  components: {},
  data() {
    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'));
      } else if (value.length < 3) {
        callback(new Error('密码过短!!'))
      } else {
        if (this.ruleForm.checkPass !== '') {
          this.$refs.ruleForm.validateField('checkPass');
        }
        callback();
      }
    };
    var validateOldPass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入旧密码'));
      } else {
        if (this.ruleForm.checkPass !== '') {
          this.$refs.ruleForm.validateField('pass');
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'));
      } else if (value !== this.ruleForm.pass) {
        callback(new Error('两次输入密码不一致!'));
      } else {
        callback();
      }
    };
    return {
      ruleForm: {
        oldpass: '',
        pass: '',
        checkPass: '',
      },
      rules: {
        oldpass: [{validator: validateOldPass, trigger: 'blur'}],
        pass: [
          {validator: validatePass, trigger: 'blur'}
        ],
        checkPass: [
          {validator: validatePass2, trigger: 'blur'}
        ]
      },
      header: '',
      upurl: '',
      imageUrl: '',
      drawer: false,
      userinfo: {
        name: 'lzj',
        avatar: ''
      },
      editableTabsValue: 'index',
      editableTabs: [{
        title: '首页',
        name: 'index',
      },
        {
          title: '用户管理',
          name: 'user',
        },
        {
          title: '角色管理',
          name: 'role',
        }
      ],
      tabIndex: 1
    }
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$axios.post(this.$settings.BASE_URL + '/user/userinfo/userinfo/', this.ruleForm, {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
            if (res.data.code === 100) {
              this.$message({
                showClose: true,
                message: '修改成功',
                type: 'success',
                onClose: () => {
                  this.$router.push('/login')
                  this.$cookies.remove('token')
                  this.$cookies.remove('userinfo')
                }
              })
            } else {
              this.$message.warning(res.data.msg)
            }
          })
        } else {
          this.$message.error('失败')
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    handleAvatarSuccess(res, file) {
      this.imageUrl = res.avatar;
      let old = this.$cookies.get('userinfo')
      old.avatar = this.imageUrl
      this.userinfo = old
      this.$cookies.remove('userinfo')
      this.$cookies.set('userinfo', old)
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    },
    page(target) {
      this.editableTabsValue = target.name
      this.$router.push({name: target.name})
      // if ()
    },
    logout() {
      this.$cookies.remove('token')
      this.$cookies.remove('userinfo')
      this.$store.state.menu_list = []
      this.$store.state.has_router = false
      this.$router.push('/login')
    },
    addTab(item) {
      let index = this.editableTabs.findIndex(e => e.name === item.name)
      if (index === -1) {
        this.editableTabs.push({
          title: item.title,
          name: item.name
        });
      }
      this.editableTabsValue = item.name;
      if (item.path) {
        // if (this.$route.path !== item.path){
        this.$router.push(item.path)
        // }
      } else {
        // if (this.$route.path !== item.path){
        this.$router.push({name: item.name})
        // }

      }

    },
    removeTab(targetName) {
      let tabs = this.editableTabs;
      let activeName = this.editableTabsValue;
      if (activeName === targetName) {
        tabs.forEach((tab, index) => {
          if (tab.name === targetName) {
            let nextTab = tabs[index + 1] || tabs[index - 1];
            if (nextTab) {
              activeName = nextTab.name;
            }
          }
        });
      }

      this.editableTabsValue = activeName;
      this.$router.push({name: this.editableTabsValue})
      this.editableTabs = tabs.filter(tab => tab.name !== targetName);
    }
  },
  created() {
    this.userinfo = this.$cookies.get('userinfo')
    this.imageUrl = this.userinfo.avatar
    this.upurl = this.$settings.BASE_URL + '/user/userinfo/avatar/'
    this.header = {Authorization: this.$cookies.get('token')}
  },
  computed: {
    menu_list: {
      get() {
        return this.$store.state.menu_list
      }
    }
  },
}
</script>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}

.avatar {
  width: 178px;
  height: 178px;
  display: block;
}

.el-menu-vertical-demo {
  height: 100%;
}

.el-dropdown-link {
  color: white;
}

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
  margin: 0
}
</style>
