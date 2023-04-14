<template>
  <div>
    <div>
      <el-button type="primary" @click="dialogVisible=true" v-if="hasAuth('menu:add')">新增</el-button>
    </div>
    <el-table
        :data="tableData"
        style="width: 100%;margin-top: 20px;"
        row-key="id"
        border
        :tree-props="{children: 'children', hasChildren: 'hasChildren'}">
      <el-table-column
          prop="title"
          label="标题"
          width="180">
      </el-table-column>
      <el-table-column
          prop="name"
          label="别名"
          width="180">
      </el-table-column>
      <el-table-column
          prop="permission"
          label="权限编码"
          width="180">
      </el-table-column>
      <el-table-column
          prop="path"
          label="路由"
          width="180">
      </el-table-column>
      <el-table-column
          prop="type"
          label="类型"
          width="180">
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.type === 0">目录</el-tag>
          <el-tag size="small" v-else-if="scope.row.type === 1" type="success">菜单</el-tag>
          <el-tag size="small" v-else-if="scope.row.type === 2" type="info">按钮</el-tag>
        </template>
      </el-table-column>
      <el-table-column
          prop="component"
          label="组件名"
          width="180">
      </el-table-column>
      <el-table-column
          prop="status"
          label="状态"
          width="180">
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status" type="success">正常</el-tag>
          <el-tag size="small" v-else type="danger">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column
          prop=""
          label="操作">
        <template slot-scope="scope">
          <el-button type="primary" icon="el-icon-edit" circle v-if="hasAuth('menu:mod')" @click="modMenu(scope.row.id)"></el-button>
          <el-button type="danger" icon="el-icon-delete" circle v-if="hasAuth('menu:del')" @click="delMenu(scope.row.id)"></el-button>

        </template>
      </el-table-column>
    </el-table>

    <el-dialog
        :title="title"
        :visible.sync="dialogVisible"
        width="30%"
        :before-close="handleClose">
      <el-form :model="ruleForm" status-icon ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="类型" prop="type">
          <el-radio v-model="ruleForm.type" :label="0" border @input="result(ruleForm.type)">目录</el-radio>
          <el-radio v-model="ruleForm.type" :label="1" border @input="result(ruleForm.type)">菜单</el-radio>
          <el-radio v-model="ruleForm.type" :label="2" border @input="result(ruleForm.type)">按钮</el-radio>
        </el-form-item>
        <el-form-item label="上级菜单" prop="dept">
          <treeselect
              placeholder="选择上级菜单"
              :flat="true"
              v-model="ruleForm.p_menu"
              :options="menus"
              @input="showMenu"
          />
        </el-form-item>
        <el-form-item label="标题" prop="title">
          <el-input v-model="ruleForm.title"></el-input>
        </el-form-item>
        <el-form-item label="别名" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="路由" prop="path" v-if="ruleForm.type==1">
          <el-input v-model="ruleForm.path"></el-input>
        </el-form-item>
        <el-form-item label="组件名" prop="component" v-if="ruleForm.type==1">
          <el-input v-model="ruleForm.component"></el-input>
        </el-form-item>
        <el-form-item label="权限编码" prop="permission" v-if="ruleForm.type==2">
          <el-input v-model="ruleForm.permission"></el-input>
        </el-form-item>
        <el-form-item label="是否启用" prop="status">
          <el-switch v-model="ruleForm.status"></el-switch>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="handleClose">取 消</el-button>
        <el-button type="primary" @click="showTest">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import Treeselect from "@riophae/vue-treeselect";
import '@riophae/vue-treeselect/dist/vue-treeselect.css'

export default {
  name: "MenutView",
  data() {
    return {
      title: '新增',
      tableData: [],
      dialogVisible: false,
      radio1: 0,
      menus: [],
      ruleForm: {
        p_menu: null,
        type: '0',
        title: '',
        name: '',
        status: true,
        path: '',
        component: null,
        permission: ''
      }
    }
  },
  methods: {
    modMenu(id){
      this.$axios.get(this.$settings.BASE_URL + '/permission/menu/' + id + '/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.ruleForm = res.data.data
        this.dialogVisible = true
      })
    },
    delMenu(id){
      this.$axios.delete(this.$settings.BASE_URL + '/permission/menu/' + id + '/', {headers: {Authorization: this.$cookies.get('token'), Auth: 'menu:del'}}).then(res => {
        this.$message({
          showClose: true,
          message: '删除成功',
          type: 'success',
          onClose: () => {
            this.getMenu()
            this.getAllMenu()
          }
        })
      })
    },
    result(type) {
      this.ruleForm = {
        p_menu: null,
        type: type,
        title: '',
        name: '',
        status: true,
        path: '',
        component: null,
        permission: ''
      }
      console.log(this.ruleForm)
    },
    showMenu() {
      if (!this.ruleForm.p_menu) {
        this.ruleForm.p_menu = null
      }
    },
    showTest() {
      let axios_type = this.$axios.post
      if (this.ruleForm.id) {
        axios_type = this.$axios.put
      }
      axios_type(this.$settings.BASE_URL + '/permission/menu/' + (this.ruleForm.id?this.ruleForm.id +'/':''), this.ruleForm, {headers: {Authorization: this.$cookies.get('token'), Auth: (this.ruleForm.id?'menu:mod':'menu:add')}}).then(res => {
        this.$message({
          showClose: true,
          message: '操作成功',
          type: 'success',
          onClose: () => {
            this.getMenu()
            this.getAllMenu()
            this.dialogVisible = false
            this.result(0)
          }
        })
      })
    },
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(_ => {
            this.dialogVisible = false
            // done();
            this.ruleForm = {
              name: '',
              msg: '',
              depts: null,
              menus: [],
              status: true
            }
            this.$refs.permTree.setCheckedKeys(this.ruleForm.menus)
          })
          .catch(_ => {
          });
    },
    getMenu() {
      this.$axios.get(this.$settings.BASE_URL + '/permission/menu/all/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.tableData = res.data.data
      })
    },
    getAllMenu(){
      this.$axios.get(this.$settings.BASE_URL + '/permission/menu/all_menu/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
      this.menus = res.data.data
    })
    }
  },
  created() {
    this.getMenu()
    this.getAllMenu()
  },
  components: {
    Treeselect
  }
}
</script>

<style scoped>

</style>