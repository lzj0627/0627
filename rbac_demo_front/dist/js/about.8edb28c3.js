"use strict";(self["webpackChunkrbac_demo_front"]=self["webpackChunkrbac_demo_front"]||[]).push([[443],{7832:function(e,t,r){r.r(t),r.d(t,{default:function(){return u}});var s=function(){var e=this,t=e._self._c;return t("el-row",{staticClass:"row-bg",attrs:{type:"flex",justify:"center"}},[t("el-col",{attrs:{xl:6,lg:7}},[t("h2",{staticClass:"title"},[e._v("登陆后台管理系统")]),t("el-image",{staticStyle:{height:"180px",width:"180px"},attrs:{src:r(8860)}})],1),t("el-col",{attrs:{span:1}},[t("el-divider",{attrs:{direction:"vertical"}})],1),t("el-col",{attrs:{xl:6,lg:7}},[t("el-form",{ref:"loginForm",attrs:{model:e.loginForm,rules:e.rules,"label-width":"80px","label-position":"center"}},[t("el-form-item",{staticStyle:{width:"380px"},attrs:{label:"",prop:"username"}},[t("el-input",{attrs:{"prefix-icon":"el-icon-user-solid",placeholder:"请输入用户名"},model:{value:e.loginForm.username,callback:function(t){e.$set(e.loginForm,"username",t)},expression:"loginForm.username"}})],1),t("el-form-item",{staticStyle:{width:"380px"},attrs:{label:"",prop:"password"}},[t("el-input",{attrs:{type:"password",placeholder:"请输入密码","prefix-icon":"el-icon-s-goods"},model:{value:e.loginForm.password,callback:function(t){e.$set(e.loginForm,"password",t)},expression:"loginForm.password"}})],1),t("el-form-item",{staticStyle:{width:"380px"}},[t("el-button",{staticStyle:{width:"45%"},attrs:{type:"primary"},on:{click:function(t){return e.submitForm("loginForm")}}},[e._v("登陆")]),t("el-button",{staticStyle:{width:"45%"},attrs:{type:"danger"}},[e._v("注册")])],1)],1)],1)],1)},o=[],i=(r(7658),{name:"Login",data(){return{loginForm:{username:"",password:""},rules:{username:[{required:!0,message:"请输入用户名",trigger:"blur"}],password:[{required:!0,message:"请输入密码",trigger:"blur"}]}}},methods:{submitForm(e){this.$refs[e].validate((e=>{if(!e)return console.log("error submit!!"),!1;this.$axios.post(this.$settings.BASE_URL+"/user/login/",this.loginForm).then((e=>{if(100===e.data.code){const t=e.data.token;this.$cookies.set("token",t),this.$cookies.set("userinfo",{username:e.data.username,avatar:e.data.avatar}),this.$router.push("/index")}else this.$message({message:e.data.msg,type:"error"})}))}))},resetForm(e){this.$refs[e].resetFields()}}}),a=i,l=r(1001),n=(0,l.Z)(a,s,o,!1,null,"4548eae8",null),u=n.exports},8860:function(e,t,r){e.exports=r.p+"img/111.37420225.jpeg"}}]);
//# sourceMappingURL=about.8edb28c3.js.map