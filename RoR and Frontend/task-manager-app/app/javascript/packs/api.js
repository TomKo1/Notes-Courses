import axios from 'axios';

export function listTasks() {
  return axios.get('/tasks.json')
          .then(function(response){
                  return response.data;
          })
}

export function createTask(task) {
  var localTask = task;

  // delete it for rails to handle it
  delete localTask.id;

  return axios.post('/tasks.json', localTask)
            .then(function(response){
              return response.data;
            })
            .catch(function(error){
              console.log(error);
            });
}

export function updateTask (task) {
  var taksId = task.id;
  var localTask = { name: task.name,
                    description: task.description,
                    completed: task.completed };

  return axios.put(`/tasks/${taksId}.json`, localTask)
          .then(function(response) {
            return response.data;
          }).catch(function(error){
            console.log(error);
          });
}

export function deleteTask (task_id) {
  return axios.delete(`/tasks/${task_id}.json`)
       .then(function(response){
        return 'success';
       }, function(error){
        console.log(error);
       });
}