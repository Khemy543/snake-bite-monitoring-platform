<template>
  <div>
    <div class="d-flex justify-content-between">
      <h4 slot="header" class="card-title">Administrators</h4>
      <base-button
        native-type="button"
        type="primary"
        class="btn-fill"
        @click="addAdmin"
      >
        Add Admin
      </base-button>
    </div>
    <br/>
    <div class="card p-4">
    <base-table :data="table" thead-classes="text-primary">
      <template slot="columns">
        <th>#</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Created At</th>
        <th>Status</th>
        <th class="text-right">Actions</th>
      </template>

      <template slot-scope="{ row, index }">
        <td>{{ index + 1 }}</td>
        <td>{{ row.name }}</td>
        <td>{{ row.email }}</td>
        <td>{{ row.phone }}</td>
        <td>{{ row.created_at }}</td>
        <td>{{ row.isActive ? 'Active' : 'InActive' }}</td>
        <td class="text-right">
          <el-tooltip
            v-if="row.isActive"
            content="Edit"
            effect="light"
            :open-delay="300"
            placement="top"
          >
            <base-button
              @click="blockAdmin(row)"
              type="success"
              icon
              size="sm"
              class="btn-link"
            >
              <i class="tim-icons icon-pencil"></i>
            </base-button>
          </el-tooltip>
          <el-tooltip
            v-else
            content="Delete"
            effect="light"
            :open-delay="300"
            placement="top"
          >
            <base-button
              type="danger"
              icon
              size="sm"
              class="btn-link"
              @click="unBlockAdmin(row)"
            >
              <i class="tim-icons icon-simple-remove"></i>
            </base-button>
          </el-tooltip>
        </td>
      </template>
    </base-table>
  </div>
  </div>
</template>
<script>
import { BaseTable } from "@/components";
import Vue from 'vue'
export default {
  components: {
    BaseTable,
  },
  async asyncData({ $axios }) {
    try {
        const response = await $axios.get("admin/fetch-admins");
      if(response && response.data){
        const { data } = response;
        return { table : data }
      }
    } catch (error) {
      console.log(error)
    }
    
  },
  data() {
    return {
      table: [],
      modal: false,
      meta : {}
    };
  },

  methods: {
    addAdmin() {
      this.$router.push('/admins/add-admin');
    },
    async blockAdmin(admin){
      try {
        const response = await this.$axios.patch(`admin/${admin.id}/block`);

        if(response && response.data){
          let tempAdmin = {...admin, isActive:true};
          this.updateAdmin(tempAdmin)
          this.$notify({ type:'success', message : 'Admin Blocked!' });
                        
        }
      } catch (error) {
          console.log(error)
          this.$notify({ type:'danger', message : 'Error blocking admin!' });
      }
    },
    async unBlockAdmin(admin){
      try {
        const response = await this.$axios.patch(`admin/${admin.id}/unblock`);

        if(response && response.data){
          let tempAdmin = {...admin, isActive:false};
          this.updateAdmin(tempAdmin)

          this.$notify({ type:'success', message : 'Admin unblocked!' });
                        
        }
      } catch (error) {
          this.$notify({ type:'danger', message : 'Error ubblocking admin!' });
      }
    },
    updateAdmin(admin){
      const index = this.table.findIndex(item => item.id == admin.id);
      Vue.set(this.table, index, admin)
    }
  },
};
</script>