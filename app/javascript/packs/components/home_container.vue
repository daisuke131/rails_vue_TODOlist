<template>
  <div class="container">
    <h2>TODO List</h2>
    <form v-on:submit.prevent>
      <input type="text" v-model="newItem">
      <button @click.prevent="createItem">
        保存
      </button>
    </form>
    <ul>
      <li v-for="(todo, index) in todos" :key="todo.id">
        <input type="checkbox" v-on:change="doneChange(index, todo.id, todo.done)" v-model="todo.done">
        <span :class="{ done: todo.done }">{{ todo.body }}</span>
        <button v-on:click="deleteItem(index, todo.id)">削除</button>
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
  import axios from "axios"
  import { Vue, Component } from "vue-property-decorator"

  @Component
  export default class HomeContainer extends Vue {
    todos = []
    addItem = []
    newItem = ""

    async mounted(): Promise<void> {
      await this.fetchHome();
    }

    async fetchHome(): Promise<void> {
      await axios.get("/api/v1/todos").then((response) => {
        response.data.map((todo: any) => {
          this.todos.push(todo);
        })
      })
    }

    async createItem(): Promise<void> {
      await axios.post("/api/v1/todos", { body: this.newItem }).then((response) => {
        this.todos.unshift(response.data);
        this.newItem = "";
      }).catch(() => {
      })
    }

    async doneChange(index, donechange_id, done_flg): Promise<void> {
      await axios.put("/api/v1/todos/" + donechange_id, { done: done_flg }).then((response) => {
      }).catch(() => {
      })
    }

    async deleteItem(index, delete_id): Promise<void> {
      await axios.delete("/api/v1/todos/" + delete_id).then((response) => {
        this.todos.splice(index, 1);
      }).catch(() => {
      })
    }
  }
</script>

<style lang="scss" scoped>
  [v-cloak] {
    display: none;
  }

  ul {
    list-style: none;
    li {
      span.done {
        text-decoration: line-through;
      }
    }
  }
</style>