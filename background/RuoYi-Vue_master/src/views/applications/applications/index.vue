<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="宠物id" prop="petId">
        <el-input
          v-model="queryParams.petId"
          placeholder="请输入宠物id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户id" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="申请人姓名" prop="applicantName">
        <el-input
          v-model="queryParams.applicantName"
          placeholder="请输入申请人姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in app"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['applications:applications:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['applications:applications:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['applications:applications:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['applications:applications:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="applicationsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="applicationId" />
      <el-table-column label="宠物id" align="center" prop="petId" />
      <el-table-column label="用户id" align="center" prop="userId" />
      <el-table-column label="申请人姓名" align="center" prop="applicantName" />
      <el-table-column label="申请人联系方式" align="center" prop="applicantContact" />
      <el-table-column label="申请人居住地址" align="center" prop="applicantAddress" />
      <el-table-column label="申请人年纪" align="center" prop="applicantAge" />
      <el-table-column label="申请日期" align="center" prop="applicationDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.applicationDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="通过日期" align="center" prop="passDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.passDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="app" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['applications:applications:edit']">通过</el-button>
          <el-button link type="primary" icon="Edit" @click="handleDelete(scope.row)" v-hasPermi="['applications:applications:remove']">不通过</el-button>
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

    <!-- 添加或修改宠物领养对话框 -->
    <!-- <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="applicationsRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="宠物id" prop="petId">
          <el-input v-model="form.petId" placeholder="请输入宠物id" />
        </el-form-item>
        <el-form-item label="用户id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户id" />
        </el-form-item>
        <el-form-item label="申请人姓名" prop="applicantName">
          <el-input v-model="form.applicantName" placeholder="请输入申请人姓名" />
        </el-form-item>
        <el-form-item label="申请人联系方式" prop="applicantContact">
          <el-input v-model="form.applicantContact" placeholder="请输入申请人联系方式" />
        </el-form-item>
        <el-form-item label="申请人居住地址" prop="applicantAddress">
          <el-input v-model="form.applicantAddress" placeholder="请输入申请人居住地址" />
        </el-form-item>
        <el-form-item label="申请人年纪" prop="applicantAge">
          <el-input v-model="form.applicantAge" placeholder="请输入申请人年纪" />
        </el-form-item>
        <el-form-item label="申请日期" prop="applicationDate">
          <el-date-picker clearable
            v-model="form.applicationDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择申请日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="通过日期" prop="passDate">
          <el-date-picker clearable
            v-model="form.passDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择通过日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in app"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog> -->
  </div>
</template>

<script setup name="Applications">
import { listApplications, getApplications, delApplications, addApplications, updateApplications } from "@/api/applications/applications";

const { proxy } = getCurrentInstance();
const { app } = proxy.useDict('app');

const applicationsList = ref([]);
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
    petId: null,
    userId: null,
    applicantName: null,
    status: null
  },
  rules: {
    applicantName: [
      { required: true, message: "申请人姓名不能为空", trigger: "blur" }
    ],
    applicantContact: [
      { required: true, message: "申请人联系方式不能为空", trigger: "blur" }
    ],
    applicantAddress: [
      { required: true, message: "申请人居住地址不能为空", trigger: "blur" }
    ],
    applicantAge: [
      { required: true, message: "申请人年纪不能为空", trigger: "blur" }
    ],
    applicationDate: [
      { required: true, message: "申请日期不能为空", trigger: "blur" }
    ],
    status: [
      { required: true, message: "状态不能为空", trigger: "change" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询宠物领养列表 */
function getList() {
  loading.value = true;
  listApplications(queryParams.value).then(response => {
    applicationsList.value = response.rows;
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
    applicationId: null,
    petId: null,
    userId: null,
    applicantName: null,
    applicantContact: null,
    applicantAddress: null,
    applicantAge: null,
    applicationDate: null,
    passDate: null,
    status: null
  };
  proxy.resetForm("applicationsRef");
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
  ids.value = selection.map(item => item.applicationId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加宠物领养";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _applicationId = row.applicationId || ids.value
  getApplications(_applicationId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改宠物领养";
    getList();
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["applicationsRef"].validate(valid => {
    if (valid) {
      if (form.value.applicationId != null) {
        updateApplications(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addApplications(form.value).then(response => {
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
  const _applicationIds = row.applicationId || ids.value;
  proxy.$modal.confirm('是否确认不通过宠物领养编号为"' + _applicationIds + '"的申请？').then(function() {
    return delApplications(_applicationIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("确认成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('applications/applications/export', {
    ...queryParams.value
  }, `applications_${new Date().getTime()}.xlsx`)
}

getList();
</script>
