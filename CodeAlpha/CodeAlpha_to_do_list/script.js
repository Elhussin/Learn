


const taskForm = document.getElementById("task-form");
const taskInput = document.getElementById("task-input");
const taskList = document.getElementById("task-list");
const submitBtn = document.getElementById("submit");
const themeBtn = document.getElementById("theme");
const error = document.getElementById("error");


// تحميل المهام من localStorage
let tasks = JSON.parse(localStorage.getItem("tasks")) || [];
let editIndex = null;



function loadTheme() {
  const savedTheme = localStorage.getItem("theme") || "light";
  document.body.classList.add(savedTheme);
  themeBtn.textContent = savedTheme;
}

// تبديل الثيم وحفظه
function themeToggle() {
  if (document.body.classList.contains("dark")) {
    document.body.classList.replace("dark", "light");
    localStorage.setItem("theme", "light");
    themeBtn.textContent = "light";
  } else {
    document.body.classList.replace("light", "dark");
    localStorage.setItem("theme", "dark");
    themeBtn.textContent = "dark";
  }
}

themeBtn.addEventListener("click", themeToggle);


function createButton(text, onClick, className = "") {
  const button = document.createElement("button");
  button.textContent = text;
  button.className = "btn " + className;
  button.addEventListener("click", onClick);
  return button;
}
function createTaskElement(task, index) {
  const li = document.createElement("li");
  li.className = task.completed ? "completed" : "";

  const span = document.createElement("span");
  span.textContent = task.text;
  span.addEventListener("click", () => toggleTask(index));

  const actions = document.createElement("div");
  actions.className = "actions";
  actions.appendChild(createButton("Edit", () => editTask(index), "btn-edit"));
  actions.appendChild(createButton(task.completed ? "Undone" : "Done", () => toggleTask(index), "btn-done"));
  actions.appendChild(createButton("Delete", () => deleteTask(index), "btn-delete"));

  li.appendChild(span);
  li.appendChild(actions);
  return li;
}

// function createTaskElement(task, index) {
//   const editBtn = createButton("Edit", () => editTask(index),"but edit");
//   const donBtn = createButton(task.completed ? "Undone" : "Done", () => toggleTask(index),"but done");
//   const deleteBtn = createButton("Delete", () => deleteTask(index),"but delate");
//   const child= document.createElement("div");
//   const li = document.createElement("li");
//   li.className = task.completed ? "completed" : "";
//   const span = document.createElement("span");
//   span.textContent = task.text;
//   span.addEventListener("click", () => toggleTask(index));


//   child.style.display="flex";
//   child.style.gap="10px";
//   child.appendChild(deleteBtn);
//   child.appendChild(donBtn);
//   child.appendChild(editBtn);
//   li.appendChild(span);
//   li.appendChild(child);
//   return li;
// }

// عرض المهام
function renderTasks() {
  taskList.innerHTML = "";
  tasks.reverse();
  tasks.forEach((task, index) => {
    if (!task.completed) taskList.appendChild(createTaskElement(task, index));
  });

  if (tasks.some(t => t.completed)) {
    const divider = document.createElement("li");
    divider.innerHTML = "<hr><b>Completed Tasks</b><hr>";
    taskList.appendChild(divider);
  }

  tasks.forEach((task, index) => {
    if (task.completed) taskList.appendChild(createTaskElement(task, index));
  });
}

// إضافة مهمة
taskForm.addEventListener("submit", (e) => {
  e.preventDefault();
  if (taskInput.value.trim() === "") {
    error.textContent = "Task cannot be empty";
    return;
  }
  error.textContent = "";

  if (editIndex !== null) {
    tasks[editIndex].text = taskInput.value.trim();
    editIndex = null;
    submitBtn.innerText="Add";
    
  } else {
    const newTask = { text: taskInput.value.trim(), completed: false };
    tasks.push(newTask);
  taskInput.value = "";
  saveTasks();
}
});

function editTask(index) {
  taskInput.value = tasks[index].text;
  submitBtn.textContent = "Update";
  editIndex = index;
}

// تبديل حالة الإكمال
function toggleTask(index) {
  tasks[index].completed = !tasks[index].completed;
  saveTasks();
}



// حذف مهمة
function deleteTask(index) {
  tasks.splice(index, 1);
  saveTasks();
}

// حفظ في localStorage
function saveTasks() {
  localStorage.setItem("tasks", JSON.stringify(tasks));
  renderTasks();
}

// أول تشغيل
loadTheme();
renderTasks();
