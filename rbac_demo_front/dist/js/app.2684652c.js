(function(){var e={7945:function(e,t,a){"use strict";a.r(t),a.d(t,{default:function(){return d}});var r=function(){var e=this,t=e._self._c;return t("div",[t("el-row",[t("el-col",{attrs:{span:12}},[t("div",{staticClass:"grid-content bg-purple"},[t("div",{staticStyle:{height:"400px",width:"100%"},attrs:{id:"main2"}})])]),t("el-col",{attrs:{span:12}},[t("div",{staticClass:"grid-content bg-purple-light"},[t("div",{staticStyle:{height:"400px",width:"100%"},attrs:{id:"main1"}})])])],1),t("el-row",[t("el-col",{attrs:{span:24}},[t("div",{staticClass:"grid-content bg-purple-dark"},[t("div",{staticStyle:{height:"400px",width:"100%"},attrs:{id:"main3"}})])])],1)],1)},s=[],i=a(9043),o=(a(6787),a(4239),{name:"IndexView",data(){return{bro_list:[],chartInstance:null,option_1:{title:{text:"访问统计"},tooltip:{},legend:{data:["访问量"]},xAxis:{data:["05-01","05-02","05-03","05-04","05-05","05-06"]},yAxis:{},series:[{name:"销量",type:"bar",data:[5,20,36,10,10,20]}]},option_2:{title:{text:"用户访问来源",subtext:"纯属虚构",left:"center"},tooltip:{trigger:"item"},legend:{orient:"vertical",left:"left"},series:[{name:"访问来源",type:"pie",radius:"50%",data:[],emphasis:{itemStyle:{shadowBlur:10,shadowOffsetX:0,shadowColor:"rgba(0, 0, 0, 0.5)"}}}]},option_3:{title:{text:"访问人数统计"},tooltip:{trigger:"axis"},legend:{data:["实际访问人数","预测人数"]},grid:{left:"3%",right:"4%",bottom:"3%",containLabel:!0},toolbox:{feature:{saveAsImage:{}}},xAxis:{type:"category",boundaryGap:!1,data:["周一","周二","周三","周四","周五","周六","周日"]},yAxis:{type:"value"},series:[{name:"实际访问人数",type:"line",stack:"总量",data:[120,182,101,234,190,330,110]},{name:"预测人数",type:"line",stack:"总量",data:[220,303,89,134,290,330,310]}]}}},created(){this.$axios.get(this.$settings.BASE_URL+"/visit/visit/browser_all/",{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.$store.commit("setBro",e.data.data),this.option_2.series[0].data=e.data.data})),this.option_2.series[0].data=this.$store.state.bro_all},mounted(){var e=i.S1(document.getElementById("main1")),t=i.S1(document.getElementById("main2")),a=i.S1(document.getElementById("main3"));e.setOption(this.option_1),t.setOption(this.option_2),a.setOption(this.option_3)}}),n=o,l=a(1001),u=(0,l.Z)(n,r,s,!1,null,"5fc6b860",null),d=u.exports},4934:function(e,t,a){"use strict";a.r(t),a.d(t,{default:function(){return u}});var r=function(){var e=this,t=e._self._c;return t("router-link",{attrs:{to:"/index"}},[t("h1",[e._v("点我")])])},s=[],i={name:"Menu"},o=i,n=a(1001),l=(0,n.Z)(o,r,s,!1,null,"60c437c4",null),u=l.exports},2173:function(e,t,a){"use strict";a.r(t),a.d(t,{default:function(){return c}});var r=function(){var e=this,t=e._self._c;return t("div",[t("div",[t("el-autocomplete",{attrs:{"fetch-suggestions":e.querySearchAsync,placeholder:"请输入搜索内容","trigger-on-focus":!1},on:{input:e.handInput},model:{value:e.state,callback:function(t){e.state=t},expression:"state"}}),t("el-button",{staticStyle:{"margin-left":"10px"},attrs:{type:"primary"},on:{click:e.searchUser}},[e._v(" 搜索 ")]),e.hasAuth("user:add")?t("el-button",{staticStyle:{"margin-left":"10px"},attrs:{type:"primary"},on:{click:function(t){e.dialogVisible=!0}}},[e._v(" 新增用户 ")]):e._e(),e.hasAuth("user:del")?t("el-button",{attrs:{type:"danger"},on:{click:function(t){return e.delClick(null)}}},[e._v("批量删除")]):e._e()],1),t("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticStyle:{width:"100%","margin-top":"15px"},attrs:{data:e.tableData,border:""},on:{"selection-change":e.handleSelectionChange}},[t("el-table-column",{attrs:{type:"selection",width:"55"}}),t("el-table-column",{attrs:{prop:"date",label:"头像",width:"60"},scopedSlots:e._u([{key:"default",fn:function(e){return[t("el-avatar",{attrs:{size:"small",src:e.row.avatar}})]}}])}),t("el-table-column",{attrs:{prop:"username",label:"用户名",width:"180"}}),t("el-table-column",{attrs:{prop:"gender_name",label:"性别"}}),t("el-table-column",{attrs:{prop:"roles",label:"角色"},scopedSlots:e._u([{key:"default",fn:function(a){return e._l(a.row.role_list,(function(a){return t("el-tag",{key:a.name,attrs:{size:"small",type:"danger"}},[e._v(e._s(a.name)+" ")])}))}}])}),t("el-table-column",{attrs:{prop:"email",label:"邮箱"}}),t("el-table-column",{attrs:{prop:"mobile",label:"手机号"}}),t("el-table-column",{attrs:{prop:"status",label:"状态"},scopedSlots:e._u([{key:"default",fn:function(a){return[a.row.status?t("el-tag",{attrs:{size:"small",type:"success"}},[e._v("正常")]):t("el-tag",{attrs:{size:"small",type:"danger"}},[e._v("禁用")])]}}])}),t("el-table-column",{attrs:{prop:"date_joined",label:"创建时间"}}),t("el-table-column",{attrs:{prop:"mod",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(a){return[e.hasAuth("user:mod")?t("el-button",{attrs:{type:"primary",icon:"el-icon-edit",circle:""},on:{click:function(t){return e.editClick(a.row.id)}}}):e._e(),e.hasAuth("user:del")?t("el-button",{attrs:{type:"danger",icon:"el-icon-delete",circle:""},on:{click:function(t){return e.delClick(a.row.id)}}}):e._e()]}}])})],1),t("el-dialog",{directives:[{name:"loading",rawName:"v-loading"}],attrs:{title:e.title,visible:e.dialogVisible,width:"30%","before-close":e.handleClose},on:{"update:visible":function(t){e.dialogVisible=t}}},[t("el-form",{ref:"ruleForm",staticClass:"demo-ruleForm",attrs:{model:e.ruleForm,rules:e.rules,"label-width":"100px"}},[t("el-form-item",{attrs:{label:"用户名",prop:"username"}},[t("el-input",{model:{value:e.ruleForm.username,callback:function(t){e.$set(e.ruleForm,"username",t)},expression:"ruleForm.username"}})],1),t("el-form-item",{attrs:{label:"手机号",prop:"mobile"}},[t("el-input",{model:{value:e.ruleForm.mobile,callback:function(t){e.$set(e.ruleForm,"mobile",t)},expression:"ruleForm.mobile"}})],1),t("el-form-item",{attrs:{label:"邮箱",prop:"email"}},[t("el-input",{model:{value:e.ruleForm.email,callback:function(t){e.$set(e.ruleForm,"email",t)},expression:"ruleForm.email"}})],1),t("el-form-item",{attrs:{label:"性别",prop:"gender"}},[t("el-select",{attrs:{placeholder:"请选择性别"},model:{value:e.ruleForm.gender,callback:function(t){e.$set(e.ruleForm,"gender",t)},expression:"ruleForm.gender"}},[t("el-option",{attrs:{label:"男",value:"1"}}),t("el-option",{attrs:{label:"女",value:"2"}}),t("el-option",{attrs:{label:"保密",value:"3"}})],1)],1),t("el-form-item",{attrs:{label:"部门",prop:"dept"}},[t("treeselect",{staticStyle:{width:"170px"},attrs:{placeholder:"选择部门",options:e.depts},on:{input:e.get_job},model:{value:e.ruleForm.dept,callback:function(t){e.$set(e.ruleForm,"dept",t)},expression:"ruleForm.dept"}})],1),t("el-form-item",{attrs:{label:"岗位",prop:"job"}},[t("el-select",{attrs:{multiple:"",placeholder:"请选择"},model:{value:e.ruleForm.job,callback:function(t){e.$set(e.ruleForm,"job",t)},expression:"ruleForm.job"}},e._l(e.jobs,(function(e){return t("el-option",{key:e.name,attrs:{label:e.name,value:e.id}})})),1)],1),t("el-form-item",{attrs:{label:"角色",prop:"role"}},[t("el-select",{attrs:{multiple:"",placeholder:"请选择"},model:{value:e.ruleForm.roles,callback:function(t){e.$set(e.ruleForm,"roles",t)},expression:"ruleForm.roles"}},e._l(e.roles,(function(e){return t("el-option",{key:e.name,attrs:{label:e.name,value:e.id}})})),1)],1),t("el-form-item",{attrs:{label:"是否启用",prop:"delivery"}},[t("el-switch",{model:{value:e.ruleForm.status,callback:function(t){e.$set(e.ruleForm,"status",t)},expression:"ruleForm.status"}})],1)],1),t("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[t("el-button",{on:{click:e.handleClose}},[e._v("取 消")]),t("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.submitForm("ruleForm")}}},[e._v("确 定")])],1)],1),t("el-pagination",{attrs:{layout:"prev, pager, next",total:e.count,"page-size":5},on:{"next-click":e.nextPage,"current-change":e.getPage,"prev-click":e.prevPage}})],1)},s=[],i=(a(7658),a(7859)),o=a.n(i),n={name:"UserView",data(){return{loading:!1,prev_page:"",next_page:"",count:"",firstData:[],restaurants:[],state:"",timeout:null,title:"新增",multipleSelection:[],tableData:[],permission:[],depts:[],jobs:[],roles:[],dept_list:[],dialogVisible:!1,ruleForm:{username:"",gender:"",status:!0,dept:null,roles:[],job:[],mobile:"",email:""},rules:{username:[{required:!0,message:"请输入用户名",trigger:"blur"},{min:3,max:5,message:"长度在 3 到 5 个字符",trigger:"blur"}],gender:[{required:!0,message:"请选择性别",trigger:"change"}],email:[{type:"email",message:"请输入正确的邮箱地址",trigger:["blur","change"]}],mobile:[{required:!0,message:"请输入手机号",trigger:"blur"}]},defaultProps:{children:"child",label:"name"}}},methods:{searchUser(){this.loading=!0,this.$axios.get(this.$settings.BASE_URL+"/user/user/?search="+this.state,{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.tableData=e.data.data.results,this.count=e.data.data.count,this.loading=!1}))},prevPage(){this.$axios.get(this.prev_page,{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.tableData=e.data.data.results,this.next_page=e.data.data.next}))},getPage(e){this.$axios.get(this.$settings.BASE_URL+"/user/user/?page="+e,{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.tableData=e.data.data.results,this.next_page=e.data.data.next,this.prev_page=e.data.data.previous}))},nextPage(){this.$axios.get(this.next_page,{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.tableData=e.data.data.results,this.prev_page=e.data.data.previous}))},handleSelectionChange(e){this.multipleSelection=e,console.log(this.multipleSelection)},editClick(e){this.$axios.get(this.$settings.BASE_URL+"/user/user/"+e+"/",{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.ruleForm=e.data.data})),this.title="修改",this.dialogVisible=!0},hasAuth(e){return this.permission.indexOf(e)>-1},delClick(e){let t=[];e?t.push(e):(console.log(this.multipleSelection),this.multipleSelection.forEach((e=>{t.push(e.id)}))),this.$confirm("此操作将永久删除该用户, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((()=>{this.$axios.post(this.$settings.BASE_URL+"/user/user/del_user/",{ids:t},{headers:{Authorization:this.$cookies.get("token"),Auth:"user:del"}}).then((e=>{this.$message({showClose:!0,message:"删除成功",type:"success",onClose:()=>{this.getUser()}})})).catch()}))},get_job(){this.$axios.get(this.$settings.BASE_URL+"/permission/dept/"+this.ruleForm.dept+"/",{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.ruleForm.id||(this.ruleForm.job=[]),console.log(e.data.data),this.jobs=e.data.data.job_list}))},submitForm(e){this.$refs[e].validate((e=>{if(!e)return this.$message.error("未知异常"),!1;{let e=this.ruleForm.id?this.$axios.put:this.$axios.post;console.log(this.ruleForm),e(this.$settings.BASE_URL+"/user/user/"+(this.ruleForm.id?this.ruleForm.id+"/":""),this.ruleForm,{headers:{Authorization:this.$cookies.get("token"),Auth:(this.ruleForm.id,"user:mod")}}).then((e=>{100===e.data.code?(this.$message.success("操作成功"),this.dialogVisible=!1,this.getUser(),this.ruleForm={username:"",gender:"",status:!0,dept:"",roles:[],job:[],mobile:"",email:""},this.jobs=[]):this.$message.warning(e.data.msg)}))}}))},resetForm(e){this.$refs[e].resetFields()},handleClose(e){this.$confirm("确认关闭？").then((e=>{this.dialogVisible=!1,this.ruleForm={username:"",gender:"",status:!0,dept:null,roles:[],job:[],mobile:"",email:""},this.jobs=[],this.get_dept_list(),this.get_all_dept(),this.title="新增"})).catch((e=>{}))},getUser(){this.$axios.get(this.$settings.BASE_URL+"/user/user/",{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.tableData=e.data.data.results,this.restaurants=e.data.data.results,this.firstData=e.data.data.results,this.count=e.data.data.count,this.permission=this.$store.state.permission_list,this.next_page=e.data.data.next}))},getRole(){this.$axios.get(this.$settings.BASE_URL+"/permission/role/",{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.roles=e.data.data.results}))},get_dept_list(){this.$axios.get(this.$settings.BASE_URL+"/permission/dept/",{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.dept_list=e.data.data.results}))},get_all_dept(){this.$axios.get(this.$settings.BASE_URL+"/permission/dept/all_dept/",{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.depts=e.data.data.results}))},querySearchAsync(e,t){var a=this.restaurants,r=e?a.filter(this.createStateFilter(e)):a;clearTimeout(this.timeout),this.timeout=setTimeout((()=>{t(r)}),800*Math.random())},createStateFilter(e){return console.log(e),t=>-1!==t.username.toLowerCase().indexOf(e.toLowerCase())},handleSelect(e){console.log(e),this.tableData=[e]},handInput(){this.loading=!0,0===this.state.length?setTimeout((()=>{this.loading=!1,this.getUser()}),1e3):setTimeout((()=>{this.loading=!1,this.$axios.get(this.$settings.BASE_URL+"/user/user/?search="+this.state,{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.tableData=e.data.data.results,this.count=e.data.data.count}))}),1e3)}},created(){this.get_dept_list(),this.get_all_dept(),this.getUser(),this.getRole()},components:{Treeselect:o()}},l=n,u=a(1001),d=(0,u.Z)(l,r,s,!1,null,"731a9e83",null),c=d.exports},6787:function(e,t){"use strict";t["Z"]={BASE_URL:"http://106.15.189.8:8000/api/v1"}},7952:function(e,t,a){"use strict";var r=a(6369),s=function(){var e=this,t=e._self._c;return t("div",{attrs:{id:"app"}},[t("router-view")],1)},i=[],o=a(1001),n={},l=(0,o.Z)(n,s,i,!1,null,null,null),u=l.exports,d=(a(7658),a(2631)),c=function(){var e=this,t=e._self._c;return t("el-container",[t("el-header",{staticStyle:{padding:"0"}},[t("el-menu",{staticClass:"el-menu-demo",attrs:{mode:"horizontal","background-color":"#545c64","text-color":"#fff","active-text-color":"#ffd04b"}},[t("div",{staticClass:"header-avatar"},[t("el-avatar",{attrs:{size:50,src:e.userinfo.avatar}}),t("span",{staticStyle:{color:"white"}},[e._v(e._s(e.userinfo.username))]),t("el-dropdown",[t("span",{staticClass:"el-dropdown-link"},[e._v(" 个人中心"),t("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),t("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[t("el-dropdown-item",{nativeOn:{click:function(t){e.drawer=!0}}},[e._v("修改个人信息")]),t("el-dropdown-item",{nativeOn:{click:function(t){return e.logout.apply(null,arguments)}}},[e._v("退出登录")])],1)],1)],1),t("el-menu-item",{attrs:{index:"4"}},[t("a",{attrs:{href:"#",target:"_blank"}},[e._v("后台管理DEMO")])])],1)],1),t("el-container",[t("el-aside",{attrs:{width:"200px"}},[t("el-menu",{staticClass:"el-menu-vertical-demo",attrs:{"default-active":"2","background-color":"#545c64","text-color":"#fff","active-text-color":"#ffd04b"}},[t("el-menu-item",{attrs:{index:"index"},on:{click:function(t){return e.addTab({title:"首页",name:"index"})}}},[t("template",{slot:"title"},[t("i",{staticClass:"el-icon-s-home"}),t("span",[e._v("首页")])])],2),e._l(e.menu_list,(function(a){return t("el-submenu",{key:a.name,attrs:{index:a.name}},[t("template",{slot:"title"},[t("i",{staticClass:"el-icon-location"}),t("span",[e._v(e._s(a.name))])]),e._l(a.children,(function(a){return t("router-link",{key:a.name,attrs:{to:a.path}},[t("el-menu-item",{attrs:{index:a.name},on:{click:function(t){return e.addTab(a)}}},[e._v(e._s(a.title))])],1)}))],2)}))],2)],1),t("el-main",{staticStyle:{padding:"0"}},[t("el-tabs",{attrs:{type:"card",closable:""},on:{"tab-remove":e.removeTab,"tab-click":e.page},model:{value:e.editableTabsValue,callback:function(t){e.editableTabsValue=t},expression:"editableTabsValue"}},e._l(e.editableTabs,(function(e,a){return t("el-tab-pane",{key:e.name,attrs:{label:e.title,name:e.name}})})),1),t("div",[t("router-view")],1)],1)],1),t("el-drawer",{attrs:{title:"我是标题",visible:e.drawer,"with-header":!1},on:{"update:visible":function(t){e.drawer=t}}},[t("div",{attrs:{align:"center"}},[t("h1",[e._v("修改个人信息")]),t("el-upload",{staticClass:"avatar-uploader",attrs:{action:e.upurl,"show-file-list":!1,headers:e.header,"on-success":e.handleAvatarSuccess,"before-upload":e.beforeAvatarUpload}},[t("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:"点击更换头像",placement:"top-start"}},[e.imageUrl?t("img",{staticClass:"avatar",attrs:{src:e.imageUrl}}):t("i",{staticClass:"el-icon-plus avatar-uploader-icon"})])],1),t("el-form",{ref:"ruleForm",staticClass:"demo-ruleForm",attrs:{model:e.ruleForm,"status-icon":"",rules:e.rules,"label-width":"100px"}},[t("el-form-item",{attrs:{label:"旧密码",prop:"oldpass"}},[t("el-input",{attrs:{type:"password",autocomplete:"off"},model:{value:e.ruleForm.oldpass,callback:function(t){e.$set(e.ruleForm,"oldpass",t)},expression:"ruleForm.oldpass"}})],1),t("el-form-item",{attrs:{label:"新密码",prop:"pass"}},[t("el-input",{attrs:{type:"password",autocomplete:"off"},model:{value:e.ruleForm.pass,callback:function(t){e.$set(e.ruleForm,"pass",t)},expression:"ruleForm.pass"}})],1),t("el-form-item",{attrs:{label:"确认密码",prop:"checkPass"}},[t("el-input",{attrs:{type:"password",autocomplete:"off"},model:{value:e.ruleForm.checkPass,callback:function(t){e.$set(e.ruleForm,"checkPass",t)},expression:"ruleForm.checkPass"}})],1),t("el-form-item",[t("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.submitForm("ruleForm")}}},[e._v("提交")]),t("el-button",{on:{click:function(t){return e.resetForm("ruleForm")}}},[e._v("重置")])],1)],1)],1)])],1)},h=[],m={name:"HomeView",components:{},data(){var e=(e,t,a)=>{""===t?a(new Error("请输入密码")):t.length<3?a(new Error("密码过短!!")):(""!==this.ruleForm.checkPass&&this.$refs.ruleForm.validateField("checkPass"),a())},t=(e,t,a)=>{""===t?a(new Error("请输入旧密码")):(""!==this.ruleForm.checkPass&&this.$refs.ruleForm.validateField("pass"),a())},a=(e,t,a)=>{""===t?a(new Error("请再次输入密码")):t!==this.ruleForm.pass?a(new Error("两次输入密码不一致!")):a()};return{ruleForm:{oldpass:"",pass:"",checkPass:""},rules:{oldpass:[{validator:t,trigger:"blur"}],pass:[{validator:e,trigger:"blur"}],checkPass:[{validator:a,trigger:"blur"}]},header:"",upurl:"",imageUrl:"",drawer:!1,userinfo:{name:"lzj",avatar:""},editableTabsValue:"index",editableTabs:[{title:"首页",name:"index"},{title:"用户管理",name:"user"},{title:"角色管理",name:"role"}],tabIndex:1}},methods:{submitForm(e){this.$refs[e].validate((e=>{if(!e)return this.$message.error("失败"),!1;this.$axios.post(this.$settings.BASE_URL+"/user/userinfo/userinfo/",this.ruleForm,{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{100===e.data.code?this.$message({showClose:!0,message:"修改成功",type:"success",onClose:()=>{this.$router.push("/login"),this.$cookies.remove("token"),this.$cookies.remove("userinfo")}}):this.$message.warning(e.data.msg)}))}))},resetForm(e){this.$refs[e].resetFields()},handleAvatarSuccess(e,t){this.imageUrl=e.avatar;let a=this.$cookies.get("userinfo");a.avatar=this.imageUrl,this.userinfo=a,this.$cookies.remove("userinfo"),this.$cookies.set("userinfo",a)},beforeAvatarUpload(e){const t="image/jpeg"===e.type,a=e.size/1024/1024<2;return t||this.$message.error("上传头像图片只能是 JPG 格式!"),a||this.$message.error("上传头像图片大小不能超过 2MB!"),t&&a},page(e){this.editableTabsValue=e.name,this.$router.push({name:e.name})},logout(){this.$cookies.remove("token"),this.$cookies.remove("userinfo"),this.$store.state.menu_list=[],this.$store.state.has_router=!1,this.$router.push("/login")},addTab(e){let t=this.editableTabs.findIndex((t=>t.name===e.name));-1===t&&this.editableTabs.push({title:e.title,name:e.name}),this.editableTabsValue=e.name,e.path?this.$router.push(e.path):this.$router.push({name:e.name})},removeTab(e){let t=this.editableTabs,a=this.editableTabsValue;a===e&&t.forEach(((r,s)=>{if(r.name===e){let e=t[s+1]||t[s-1];e&&(a=e.name)}})),this.editableTabsValue=a,this.$router.push({name:this.editableTabsValue}),this.editableTabs=t.filter((t=>t.name!==e))}},created(){this.userinfo=this.$cookies.get("userinfo"),this.imageUrl=this.userinfo.avatar,this.upurl=this.$settings.BASE_URL+"/user/userinfo/avatar/",this.header={Authorization:this.$cookies.get("token")}},computed:{menu_list:{get(){return this.$store.state.menu_list}}}},p=m,f=(0,o.Z)(p,c,h,!1,null,null,null),g=f.exports,b=a(5269),v=a.n(b),_=function(){var e=this,t=e._self._c;return t("el-container",[t("el-header",{staticStyle:{"background-color":"rgb(48, 65, 86)",color:"aliceblue"}},[t("strong",{staticStyle:{float:"left",size:"1000px","font-size":"25px"}},[e._v("后台管理系统")]),t("div",{staticClass:"header-avatar"},[t("el-avatar",{attrs:{size:"medium",src:"https://tva1.sinaimg.cn/large/00831rSTly1gd1u0jw182j30u00u043b.jpg"}}),t("el-dropdown",{staticStyle:{color:"aliceblue"}},[t("span",{staticClass:"el-dropdown-link"},[e._v(" "+e._s(e.userInfo.username)),t("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),t("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[t("el-dropdown-item",[t("router-link",{attrs:{to:{name:"UserCenter"}}},[e._v("个人中心")])],1),t("el-dropdown-item",{nativeOn:{click:function(t){return e.handleLogout.apply(null,arguments)}}},[e._v("退出")])],1)],1),t("el-link",{staticStyle:{color:"aliceblue"},attrs:{href:"http://www.liuqingzheng.top",target:"_blank"}},[e._v("个人网站")])],1)]),t("el-container",[t("el-aside",{attrs:{width:"200px"}}),t("el-main",[t("MenuTest"),t("div",{staticStyle:{margin:"0 15px"}},[t("router-view")],1)],1)],1)],1)},k=[],y=a(4934),x={name:"Home",components:{MenuTest:y["default"]},data(){return{userInfo:{id:"",username:"刘清政",avatar:""},dialogFormVisible:!1,form:{name:"",region:"",date1:"",date2:"",delivery:!1,type:[],resource:"",desc:""},formLabelWidth:"120px"}},created(){this.getUserInfo()},methods:{getUserInfo(){},handleLogout(){localStorage.clear(),sessionStorage.clear(),this.$store.commit("resetState"),this.$router.push("/login")}}},w=x,$=(0,o.Z)(w,_,k,!1,null,"d17dae10",null),F=($.exports,a(7945)),S=a(4239),A=a(4161),C=a(6787);a(2173);r["default"].use(d.ZP);const E=[{path:"/",name:"home",component:g,children:[{path:"/index",name:"index",component:F["default"]}]},{path:"/login",name:"login",component:()=>a.e(443).then(a.bind(a,7832))}],T=new d.ZP({mode:"history",base:"/",routes:E});T.beforeEach(((e,t,a)=>{let r=S.Z.state.has_router,s=v().get("token");"/login"===e.path||"/test"===e.path?a():s?s&&!r&&A.Z.get(C.Z.BASE_URL+"/permission/menu/",{headers:{Authorization:v().get("token")}}).then((e=>{S.Z.commit("setMenuList",e.data.data),S.Z.commit("setPermissionList",e.data.permission);let t=T.options.routes;e.data.data.forEach((e=>{e.children&&e.children.forEach((e=>{let a=U(e);t[0].children.push(a)}))})),T.addRoutes(t),S.Z.state.has_router=!0})):a({path:"/login"}),a()}));const U=e=>{let t={path:e.path,name:e.name,component:()=>a(3457)("./"+e.component+".vue")};return t};var j=T,L=a(8499),P=a.n(L);const O={methods:{hasAuth(e){var t=this.$store.state.permission_list;return t.indexOf(e)>-1}}};r["default"].config.productionTip=!1,r["default"].prototype.$settings=C.Z,r["default"].prototype.$cookies=v(),r["default"].prototype.$axios=A.Z,r["default"].use(P()),r["default"].mixin(O),new r["default"]({router:j,store:S.Z,render:e=>e(u)}).$mount("#app")},4239:function(e,t,a){"use strict";var r=a(6369),s=a(3822);r["default"].use(s.ZP),t["Z"]=new s.ZP.Store({state:{has_router:!1,menu_list:[],bro_all:[],permission_list:[]},getters:{},mutations:{setMenuList(e,t){e.menu_list=t,e.has_router=!0},setBro(e,t){e.bro_all=t},setPermissionList(e,t){e.permission_list=t}},actions:{},modules:{}})},3457:function(e,t,a){var r={"./DeptView.vue":[9464,464],"./IndexView.vue":[7945],"./JobView.vue":[8469,469],"./MenuTest.vue":[4934],"./MenutView.vue":[7109,109],"./RoleView.vue":[5264,264],"./UserView.vue":[2173]};function s(e){if(!a.o(r,e))return Promise.resolve().then((function(){var t=new Error("Cannot find module '"+e+"'");throw t.code="MODULE_NOT_FOUND",t}));var t=r[e],s=t[0];return Promise.all(t.slice(1).map(a.e)).then((function(){return a(s)}))}s.keys=function(){return Object.keys(r)},s.id=3457,e.exports=s}},t={};function a(r){var s=t[r];if(void 0!==s)return s.exports;var i=t[r]={id:r,loaded:!1,exports:{}};return e[r](i,i.exports,a),i.loaded=!0,i.exports}a.m=e,function(){a.amdO={}}(),function(){var e=[];a.O=function(t,r,s,i){if(!r){var o=1/0;for(d=0;d<e.length;d++){r=e[d][0],s=e[d][1],i=e[d][2];for(var n=!0,l=0;l<r.length;l++)(!1&i||o>=i)&&Object.keys(a.O).every((function(e){return a.O[e](r[l])}))?r.splice(l--,1):(n=!1,i<o&&(o=i));if(n){e.splice(d--,1);var u=s();void 0!==u&&(t=u)}}return t}i=i||0;for(var d=e.length;d>0&&e[d-1][2]>i;d--)e[d]=e[d-1];e[d]=[r,s,i]}}(),function(){a.n=function(e){var t=e&&e.__esModule?function(){return e["default"]}:function(){return e};return a.d(t,{a:t}),t}}(),function(){a.d=function(e,t){for(var r in t)a.o(t,r)&&!a.o(e,r)&&Object.defineProperty(e,r,{enumerable:!0,get:t[r]})}}(),function(){a.f={},a.e=function(e){return Promise.all(Object.keys(a.f).reduce((function(t,r){return a.f[r](e,t),t}),[]))}}(),function(){a.u=function(e){return"js/"+(443===e?"about":e)+"."+{109:"51cec738",264:"df7727d5",443:"8edb28c3",464:"40423c68",469:"b260e613"}[e]+".js"}}(),function(){a.miniCssF=function(e){return"css/about.c4a152b1.css"}}(),function(){a.g=function(){if("object"===typeof globalThis)return globalThis;try{return this||new Function("return this")()}catch(e){if("object"===typeof window)return window}}()}(),function(){a.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)}}(),function(){var e={},t="rbac_demo_front:";a.l=function(r,s,i,o){if(e[r])e[r].push(s);else{var n,l;if(void 0!==i)for(var u=document.getElementsByTagName("script"),d=0;d<u.length;d++){var c=u[d];if(c.getAttribute("src")==r||c.getAttribute("data-webpack")==t+i){n=c;break}}n||(l=!0,n=document.createElement("script"),n.charset="utf-8",n.timeout=120,a.nc&&n.setAttribute("nonce",a.nc),n.setAttribute("data-webpack",t+i),n.src=r),e[r]=[s];var h=function(t,a){n.onerror=n.onload=null,clearTimeout(m);var s=e[r];if(delete e[r],n.parentNode&&n.parentNode.removeChild(n),s&&s.forEach((function(e){return e(a)})),t)return t(a)},m=setTimeout(h.bind(null,void 0,{type:"timeout",target:n}),12e4);n.onerror=h.bind(null,n.onerror),n.onload=h.bind(null,n.onload),l&&document.head.appendChild(n)}}}(),function(){a.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})}}(),function(){a.nmd=function(e){return e.paths=[],e.children||(e.children=[]),e}}(),function(){a.p="/"}(),function(){if("undefined"!==typeof document){var e=function(e,t,a,r,s){var i=document.createElement("link");i.rel="stylesheet",i.type="text/css";var o=function(a){if(i.onerror=i.onload=null,"load"===a.type)r();else{var o=a&&("load"===a.type?"missing":a.type),n=a&&a.target&&a.target.href||t,l=new Error("Loading CSS chunk "+e+" failed.\n("+n+")");l.code="CSS_CHUNK_LOAD_FAILED",l.type=o,l.request=n,i.parentNode&&i.parentNode.removeChild(i),s(l)}};return i.onerror=i.onload=o,i.href=t,a?a.parentNode.insertBefore(i,a.nextSibling):document.head.appendChild(i),i},t=function(e,t){for(var a=document.getElementsByTagName("link"),r=0;r<a.length;r++){var s=a[r],i=s.getAttribute("data-href")||s.getAttribute("href");if("stylesheet"===s.rel&&(i===e||i===t))return s}var o=document.getElementsByTagName("style");for(r=0;r<o.length;r++){s=o[r],i=s.getAttribute("data-href");if(i===e||i===t)return s}},r=function(r){return new Promise((function(s,i){var o=a.miniCssF(r),n=a.p+o;if(t(o,n))return s();e(r,n,null,s,i)}))},s={143:0};a.f.miniCss=function(e,t){var a={443:1};s[e]?t.push(s[e]):0!==s[e]&&a[e]&&t.push(s[e]=r(e).then((function(){s[e]=0}),(function(t){throw delete s[e],t})))}}}(),function(){var e={143:0};a.f.j=function(t,r){var s=a.o(e,t)?e[t]:void 0;if(0!==s)if(s)r.push(s[2]);else{var i=new Promise((function(a,r){s=e[t]=[a,r]}));r.push(s[2]=i);var o=a.p+a.u(t),n=new Error,l=function(r){if(a.o(e,t)&&(s=e[t],0!==s&&(e[t]=void 0),s)){var i=r&&("load"===r.type?"missing":r.type),o=r&&r.target&&r.target.src;n.message="Loading chunk "+t+" failed.\n("+i+": "+o+")",n.name="ChunkLoadError",n.type=i,n.request=o,s[1](n)}};a.l(o,l,"chunk-"+t,t)}},a.O.j=function(t){return 0===e[t]};var t=function(t,r){var s,i,o=r[0],n=r[1],l=r[2],u=0;if(o.some((function(t){return 0!==e[t]}))){for(s in n)a.o(n,s)&&(a.m[s]=n[s]);if(l)var d=l(a)}for(t&&t(r);u<o.length;u++)i=o[u],a.o(e,i)&&e[i]&&e[i][0](),e[i]=0;return a.O(d)},r=self["webpackChunkrbac_demo_front"]=self["webpackChunkrbac_demo_front"]||[];r.forEach(t.bind(null,0)),r.push=t.bind(null,r.push.bind(r))}();var r=a.O(void 0,[998],(function(){return a(7952)}));r=a.O(r)})();
//# sourceMappingURL=app.2684652c.js.map