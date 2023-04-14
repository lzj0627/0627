<template>
  <el-row type="flex" class="row-bg" justify="center">
    <el-col :xl="6" :lg="7">
      <h2 class="title">登陆后台管理系统</h2>
      <el-image :src="require('@/assets/img/111.jpeg')" style="height: 180px; width: 180px;"></el-image>

    </el-col>

    <el-col :span="1">
      <el-divider direction="vertical"></el-divider>
    </el-col>

    <el-col :xl="6" :lg="7">
      <el-form :model="loginForm" :rules="rules" ref="loginForm" label-width="80px" label-position="center">
        <el-form-item label="" prop="username" style="width: 380px">
          <el-input v-model="loginForm.username" prefix-icon="el-icon-user-solid" placeholder="请输入用户名"></el-input>
        </el-form-item>
        <el-form-item label="" prop="password" style="width: 380px">
          <el-input v-model="loginForm.password" type="password" placeholder="请输入密码"
                    prefix-icon="el-icon-s-goods"></el-input>
        </el-form-item>

        <!--                <el-form-item label="记住密码" style="width: 380px">-->
        <!--                    <el-switch v-model="loginForm.delivery"></el-switch>-->
        <!--                </el-form-item>-->


        <el-form-item style="width: 380px">
          <el-button type="primary" @click="submitForm('loginForm')" style="width: 45%">登陆</el-button>
          <el-button type="danger" style="width: 45%">注册</el-button>
        </el-form-item>
      </el-form>
    </el-col>

  </el-row>
</template>

<script>

export default {
  name: "Login",
  data() {
    return {
      loginForm: {
        username: '',
        password: '',
      },
      rules: {
        username: [
          {required: true, message: '请输入用户名', trigger: 'blur'}
        ],
        password: [
          {required: true, message: '请输入密码', trigger: 'blur'}
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$axios.post(this.$settings.BASE_URL + '/user/login/', this.loginForm).then(res => {
            if (res.data.code === 100) {
              const token = res.data.token
              this.$cookies.set('token', token)
              // this.$cookies.set('username', res.data.username)
              // this.$cookies.set('avatar', res.data.avatar)
              this.$cookies.set('userinfo', {username:res.data.username, avatar:res.data.avatar})
              this.$router.push("/index")
            } else {
              this.$message({message:res.data.msg, type:"error"})
            }

          })
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },

  },

}

</script>

<style scoped>


.el-row {
  color: aliceblue;
  background-color: #2d3a4b;
  height: 100%;
  width: 100%;
  display: flex;
  align-items: center;
  text-align: center;
  justify-content: center;
}

.el-divider {
  height: 250px;
}


</style>
