var app = new Vue({
  el: '#app',
  components: {
    'task': { props: ['task'],
              template: `
                <div class="ui segment task"
                    v-bind:class="task.completed ? 'done' : 'todo'">
                    <div class="ui grid">
                      <div class="left floated twelve wide column">
                        <div class="ui checkbox">
                          <input type="checkbox" name="task" v-on:click="app.toggleDone($event, task.id)" :checked="task.completed" >
                          <label>{{ task.name }} <span class="description"> {{ task.description }} </span></label>
                        </div>
                      </div>
                      <div class="right floated three wide column">
                          <i class="icon pencil blue" alt="Edit" v-on:click="app.editTask(event, task.id)"></i>
                          <i class="icon trash red" alt="Delete" v-on:click="app.deleteTask(event, task.id)" ></i>
                      </div>
                    </div>
                </div>
                `}
  },
  data: {
    tasks: [
      {id: 1, name: 'Todo 1', description: 'Just the todo task 1', completed: false},
      {id: 2, name: 'Todo2', description: 'This is not a complete todo', completed: false},
      {id: 3, name: 'Todo 3', description: 'This is just task 3', completed: true},
      {id: 4, name: 'Todo 4', description: 'This is task number 4', completed: true}
    ],
    task: {},
    action: 'create',
    message: ''
  },
  computed: {
    completedTasks: function() {
      return this.tasks.filter( item => item.completed == true );
    },
    todoTasks: function() {
      return this.tasks.filter( item => item.completed == false);
    },
    nextId: function() {
      return (this.tasks.sort(function(a,b){ return a.id - b.id; }))[this.tasks.length - 1].id + 1;
    }
  },
  methods: {
    toggleDone: function(event, id) {
      // avoid multi triggering
      event.stopImmediatePropagation();
      let task = this.tasks.find(item => item.id == id)

      if(task) {
        task.completed = !task.completed;
        this.message = `Task ${id} updated`;
      }
    },
    deleteTask: function(event, id) {
      event.stopImmediatePropagation();
      let taskIndex = this.tasks.findIndex(item => item.id == id);

      if(taskIndex > -1) {
        // this is vueJS specific method
        this.$delete(this.tasks, taskIndex);
      }
      this.message = `Task ${id} deleted.`;
    },
    editTask: function(event, id) {
      event.stopImmediatePropagation();
      this.action = 'edit';
      let task = this.tasks.find(item => item.id == id);

      if(task) {
        this.task = { id: task.id,
                       name: task.name,
                       description: task.description,
                       completed: task.completed };
      }
    },
    updateTask: function($event, id) {
      event.stopImmediatePropagation();

      let task = this.tasks.find(item => item.id == id);
      if(task) {
        task.name = this.task.name;
        task.description = this.task.description;
        task.completed = this.task.completed;
        this.message = `Task ${id} updated`;
      }
    },
    clear: function() {
      this.task = {};
      this.action = 'create';
      this.message = '';
    },
    createTask: function(event) {

      if(!this.task.completed) {
        this.task.completed = false;
      } else {
        this.task.completed = true;
      }

      let taskId = this.nextId;

      this.task.id = taskId;
      this.tasks.push(this.task);
      this.clear();
      this.message = `Task ${taskId} created!`;
    }
  }
})