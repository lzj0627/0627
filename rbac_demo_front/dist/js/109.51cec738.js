"use strict";(self["webpackChunkrbac_demo_front"]=self["webpackChunkrbac_demo_front"]||[]).push([[109],{7109:function(e,t,l){l.r(t),l.d(t,{default:function(){return p}});var o=function(){var e=this,t=e._self._c;return t("div",[t("div",[e.hasAuth("menu:add")?t("el-button",{attrs:{type:"primary"},on:{click:function(t){e.dialogVisible=!0}}},[e._v("新增")]):e._e()],1),t("el-table",{staticStyle:{width:"100%","margin-top":"20px"},attrs:{data:e.tableData,"row-key":"id",border:"","tree-props":{children:"children",hasChildren:"hasChildren"}}},[t("el-table-column",{attrs:{prop:"title",label:"标题",width:"180"}}),t("el-table-column",{attrs:{prop:"name",label:"别名",width:"180"}}),t("el-table-column",{attrs:{prop:"permission",label:"权限编码",width:"180"}}),t("el-table-column",{attrs:{prop:"path",label:"路由",width:"180"}}),t("el-table-column",{attrs:{prop:"type",label:"类型",width:"180"},scopedSlots:e._u([{key:"default",fn:function(l){return[0===l.row.type?t("el-tag",{attrs:{size:"small"}},[e._v("目录")]):1===l.row.type?t("el-tag",{attrs:{size:"small",type:"success"}},[e._v("菜单")]):2===l.row.type?t("el-tag",{attrs:{size:"small",type:"info"}},[e._v("按钮")]):e._e()]}}])}),t("el-table-column",{attrs:{prop:"component",label:"组件名",width:"180"}}),t("el-table-column",{attrs:{prop:"status",label:"状态",width:"180"},scopedSlots:e._u([{key:"default",fn:function(l){return[l.row.status?t("el-tag",{attrs:{size:"small",type:"success"}},[e._v("正常")]):t("el-tag",{attrs:{size:"small",type:"danger"}},[e._v("禁用")])]}}])}),t("el-table-column",{attrs:{prop:"",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(l){return[e.hasAuth("menu:mod")?t("el-button",{attrs:{type:"primary",icon:"el-icon-edit",circle:""},on:{click:function(t){return e.modMenu(l.row.id)}}}):e._e(),e.hasAuth("menu:del")?t("el-button",{attrs:{type:"danger",icon:"el-icon-delete",circle:""},on:{click:function(t){return e.delMenu(l.row.id)}}}):e._e()]}}])})],1),t("el-dialog",{attrs:{title:e.title,visible:e.dialogVisible,width:"30%","before-close":e.handleClose},on:{"update:visible":function(t){e.dialogVisible=t}}},[t("el-form",{ref:"ruleForm",staticClass:"demo-ruleForm",attrs:{model:e.ruleForm,"status-icon":"","label-width":"100px"}},[t("el-form-item",{attrs:{label:"类型",prop:"type"}},[t("el-radio",{attrs:{label:0,border:""},on:{input:function(t){return e.result(e.ruleForm.type)}},model:{value:e.ruleForm.type,callback:function(t){e.$set(e.ruleForm,"type",t)},expression:"ruleForm.type"}},[e._v("目录")]),t("el-radio",{attrs:{label:1,border:""},on:{input:function(t){return e.result(e.ruleForm.type)}},model:{value:e.ruleForm.type,callback:function(t){e.$set(e.ruleForm,"type",t)},expression:"ruleForm.type"}},[e._v("菜单")]),t("el-radio",{attrs:{label:2,border:""},on:{input:function(t){return e.result(e.ruleForm.type)}},model:{value:e.ruleForm.type,callback:function(t){e.$set(e.ruleForm,"type",t)},expression:"ruleForm.type"}},[e._v("按钮")])],1),t("el-form-item",{attrs:{label:"上级菜单",prop:"dept"}},[t("treeselect",{attrs:{placeholder:"选择上级菜单",flat:!0,options:e.menus},on:{input:e.showMenu},model:{value:e.ruleForm.p_menu,callback:function(t){e.$set(e.ruleForm,"p_menu",t)},expression:"ruleForm.p_menu"}})],1),t("el-form-item",{attrs:{label:"标题",prop:"title"}},[t("el-input",{model:{value:e.ruleForm.title,callback:function(t){e.$set(e.ruleForm,"title",t)},expression:"ruleForm.title"}})],1),t("el-form-item",{attrs:{label:"别名",prop:"name"}},[t("el-input",{model:{value:e.ruleForm.name,callback:function(t){e.$set(e.ruleForm,"name",t)},expression:"ruleForm.name"}})],1),1==e.ruleForm.type?t("el-form-item",{attrs:{label:"路由",prop:"path"}},[t("el-input",{model:{value:e.ruleForm.path,callback:function(t){e.$set(e.ruleForm,"path",t)},expression:"ruleForm.path"}})],1):e._e(),1==e.ruleForm.type?t("el-form-item",{attrs:{label:"组件名",prop:"component"}},[t("el-input",{model:{value:e.ruleForm.component,callback:function(t){e.$set(e.ruleForm,"component",t)},expression:"ruleForm.component"}})],1):e._e(),2==e.ruleForm.type?t("el-form-item",{attrs:{label:"权限编码",prop:"permission"}},[t("el-input",{model:{value:e.ruleForm.permission,callback:function(t){e.$set(e.ruleForm,"permission",t)},expression:"ruleForm.permission"}})],1):e._e(),t("el-form-item",{attrs:{label:"是否启用",prop:"status"}},[t("el-switch",{model:{value:e.ruleForm.status,callback:function(t){e.$set(e.ruleForm,"status",t)},expression:"ruleForm.status"}})],1)],1),t("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[t("el-button",{on:{click:e.handleClose}},[e._v("取 消")]),t("el-button",{attrs:{type:"primary"},on:{click:e.showTest}},[e._v("确 定")])],1)],1)],1)},s=[],r=l(7859),i=l.n(r),n={name:"MenutView",data(){return{title:"新增",tableData:[],dialogVisible:!1,radio1:0,menus:[],ruleForm:{p_menu:null,type:"0",title:"",name:"",status:!0,path:"",component:null,permission:""}}},methods:{modMenu(e){this.$axios.get(this.$settings.BASE_URL+"/permission/menu/"+e+"/",{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.ruleForm=e.data.data,this.dialogVisible=!0}))},delMenu(e){this.$axios.delete(this.$settings.BASE_URL+"/permission/menu/"+e+"/",{headers:{Authorization:this.$cookies.get("token"),Auth:"menu:del"}}).then((e=>{this.$message({showClose:!0,message:"删除成功",type:"success",onClose:()=>{this.getMenu(),this.getAllMenu()}})}))},result(e){this.ruleForm={p_menu:null,type:e,title:"",name:"",status:!0,path:"",component:null,permission:""},console.log(this.ruleForm)},showMenu(){this.ruleForm.p_menu||(this.ruleForm.p_menu=null)},showTest(){let e=this.$axios.post;this.ruleForm.id&&(e=this.$axios.put),e(this.$settings.BASE_URL+"/permission/menu/"+(this.ruleForm.id?this.ruleForm.id+"/":""),this.ruleForm,{headers:{Authorization:this.$cookies.get("token"),Auth:this.ruleForm.id?"menu:mod":"menu:add"}}).then((e=>{this.$message({showClose:!0,message:"操作成功",type:"success",onClose:()=>{this.getMenu(),this.getAllMenu(),this.dialogVisible=!1,this.result(0)}})}))},handleClose(e){this.$confirm("确认关闭？").then((e=>{this.dialogVisible=!1,this.ruleForm={name:"",msg:"",depts:null,menus:[],status:!0},this.$refs.permTree.setCheckedKeys(this.ruleForm.menus)})).catch((e=>{}))},getMenu(){this.$axios.get(this.$settings.BASE_URL+"/permission/menu/all/",{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.tableData=e.data.data}))},getAllMenu(){this.$axios.get(this.$settings.BASE_URL+"/permission/menu/all_menu/",{headers:{Authorization:this.$cookies.get("token")}}).then((e=>{this.menus=e.data.data}))}},created(){this.getMenu(),this.getAllMenu()},components:{Treeselect:i()}},a=n,u=l(1001),m=(0,u.Z)(a,o,s,!1,null,"57d1a102",null),p=m.exports}}]);
//# sourceMappingURL=109.51cec738.js.map