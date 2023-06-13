# Tasks feature
The tasks feature allows users to manage their to-do list by creating, reading, updating, and deleting tasks.

## Architecture

This feature follows the clean architecture, with the following layers:

- `Domain`: Contains the business logic and use cases for managing tasks.
- `Data`: Contains the repositories and data sources for fetching and persisting task data.
- `Presentation`: Contains the UI components and the controller that manages the state of the UI.
## Domain Layer
The domain layer is responsible for defining the business logic and use cases related to tasks. It includes the following classes:

### Entities
- `Task`: an data class representing a task.
### Repositories
- `TaskRepository`: an interface defining the repository contract for tasks.
### Use cases
- `GetTasks`: a use case that retrieves a list of tasks.
- `AddTask`: a use case that adds a new task.
- `UpdateTask`: a use case that updates an existing task.
- `DeleteTask`: a use case that deletes an existing task.
## Data Layer
The data layer is responsible for providing the source of the tasks data. It includes the following classes:

- `TasksLocalDataSource`: an interface defining the local data source contract for tasks.
- `TasksLocalDataSourceImpl`: an implementation of `TasksLocalDataSource` using Hive as the underlying data store.
## Presentation Layer
The presentation layer is responsible for handling the UI logic and user interactions related to tasks. It includes the following classes:

### Controllers
- `TasksController`: a controller that manages state of the tasks and exposes the tasks data to the UI.
### Screens
- `TasksScreen`: a screen that displays the tasks UI.
- `AddTaskScreen`: a screen that allows users to add a new task.


## Dependencies
The tasks feature depends on the following external libraries:

- `Riverpod`: a state management library used to manage the tasks state.
- `Hive`: a lightweight and fast key-value database used to store tasks data locally.

## Testing

The tasks feature has the following tests:

- Unit tests for the use cases in the domain layer.
- Integration tests for the repositories and data sources in the data layer.

## Known Issues

None at the moment.