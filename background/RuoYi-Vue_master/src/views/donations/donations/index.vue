<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="宠物名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入宠物名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="接种疫苗" prop="vaccination">
        <el-input
          v-model="queryParams.vaccination"
          placeholder="请输入接种疫苗"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="捐赠人真实姓名" prop="donorName">
        <el-input
          v-model="queryParams.donorName"
          placeholder="请输入捐赠人真实姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="捐赠人手机号" prop="donorContact">
        <el-input
          v-model="queryParams.donorContact"
          placeholder="请输入捐赠人手机号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审核状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择审核状态" clearable>
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
          v-hasPermi="['donations:donations:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['donations:donations:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['donations:donations:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['donations:donations:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="donationsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="donationId" />
      <el-table-column label="用户id" align="center" prop="userId" />
      <el-table-column label="宠物名称" align="center" prop="name" />
      <el-table-column label="性别" align="center" prop="gender" />
      <el-table-column label="年纪" align="center" prop="age" />
      <el-table-column label="性格" align="center" prop="personality" />
      <el-table-column label="品种" align="center" prop="breed" />
      <el-table-column label="猫还是狗" align="center" prop="catOrDog" />
      <el-table-column label="接种疫苗" align="center" prop="vaccination" />
      <el-table-column label="领养备注" align="center" prop="adoptionInfo" />
      <el-table-column label="捐赠人真实姓名" align="center" prop="donorName" />
      <el-table-column label="捐赠人手机号" align="center" prop="donorContact" />
      <el-table-column label="捐赠日期" align="center" prop="donationDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.donationDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审核通过时间" align="center" prop="passDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.passDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审核状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="app" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['donations:donations:edit']">通过</el-button>
          <el-button link type="primary" icon="Edit" @click="handleDelete(scope.row)" v-hasPermi="['donations:donations:remove']">不通过</el-button>
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

    <!-- 添加或修改宠物捐赠对话框 -->
    <!-- <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="donationsRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户id" />
        </el-form-item>
        <el-form-item label="宠物名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入宠物名称" />
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-input v-model="form.gender" placeholder="请输入性别" />
        </el-form-item>
        <el-form-item label="年纪" prop="age">
          <el-input v-model="form.age" placeholder="请输入年纪" />
        </el-form-item>
        <el-form-item label="性格" prop="personality">
          <el-input v-model="form.personality" placeholder="请输入性格" />
        </el-form-item>
        <el-form-item label="品种" prop="breed">
          <el-input v-model="form.breed" placeholder="请输入品种" />
        </el-form-item>
        <el-form-item label="猫还是狗" prop="catOrDog">
          <el-input v-model="form.catOrDog" placeholder="请输入猫还是狗" />
        </el-form-item>
        <el-form-item label="图片链接" prop="imageUrl">
          <el-input v-model="form.imageUrl" placeholder="请输入图片链接" />
        </el-form-item>
        <el-form-item label="接种疫苗" prop="vaccination">
          <el-input v-model="form.vaccination" placeholder="请输入接种疫苗" />
        </el-form-item>
        <el-form-item label="领养备注" prop="adoptionInfo">
          <el-input v-model="form.adoptionInfo" placeholder="请输入领养备注" />
        </el-form-item>
        <el-form-item label="捐赠人真实姓名" prop="donorName">
          <el-input v-model="form.donorName" placeholder="请输入捐赠人真实姓名" />
        </el-form-item>
        <el-form-item label="捐赠人手机号" prop="donorContact">
          <el-input v-model="form.donorContact" placeholder="请输入捐赠人手机号" />
        </el-form-item>
        <el-form-item label="捐赠日期" prop="donationDate">
          <el-date-picker clearable
            v-model="form.donationDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择捐赠日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="审核通过时间" prop="passDate">
          <el-date-picker clearable
            v-model="form.passDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择审核通过时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="审核状态" prop="status">
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

<script setup name="Donations">
import { listDonations, getDonations, delDonations, addDonations, updateDonations } from "@/api/donations/donations";

const { proxy } = getCurrentInstance();
const { app } = proxy.useDict('app');

const donationsList = ref([]);
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
    name: null,
    vaccination: null,
    donorName: null,
    donorContact: null,
    status: null
  },
  rules: {
    name: [
      { required: true, message: "宠物名称不能为空", trigger: "blur" }
    ],
    vaccination: [
      { required: true, message: "接种疫苗不能为空", trigger: "blur" }
    ],
    donorName: [
      { required: true, message: "捐赠人真实姓名不能为空", trigger: "blur" }
    ],
    donorContact: [
      { required: true, message: "捐赠人手机号不能为空", trigger: "blur" }
    ],
    status: [
      { required: true, message: "审核状态不能为空", trigger: "change" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询宠物捐赠列表 */
function getList() {
  loading.value = true;
  listDonations(queryParams.value).then(response => {
    donationsList.value = response.rows;
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
    donationId: null,
    userId: null,
    name: null,
    gender: null,
    age: null,
    personality: null,
    breed: null,
    catOrDog: null,
    imageUrl: null,
    vaccination: null,
    adoptionInfo: null,
    donorName: null,
    donorContact: null,
    donationDate: null,
    passDate: null,
    status: null
  };
  proxy.resetForm("donationsRef");
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
  ids.value = selection.map(item => item.donationId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加宠物捐赠";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _donationId = row.donationId || ids.value
  getDonations(_donationId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改宠物捐赠";
    getList();
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["donationsRef"].validate(valid => {
    if (valid) {
      if (form.value.donationId != null) {
        updateDonations(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addDonations(form.value).then(response => {
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
  const _donationIds = row.donationId || ids.value;
  proxy.$modal.confirm('是否确认不通过宠物捐赠编号为"' + _donationIds + '"的申请？').then(function() {
    return delDonations(_donationIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("确认成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('donations/donations/export', {
    ...queryParams.value
  }, `donations_${new Date().getTime()}.xlsx`)
}

getList();
</script>
