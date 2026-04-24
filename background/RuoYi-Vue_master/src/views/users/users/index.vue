<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户名" prop="username">
        <el-input
          v-model="queryParams.username"
          placeholder="请输入用户名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input
          v-model="queryParams.email"
          placeholder="请输入邮箱"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入手机号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="gender">
        <el-select v-model="queryParams.gender" placeholder="请选择性别" clearable>
          <el-option
            v-for="dict in sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="家里有无老人小孩" prop="children">
        <el-select v-model="queryParams.children" placeholder="请选择家里有无老人小孩" clearable>
          <el-option
            v-for="dict in children"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="年龄" prop="age">
        <el-input
          v-model="queryParams.age"
          placeholder="请输入年龄"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['users:users:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['users:users:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['users:users:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['users:users:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="usersList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="userId" />
      <el-table-column label="用户名" align="center" prop="username" />
      <el-table-column label="邮箱" align="center" prop="email" />
      <el-table-column label="手机号" align="center" prop="phone" />
      <el-table-column label="性别" align="center" prop="gender">
        <template #default="scope">
          <dict-tag :options="sys_user_sex" :value="scope.row.gender"/>
        </template>
      </el-table-column>
      <el-table-column label="性格" align="center" prop="personality" />
      <el-table-column label="家里有无老人小孩" align="center" prop="children">
        <template #default="scope">
          <dict-tag :options="children" :value="scope.row.children"/>
        </template>
      </el-table-column>
      <el-table-column label="年龄" align="center" prop="age" />
      <el-table-column label="薪资范围" align="center" prop="wage">
        <template #default="scope">
          <dict-tag :options="wage" :value="scope.row.wage"/>
        </template>
      </el-table-column>
      <el-table-column label="养宠经验" align="center" prop="experience">
        <template #default="scope">
          <dict-tag :options="children" :value="scope.row.experience"/>
        </template>
      </el-table-column>
      <el-table-column label="偏爱猫还是狗" align="center" prop="catOrDog" />
      <el-table-column label="一周能陪伴的时间" align="center" prop="timewithpet">
        <template #default="scope">
          <dict-tag :options="users_accompany" :value="scope.row.timewithpet"/>
        </template>
      </el-table-column>
      <el-table-column label="多长时间清洁一次" align="center" prop="cleanwithpet" />
      <el-table-column label="钟爱体型" align="center" prop="bodytypewithpet" />
      <el-table-column label="有无后院" align="center" prop="environment" />
      <el-table-column label="偏爱公母" align="center" prop="petgender">
        <template #default="scope">
          <dict-tag :options="pet_sex" :value="scope.row.petgender"/>
        </template>
      </el-table-column>
      <el-table-column label="反馈表的内容" align="center" prop="questionFk" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['users:users:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['users:users:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改用户管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="usersRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="form.username" placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="form.password" placeholder="请输入密码" />
        </el-form-item>
        <el-form-item label="头像地址" prop="icon">
          <el-input v-model="form.icon" placeholder="请输入头像地址" />
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入手机号" />
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-select v-model="form.gender" placeholder="请选择性别">
            <el-option
              v-for="dict in sys_user_sex"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="性格" prop="personality">
          <el-input v-model="form.personality" placeholder="请输入性格" />
        </el-form-item>
        <el-form-item label="家里有无老人小孩" prop="children">
          <el-select v-model="form.children" placeholder="请选择家里有无老人小孩">
            <el-option
              v-for="dict in children"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="年龄" prop="age">
          <el-input v-model="form.age" placeholder="请输入年龄" />
        </el-form-item>
        <el-form-item label="薪资范围" prop="wage">
          <el-select v-model="form.wage" placeholder="请选择薪资范围">
            <el-option
              v-for="dict in wage"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="养宠经验" prop="experience">
          <el-select v-model="form.experience" placeholder="请选择养宠经验">
            <el-option
              v-for="dict in children"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="偏爱猫还是狗" prop="catOrDog">
          <el-input v-model="form.catOrDog" placeholder="请输入偏爱猫还是狗" />
        </el-form-item>
        <el-form-item label="一周能陪伴的时间" prop="timewithpet">
          <el-select v-model="form.timewithpet" placeholder="请选择一周能陪伴的时间">
            <el-option
              v-for="dict in users_accompany"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="多长时间清洁一次" prop="cleanwithpet">
          <el-input v-model="form.cleanwithpet" placeholder="请输入多长时间清洁一次" />
        </el-form-item>
        <el-form-item label="钟爱体型" prop="bodytypewithpet">
          <el-input v-model="form.bodytypewithpet" placeholder="请输入钟爱体型" />
        </el-form-item>
        <el-form-item label="有无后院" prop="environment">
          <el-input v-model="form.environment" placeholder="请输入有无后院" />
        </el-form-item>
        <el-form-item label="偏爱公母" prop="petgender">
          <el-select v-model="form.petgender" placeholder="请选择偏爱公母">
            <el-option
              v-for="dict in pet_sex"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="反馈表的内容" prop="questionFk">
          <el-input v-model="form.questionFk" placeholder="请输入反馈表的内容" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Users">
import { listUsers, getUsers, delUsers, addUsers, updateUsers } from "@/api/users/users";

const { proxy } = getCurrentInstance();
const { children, pet_sex, users_accompany, sys_user_sex, wage } = proxy.useDict('children', 'pet_sex', 'users_accompany', 'sys_user_sex', 'wage');

const usersList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    username: null,
    email: null,
    phone: null,
    gender: null,
    children: null,
    age: null,
  },
  rules: {
    username: [
      { required: true, message: "用户名不能为空", trigger: "blur" }
    ],
    password: [
      { required: true, message: "密码不能为空", trigger: "blur" }
    ],
    email: [
      { required: true, message: "邮箱不能为空", trigger: "blur" }
    ],
    phone: [
      { required: true, message: "手机号不能为空", trigger: "blur" }
    ],
    gender: [
      { required: true, message: "性别不能为空", trigger: "change" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询用户管理列表 */
function getList() {
  loading.value = true;
  listUsers(queryParams.value).then(response => {
    usersList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    userId: null,
    username: null,
    password: null,
    icon: null,
    email: null,
    phone: null,
    gender: null,
    personality: null,
    children: null,
    age: null,
    wage: null,
    experience: null,
    catOrDog: null,
    timewithpet: null,
    cleanwithpet: null,
    bodytypewithpet: null,
    environment: null,
    petgender: null,
    questionFk: null
  };
  proxy.resetForm("usersRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.userId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加用户管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _userId = row.userId || ids.value
  getUsers(_userId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改用户管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["usersRef"].validate(valid => {
    if (valid) {
      if (form.value.userId != null) {
        updateUsers(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addUsers(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _userIds = row.userId || ids.value;
  proxy.$modal.confirm('是否确认删除用户管理编号为"' + _userIds + '"的数据项？').then(function() {
    return delUsers(_userIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('users/users/export', {
    ...queryParams.value
  }, `users_${new Date().getTime()}.xlsx`)
}

getList();
</script>
