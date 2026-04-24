<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="所属用户" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入所属用户"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公母" prop="gender">
        <el-select v-model="queryParams.gender" placeholder="请选择公母" clearable>
          <el-option
            v-for="dict in pet_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="岁数" prop="age">
        <el-input
          v-model="queryParams.age"
          placeholder="请输入岁数"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="品种" prop="breed">
        <el-input
          v-model="queryParams.breed"
          placeholder="请输入品种"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="分类" prop="catOrDog">
        <el-input
          v-model="queryParams.catOrDog"
          placeholder="请输入分类"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="领养注释" prop="adoptionInfo">
        <el-input
          v-model="queryParams.adoptionInfo"
          placeholder="请输入领养注释"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="领养状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择领养状态" clearable>
          <el-option
            v-for="dict in pet_status"
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
          v-hasPermi="['pets:pets:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['pets:pets:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['pets:pets:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['pets:pets:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="petsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="petId" />
      <el-table-column label="所属用户" align="center" prop="userId" />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="公母" align="center" prop="gender">
        <template #default="scope">
          <dict-tag :options="pet_sex" :value="scope.row.gender"/>
        </template>
      </el-table-column>
      <el-table-column label="岁数" align="center" prop="age" />
      <el-table-column label="体型" align="center" prop="bodytype" />
      <el-table-column label="性格" align="center" prop="personality" />
      <el-table-column label="品种" align="center" prop="breed" />
      <el-table-column label="分类" align="center" prop="catOrDog" />
      <el-table-column label="是否接种疫苗" align="center" prop="vaccination">
        <template #default="scope">
          <dict-tag :options="pet_v" :value="scope.row.vaccination"/>
        </template>
      </el-table-column>
      <el-table-column label="图片地址" align="center" prop="imageUrl" />
      <el-table-column label="领养注释" align="center" prop="adoptionInfo" />
      <el-table-column label="领养状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="pet_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="月消费能力" align="center" prop="monthMoney" />
      <el-table-column label="容易脏程度" align="center" prop="cleanwithpet" />
      <el-table-column label="是否需要后院" align="center" prop="environment" />
      <el-table-column label="宠物精力程度" align="center" prop="energy" />
      <el-table-column label="脱毛" align="center" prop="hair">
        <template #default="scope">
          <dict-tag :options="pet_hair" :value="scope.row.hair"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['pets:pets:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['pets:pets:remove']">删除</el-button>
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

    <!-- 添加或修改宠物管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="petsRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="所属用户" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入所属用户" />
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="公母" prop="gender">
          <el-select v-model="form.gender" placeholder="请选择公母">
            <el-option
              v-for="dict in pet_sex"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="岁数" prop="age">
          <el-input v-model="form.age" placeholder="请输入岁数" />
        </el-form-item>
        <el-form-item label="性格" prop="personality">
          <el-input v-model="form.personality" placeholder="请输入性格" />
        </el-form-item>
        <el-form-item label="品种" prop="breed">
          <el-input v-model="form.breed" placeholder="请输入品种" />
        </el-form-item>
        <el-form-item label="分类" prop="catOrDog">
          <el-input v-model="form.catOrDog" placeholder="请输入分类" />
        </el-form-item>
        <el-form-item label="是否接种疫苗" prop="vaccination">
          <el-select v-model="form.vaccination" placeholder="请选择是否接种疫苗">
            <el-option
              v-for="dict in pet_v"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="图片地址" prop="imageUrl">
          <el-input v-model="form.imageUrl" placeholder="请输入图片地址" />
        </el-form-item>
        <el-form-item label="领养注释" prop="adoptionInfo">
          <el-input v-model="form.adoptionInfo" placeholder="请输入领养注释" />
        </el-form-item>
        <el-form-item label="领养状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择领养状态">
            <el-option
              v-for="dict in pet_status"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="月消费能力" prop="monthMoney">
          <el-input v-model="form.monthMoney" placeholder="请输入月消费能力" />
        </el-form-item>
        <el-form-item label="容易脏程度" prop="cleanwithpet">
          <el-input v-model="form.cleanwithpet" placeholder="请输入容易脏程度" />
        </el-form-item>
        <el-form-item label="是否需要后院" prop="environment">
          <el-input v-model="form.environment" placeholder="请输入是否需要后院" />
        </el-form-item>
        <el-form-item label="宠物精力程度" prop="energy">
          <el-input v-model="form.energy" placeholder="请输入宠物精力程度" />
        </el-form-item>
        <el-form-item label="脱毛" prop="hair">
          <el-select v-model="form.hair" placeholder="请选择脱毛">
            <el-option
              v-for="dict in pet_hair"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
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

<script setup name="Pets">
import { listPets, getPets, delPets, addPets, updatePets } from "@/api/pets/pets";

const { proxy } = getCurrentInstance();
const { pet_sex, pet_hair, pet_status, pet_v } = proxy.useDict('pet_sex', 'pet_hair', 'pet_status', 'pet_v');

const petsList = ref([]);
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
    userId: null,
    name: null,
    gender: null,
    age: null,
    breed: null,
    catOrDog: null,
    adoptionInfo: null,
    status: null,
  },
  rules: {
    userId: [
      { required: true, message: "所属用户不能为空", trigger: "blur" }
    ],
    name: [
      { required: true, message: "姓名不能为空", trigger: "blur" }
    ],
    gender: [
      { required: true, message: "公母不能为空", trigger: "change" }
    ],
    age: [
      { required: true, message: "岁数不能为空", trigger: "blur" }
    ],
    catOrDog: [
      { required: true, message: "分类不能为空", trigger: "blur" }
    ],
    vaccination: [
      { required: true, message: "是否接种疫苗不能为空", trigger: "change" }
    ],
    status: [
      { required: true, message: "领养状态不能为空", trigger: "change" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询宠物管理列表 */
function getList() {
  loading.value = true;
  listPets(queryParams.value).then(response => {
    petsList.value = response.rows;
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
    petId: null,
    userId: null,
    name: null,
    gender: null,
    age: null,
    bodytype: null,
    personality: null,
    breed: null,
    catOrDog: null,
    vaccination: null,
    imageUrl: null,
    adoptionInfo: null,
    status: null,
    monthMoney: null,
    cleanwithpet: null,
    environment: null,
    energy: null,
    hair: null,
    score: null
  };
  proxy.resetForm("petsRef");
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
  ids.value = selection.map(item => item.petId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加宠物管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _petId = row.petId || ids.value
  getPets(_petId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改宠物管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["petsRef"].validate(valid => {
    if (valid) {
      if (form.value.petId != null) {
        updatePets(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addPets(form.value).then(response => {
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
  const _petIds = row.petId || ids.value;
  proxy.$modal.confirm('是否确认删除宠物管理编号为"' + _petIds + '"的数据项？').then(function() {
    return delPets(_petIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('pets/pets/export', {
    ...queryParams.value
  }, `pets_${new Date().getTime()}.xlsx`)
}

getList();
</script>
