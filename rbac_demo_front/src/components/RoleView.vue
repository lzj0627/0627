<template>
  <div>
    <div>
      <el-button type="primary" v-if="hasAuth('role:add')" @click="dialogVisible = true">新增角色</el-button>
      <el-button type="danger" v-if="hasAuth('role:del')" @click="delRole(null)">批量删除</el-button>
    </div>
    <el-table
        :data="tableData"
        border
        style="width: 100%;margin-top:15px"
        @selection-change="handleSelectionChange">
      <el-table-column
          type="selection"
          width="55">
      </el-table-column>
      <el-table-column
          prop="name"
          label="名称"
          width="180">
      </el-table-column>
      <el-table-column
          prop="msg"
          label="描述"
          width="180">
      </el-table-column>
      <el-table-column
          prop="status"
          label="状态">
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status" type="success">正常</el-tag>
          <el-tag size="small" v-else type="danger">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column
          prop="create_time"
          label="创建时间">
      </el-table-column>
      <el-table-column
          prop="mod"
          label="操作">
        <template slot-scope="scope">
          <el-button type="primary" icon="el-icon-edit" circle v-if="hasAuth('role:mod')"  @click="modRole(scope.row.id)"></el-button>
          <el-button type="danger" icon="el-icon-delete" circle v-if="hasAuth('role:del')" @click="delRole(scope.row.id)"></el-button>

        </template>
      </el-table-column>
    </el-table>


    <el-dialog
        :title="title"
        :visible.sync="dialogVisible"
        width="30%"
        :before-close="handleClose">
      <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="角色名" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="角色介绍" prop="msg">
          <el-input v-model="ruleForm.msg"></el-input>
        </el-form-item>
        <el-form-item label="部门" prop="dept">
          <treeselect
              style="width: 170px"
              placeholder="选择部门"
              :multiple="true"
              :flat="true"
              v-model="ruleForm.depts"
              :options="depts"
          />
        </el-form-item>
        <el-form-item label="菜单权限" prop="menu">
          <el-tree
              :data="permTreeData"
              show-checkbox
              ref="permTree"
              :default-expand-all=true
              node-key="id"
              :check-strictly=true
              @check="subRoleTreeCheck"
              :props="defaultProps">
          </el-tree>
        </el-form-item>
        <el-form-item label="是否启用" prop="status">
          <el-switch v-model="ruleForm.status"></el-switch>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="handleClose">取 消</el-button>
        <el-button type="primary" @click="addRole">确 定</el-button>
      </span>
    </el-dialog>
  </div>

</template>

<script>
import Treeselect from "@riophae/vue-treeselect";
import '@riophae/vue-treeselect/dist/vue-treeselect.css'

export default {
  name: "RoleView",
  data() {
    return {
      title:'新增',
      permTreeData: [],
      defaultProps: {
        children: 'children',
        label: 'label'
      },
      depts: [],
      tableData: [],
      multipleSelection: [],
      dialogVisible: false,
      ruleForm: {
        name: '',
        msg: '',
        depts: null,
        menus: [],
        status: true
      },
      rules: {
        name: [
          {required: true, message: '请输入角色名', trigger: 'blur'},
          {min: 3, max: 5, message: '长度在 2 到 6 个字符', trigger: 'blur'}
        ],
      }
    }
  },
  methods: {
    modRole(id) {
      this.$axios.get(this.$settings.BASE_URL + '/permission/role/' + id + '/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.ruleForm = res.data.data
        this.title = '修改'
        this.dialogVisible = true
      })
      setTimeout(() => {
        this.$refs.permTree.setCheckedKeys(this.ruleForm.menus)
      }, 100)

    },
    subRoleTreeCheck(keys, leafOnly) {
      //获取所有选中的节点id
      this.ruleForm.menus = this.$refs.permTree.getCheckedKeys().concat(this.$refs.permTree.getHalfCheckedKeys())
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
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    getRole() {
      this.$axios.get(this.$settings.BASE_URL + '/permission/role/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.tableData = res.data.data.results
      })
    },
    delRole(id) {
      let ids = []
      if (id) {
        ids.push(id)
      } else {
        this.multipleSelection.forEach(row => {
          ids.push(row.id)
        })
      }
      this.$axios.post(this.$settings.BASE_URL + '/permission/role/del_roles/', {ids: ids}, {headers: {Authorization: this.$cookies.get('token'), Auth:'role:del'}}).then(res => {
        this.$message({
          showClose: true,
          message: '删除成功',
          type: 'success',
          onClose: () => {
            this.getRole()
          }
        })
      })
    },
    addRole() {
      let axios_type = this.$axios.post
      if (this.ruleForm.id) {
        axios_type = this.$axios.put
      }
      axios_type(this.$settings.BASE_URL + '/permission/role/' + (this.ruleForm.id ? this.ruleForm.id + '/' : ''), this.ruleForm, {headers: {Authorization: this.$cookies.get('token'),Auth:(this.ruleForm.id ? 'role:mod' : 'role:add')}}).then(res => {
        if (res.data.code === 100) {
          this.$message({
            showClose: true,
            message: '操作成功',
            type: 'success',
            onClose: () => {
              this.getRole()
              this.dialogVisible = false
              this.ruleForm = {
                name: '',
                msg: '',
                depts: null,
                menus: [],
                status: true
              }
              this.$refs.permTree.setCheckedKeys(this.ruleForm.menus)
            }
          })
        }
      })
    }
  },
  created() {
    this.getRole()
    this.$axios.get(this.$settings.BASE_URL + '/permission/dept/all_dept/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
      this.depts = res.data.data.results
    })
    this.$axios.get(this.$settings.BASE_URL + '/permission/menu/all_menu/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
      this.permTreeData = res.data.data
    })
  },
  components: {
    Treeselect
  }
}
</script>

<style scoped>

</style>