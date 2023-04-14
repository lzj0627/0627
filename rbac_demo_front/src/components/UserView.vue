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
      <el-button v-if="hasAuth('user:add')" type="primary" @click="dialogVisible = true" style="margin-left: 10px">
        新增用户
      </el-button>
      <el-button v-if="hasAuth('user:del')" type="danger" @click="delClick(null)">批量删除</el-button>
    </div>

    <el-table
        :data="tableData"
        border
        style="width: 100%;margin-top:15px"
        v-loading="loading"
        @selection-change="handleSelectionChange">
      <el-table-column
          type="selection"
          width="55">
      </el-table-column>
      <el-table-column
          prop="date"
          label="头像"
          width="60">
        <template slot-scope="scope">
          <el-avatar size="small" :src="scope.row.avatar"></el-avatar>
        </template>
      </el-table-column>
      <el-table-column
          prop="username"
          label="用户名"
          width="180">
      </el-table-column>
      <el-table-column
          prop="gender_name"
          label="性别">
      </el-table-column>
      <el-table-column
          prop="roles"
          label="角色">
        <template slot-scope="scope">
          <el-tag size="small" type="danger" v-for="item in scope.row.role_list" :key="item.name">{{
              item.name
            }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column
          prop="email"
          label="邮箱">
      </el-table-column>
      <el-table-column
          prop="mobile"
          label="手机号">
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
          prop="date_joined"
          label="创建时间">
      </el-table-column>
      <el-table-column
          prop="mod"
          label="操作">
        <template slot-scope="scope">
          <el-button type="primary" icon="el-icon-edit" circle @click="editClick(scope.row.id)"
                     v-if="hasAuth('user:mod')"></el-button>
          <el-button type="danger" icon="el-icon-delete" circle @click="delClick(scope.row.id)"
                     v-if="hasAuth('user:del')"></el-button>

        </template>
      </el-table-column>
    </el-table>

    <!--  新增用户对话框  -->
    <el-dialog
        v-loading=""
        :title="title"
        :visible.sync="dialogVisible"
        width="30%"
        :before-close="handleClose">
      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="ruleForm.username"></el-input>
        </el-form-item>
        <el-form-item label="手机号" prop="mobile">
          <el-input v-model="ruleForm.mobile"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="ruleForm.email"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-select v-model="ruleForm.gender" placeholder="请选择性别">
            <el-option label="男" value="1"></el-option>
            <el-option label="女" value="2"></el-option>
            <el-option label="保密" value="3"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="部门" prop="dept">
          <treeselect
              style="width: 170px"
              placeholder="选择部门"
              v-model="ruleForm.dept"
              :options="depts"
              @input="get_job"
          />
        </el-form-item>
        <el-form-item label="岗位" prop="job">
          <el-select v-model="ruleForm.job" multiple placeholder="请选择">
            <el-option
                v-for="item in jobs"
                :key="item.name"
                :label="item.name"
                :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="角色" prop="role">
          <el-select v-model="ruleForm.roles" multiple placeholder="请选择">
            <el-option
                v-for="item in roles"
                :key="item.name"
                :label="item.name"
                :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否启用" prop="delivery">
          <el-switch v-model="ruleForm.status"></el-switch>
        </el-form-item>

      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="handleClose">取 消</el-button>
        <el-button type="primary" @click="submitForm('ruleForm')">确 定</el-button>
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
import Treeselect from '@riophae/vue-treeselect'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'

export default {
  name: "UserView",
  data() {
    return {
      loading:false,
      prev_page:'',
      next_page:'',
      count:'',
      firstData: [],
      restaurants: [],
      state: '',
      timeout: null,
      title: '新增',
      multipleSelection: [],
      tableData: [],
      permission: [],
      depts: [],
      jobs: [],
      roles: [],
      dept_list: [],
      dialogVisible: false,
      ruleForm: {
        username: '',
        gender: '',
        status: true,
        dept: null,
        roles: [],
        job: [],
        mobile: '',
        email: ''
      },
      rules: {
        username: [
          {required: true, message: '请输入用户名', trigger: 'blur'},
          {min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur'}
        ],
        gender: [
          {required: true, message: '请选择性别', trigger: 'change'}
        ],
        email: [
          {type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change']}
        ],
        mobile: [
          {required: true, message: '请输入手机号', trigger: 'blur'},
        ]
      },
      defaultProps: {
        children: 'child',
        label: 'name'
      }
    };
  }
  ,
  methods: {
    searchUser(){
      this.loading = true
      this.$axios.get(this.$settings.BASE_URL + '/user/user/?search=' + this.state, {headers:{Authorization: this.$cookies.get('token')}}).then(res => {
        this.tableData = res.data.data.results
        this.count = res.data.data.count
        this.loading = false
      })
    },
    prevPage(){
      this.$axios.get(this.prev_page, {headers:{Authorization: this.$cookies.get('token')}}).then(res => {
        this.tableData = res.data.data.results
        this.next_page = res.data.data.next
      })
    },
    getPage(val){
      this.$axios.get(this.$settings.BASE_URL + '/user/user/?page=' + val, {headers:{Authorization: this.$cookies.get('token')}}).then(res => {
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
    handleSelectionChange(val) {
      this.multipleSelection = val;
      console.log(this.multipleSelection)
    },
    editClick(user) {
      this.$axios.get(this.$settings.BASE_URL + '/user/user/' + user + '/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.ruleForm = res.data.data
      })
      this.title = '修改'
      this.dialogVisible = true
    },
    hasAuth(auth) {
      return this.permission.indexOf(auth) > -1
    },
    delClick(user) {
      let ids = []
      if (user) {
        ids.push(user)
      } else {
        console.log(this.multipleSelection)
        this.multipleSelection.forEach(row => {
          ids.push(row.id)
        })
      }
      this.$confirm('此操作将永久删除该用户, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post(this.$settings.BASE_URL + '/user/user/del_user/', {ids: ids}, {
          headers: {
            Authorization: this.$cookies.get('token'),
            Auth: 'user:del'
          }
        }).then(res => {
          this.$message({
            showClose: true,
            message: '删除成功',
            type: 'success',
            onClose: () => {
              this.getUser()
            }
          })
        }).catch()
      })
    },
    get_job() {
      this.$axios.get(this.$settings.BASE_URL + '/permission/dept/' + this.ruleForm.dept + '/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        if (!this.ruleForm.id) {
          this.ruleForm.job = []
        }
        console.log(res.data.data)
        this.jobs = res.data.data.job_list
      })
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          let http_type = this.ruleForm.id ? this.$axios.put : this.$axios.post
          console.log(this.ruleForm)
          http_type(this.$settings.BASE_URL + '/user/user/' + (this.ruleForm.id ? this.ruleForm.id + '/' : ''), this.ruleForm, {
            headers: {
              Authorization: this.$cookies.get('token'),
              Auth: (this.ruleForm.id ? 'user:mod' : 'user:mod')
            }
          }).then(res => {
            if (res.data.code === 100) {
              this.$message.success('操作成功')
              this.dialogVisible = false
              this.getUser()
              this.ruleForm = {
                username: '',
                gender: '',
                status: true,
                dept: '',
                roles: [],
                job: [],
                mobile: '',
                email: ''
              }
              this.jobs = []
            } else {
              this.$message.warning(res.data.msg)
            }
          })
        } else {
          this.$message.error('未知异常')
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(_ => {
            // done();
            this.dialogVisible = false
            this.ruleForm = {
              username: '',
              gender: '',
              status: true,
              dept: null,
              roles: [],
              job: [],
              mobile: '',
              email: ''
            }
            this.jobs = []
            this.get_dept_list()
            this.get_all_dept()
            this.title = '新增'
          })
          .catch(_ => {
          });
    },
    getUser() {
      this.$axios.get(this.$settings.BASE_URL + '/user/user/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        // console.log(res.data.data)
        this.tableData = res.data.data.results
        this.restaurants = res.data.data.results
        this.firstData = res.data.data.results
        this.count = res.data.data.count
        this.permission = this.$store.state.permission_list
        this.next_page = res.data.data.next
      })
    },
    getRole() {
      this.$axios.get(this.$settings.BASE_URL + '/permission/role/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        // console.log(res.data.data)
        this.roles = res.data.data.results
        // console.log(this.permission)
      })
    },
    get_dept_list() {
      this.$axios.get(this.$settings.BASE_URL + '/permission/dept/', {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
        this.dept_list = res.data.data.results
      })
    },
    get_all_dept() {
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
        return (state.username.toLowerCase().indexOf(queryString.toLowerCase()) !== -1);
      };
    },
    handleSelect(item) {
      console.log(item);
      this.tableData = [item]
    },
    handInput() {
      this.loading=true
      if (this.state.length === 0) {
        setTimeout(()=>{
          this.loading=false
          this.getUser()
        }, 1000)

      } else {
        setTimeout(()=>{
          this.loading=false
          this.$axios.get(this.$settings.BASE_URL + '/user/user/?search=' + this.state, {headers: {Authorization: this.$cookies.get('token')}}).then(res => {
            this.tableData = res.data.data.results
            this.count = res.data.data.count
          })
        }, 1000)

      }
    },
  },
  created() {
    this.get_dept_list()
    this.get_all_dept()
    this.getUser()
    this.getRole()
  },
  components: {
    Treeselect
  }
}
</script>

<style scoped>

</style>