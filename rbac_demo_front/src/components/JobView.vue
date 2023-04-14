<template>
  <div>
    <div>
      <el-autocomplete
          v-model="state"
          :fetch-suggestions="querySearchAsync"
          placeholder="请输入搜索内容"
          :trigger-on-focus="false"
          @input="handInput"
      ></el-autocomplete>
      <el-button type="primary" @click="searchUser" style="margin-left: 10px">
        搜索
      </el-button>
      <el-button type="primary" v-if="hasAuth('job:add')" @click="dialogVisible = true">新增部门</el-button>
      <el-button type="danger" v-if="hasAuth('job:del')" @click="delJob(null)">批量删除</el-button>
    </div>
    <el-table
        :data="tableData"
        style="width: 100%;margin-top: 20px;"
        row-key="id"
        border
        v-loading="loading"
        @selection-change="handleSelectionChange">
      <el-table-column
          type="selection"
          width="55">
      </el-table-column>
      <el-table-column
          prop="name"
          label="岗位名"
          width="180">
      </el-table-column>
      <el-table-column
          prop="dept_name"
          label="所属部门"
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
          <el-button type="primary" icon="el-icon-edit" circle v-if="hasAuth('job:mod')"
                     @click="editJob(scope.row.id)"></el-button>
          <el-button type="danger" icon="el-icon-delete" circle v-if="hasAuth('job:del')"
                     @click="delJob(scope.row.id)"></el-button>
        </template>
      </el-table-column>
    </el-table>


    <el-dialog
        :title="title"
        :visible.sync="dialogVisible"
        width="30%"
        :before-close="handleClose">
      <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="岗位名" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="所属部门" prop="dept">
          <treeselect
              style="width: 170px"
              placeholder="选择所属部门"
              :flat="true"
              v-model="ruleForm.dept"
              :options="depts"
          />
        </el-form-item>
        <el-form-item label="是否启用" prop="status">
          <el-switch v-model="ruleForm.status"></el-switch>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button @click="handleClose">取 消</el-button>
        <el-button type="primary" @click="setJob">确 定</el-button>
      </span>
    </el-dialog>
    <el-pagination
        layout="prev, pager, next"
        :total="count"
        @next-click="nextPage"
        @current-change="getPage"
        @prev-click="prevPage"
        :page-size="5">
    </el-pagination>
  </div>
</template>

<script>
import Treeselect from "@riophae/vue-treeselect";
import '@riophae/vue-treeselect/dist/vue-treeselect.css'

export default {
  name: "JobView",
  data() {
    return {
      loading:false,
      prev_page:'',
      next_page:'',
      count:'',
      restaurants: [],
      state: '',
      timeout: null,
      depts: [],
      ruleForm: {
        name: '',
        dept: null,
        status: true
      },
      rules: {
        name: [
          {required: true, message: '请输入岗位名', trigger: 'blur'},
          {min: 2, max: 5, message: '长度在 2 到 6 个字符', trigger: 'blur'}
        ],
      },
      multipleSelection: [],
      dialogVisible: false,
      title: '新增',
      tableData: ''
    }
  },
  methods: {
    prevPage(){
      this.$axios.get(this.prev_page, {headers:{Authorization: this.$cookies.get('token')}}).then(res => {
        this.tableData = res.data.data.results
        this.next_page = res.data.data.next
      })
    },
    getPage(val){
      this.$axios.get(this.$settings.BASE_URL + '/permission/job/?page=' + val, {headers:{Authorization: this.$cookies.get('token')}}).then(res => {
        this.tableData = res.data.data.results
        this.next_page = res.data.data.next
        this.prev_page = res.data.data.previous
      })
    },
    nextPage(){
      this.$axios.get(this.next_page, {headers:{Authorization: this.$cookies.get('token')}}).then(res => {
        this.tableData = res.data.data.results
        this.prev_page = res.data.data.previous
      })
    },
    searchUser(){
      this.loading = true
      this.$axios.get(this.$settings.BASE_URL + '/permission/job/?search=' + this.state, {headers:{Authorization: this.$cookies.get('token')}}).then(res => {
        this.tableData = res.data.data.results
        this.count = res.data.data.count
        this.loading = false
      })
    },
    handInput() {
      this.loading=true
      if (this.state.length === 0) {
        setTimeout(()=>{
          this.loading=false
          this.getJob()
        }, 1000)

      } else {
        setTimeout(()=>{
          this.loading=false
          this.$axios.get(this.$settings.BASE_URL + '/permission/job/?search=' + this.state, {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
            this.tableData = res.data.data.results
            this.count = res.data.data.count
          })
        }, 1000)

      }
    },
    delJob(id) {
      let ids = []
      if (id) {
        ids.push(id)
      } else {
        this.multipleSelection.forEach(row => {
          ids.push(row.id)
        })
      }
      this.$axios.post(this.$settings.BASE_URL + '/permission/job/del_jobs/', {ids: ids}, {
        headers: {
          Authorization: this.$cookies.get('token'),
          Auth: 'job:del'
        }
      }).then(res => {
        this.$message({
          showClose: true,
          message: '删除成功',
          type: 'success',
          onClose: () => {
            this.getJob()
            this.getTreeDept()
          }
        })
      })
    },
    editJob(id) {
      this.$axios.get(this.$settings.BASE_URL + '/permission/job/' + id + '/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.ruleForm = res.data.data
        this.title = '修改'
        this.dialogVisible = true
      })
    },
    setJob() {
      let axios_type = this.$axios.post
      if (this.ruleForm.id) {
        axios_type = this.$axios.put
      }
      axios_type(this.$settings.BASE_URL + '/permission/job/' + (this.ruleForm.id ? this.ruleForm.id + '/' : ''), this.ruleForm, {
        headers: {
          Authorization: this.$cookies.get('token'),
          Auth: (this.ruleForm.id ? 'job:mod' : 'job:add')
        }
      }).then(res => {
        if (res.data.code === 100) {
          this.$message({
            showClose: true,
            message: '操作成功',
            type: 'success',
            onClose: () => {
              this.getJob()
              this.getTreeDept()
              this.dialogVisible = false
              this.ruleForm = {
                name: '',
                dept: null,
                status: true
              }
            }
          })
        }

      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(_ => {
            this.dialogVisible = false
            this.title = '新增'
            this.ruleForm = {
              name: '',
              dept: null,
              status: true
            }
          })
          .catch(_ => {
          });
    },
    getJob() {
      this.$axios.get(this.$settings.BASE_URL + '/permission/job/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.tableData = res.data.data.results
        this.restaurants = res.data.data.results
        this.count = res.data.data.count
        this.next_page = res.data.data.next
      })
    },
    getTreeDept() {
      this.$axios.get(this.$settings.BASE_URL + '/permission/dept/all_dept/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.depts = res.data.data.results
      })
    },
    querySearchAsync(queryString, cb) {
      var restaurants = this.restaurants;
      var results = queryString ? restaurants.filter(this.createStateFilter(queryString)) : restaurants;

      clearTimeout(this.timeout);
      this.timeout = setTimeout(() => {
        cb(results);
      }, 800 * Math.random());
    },
    createStateFilter(queryString) {
      console.log(queryString)
      return (state) => {
        return (state.name.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
      };
    },
    handleSelect(item) {
      console.log(item);
      this.tableData = [item]
    }
  },
  created() {
    this.getJob()
    this.getTreeDept()
  },
  components: {
    Treeselect
  }
}
</script>

<style scoped>

</style>