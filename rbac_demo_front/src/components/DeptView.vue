<template>

  <div>
    <div>
      <el-button type="primary" v-if="hasAuth('dept:add')" @click="dialogVisible = true">新增部门</el-button>
<!--      <el-button type="danger" v-if="hasAuth('dept:del')">批量删除</el-button>-->
    </div>
    <el-table
        :data="tableData"
        style="width: 100%;margin-top: 20px;"
        row-key="id"
        border
        default-expand-all
        :tree-props="{children: 'child', hasChildren: 'hasChildren'}"
        @selection-change="handleSelectionChange">
      <el-table-column
          type="selection"
          width="55">
      </el-table-column>
      <el-table-column
          prop="name"
          label="部门名"
          width="180">
      </el-table-column>
      <el-table-column
          prop="p_dept_name"
          label="父部门"
          width="180">
      </el-table-column>
      <el-table-column
          prop="user_count"
          label="员工数"
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
          <el-button type="primary" icon="el-icon-edit" circle v-if="hasAuth('dept:mod')" @click="editDept(scope.row.id)"></el-button>
          <el-button type="danger" icon="el-icon-delete" circle v-if="hasAuth('dept:del')" @click="delDept(scope.row.id)"></el-button>
        </template>
      </el-table-column>
    </el-table>


    <el-dialog
        :title="title"
        :visible.sync="dialogVisible"
        width="30%"
        :before-close="handleClose">
      <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="部门名" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="父部门" prop="dept">
          <treeselect
              style="width: 170px"
              placeholder="选择部门"
              :flat="true"
              v-model="ruleForm.p_dept"
              :options="depts"
              @input="showDept"
          />
        </el-form-item>
        <el-form-item label="是否启用" prop="status">
          <el-switch v-model="ruleForm.status"></el-switch>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="handleClose">取 消</el-button>
        <el-button type="primary" @click="addDept">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import Treeselect from "@riophae/vue-treeselect";
import '@riophae/vue-treeselect/dist/vue-treeselect.css'

export default {
  name: "DeptView",
  data() {
    return {
      title:'新增',
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
        p_dept: null,
        status: true
      },
      rules: {
        name: [
          {required: true, message: '请输入部门名', trigger: 'blur'},
          {min: 3, max: 5, message: '长度在 2 到 6 个字符', trigger: 'blur'}
        ],
      }
    }
  },
  methods: {
    showDept(){
      if (!this.ruleForm.p_dept){
        this.ruleForm.p_dept = null
      }
      console.log(this.ruleForm)
    },
    editDept(id){
      this.$axios.get(this.$settings.BASE_URL + '/permission/dept/' + id + '/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.ruleForm = res.data.data
        console.log(this.ruleForm)
        this.title = '修改'
        this.dialogVisible = true
      })
    },
    delDept(id){
      this.$axios.delete(this.$settings.BASE_URL + '/permission/dept/' + id + '/', {headers: {Authorization: this.$cookies.get('token'), Auth:'dept:del'}}).then(res => {
        this.$message({
          showClose: true,
          message: '删除成功',
          type: 'success',
          onClose: () => {
            this.getDept()
            this.getTreeDept()
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
              p_dept: null,
              status: true
            }
            this.title = '新增'
          })
          .catch(_ => {
          });
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
      console.log(this.multipleSelection)
    },
    getDept() {
      this.$axios.get(this.$settings.BASE_URL + '/permission/dept/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.tableData = res.data.data.results
      })
    },
    getTreeDept() {
      this.$axios.get(this.$settings.BASE_URL + '/permission/dept/all_dept/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.depts = res.data.data.results
      })
    },
    addDept() {
      console.log(this.ruleForm)
      let axios_type = this.$axios.post
      if (this.ruleForm.id) {
        axios_type = this.$axios.put
      }
      axios_type(this.$settings.BASE_URL + '/permission/dept/' + (this.ruleForm.id?this.ruleForm.id + '/':''), this.ruleForm, {headers: {Authorization: this.$cookies.get('token'), Auth:(this.ruleForm.id?'dept:mod':'dept:add')}}).then(res => {
        this.$message({
          showClose: true,
          message: '操作成功',
          type: 'success',
          onClose: () => {
            this.getDept()
            this.getTreeDept()
            this.dialogVisible = false
            this.ruleForm = {
              name: '',
              p_dept: null,
              status: true
            }
          }
        })
      })
    }
  },
  created() {
    this.getDept()
    this.getTreeDept()
  },
  components: {
    Treeselect
  }
}
</script>

<style scoped>

</style>