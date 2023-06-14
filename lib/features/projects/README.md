# Projects Feature

The projects feature provides users with the ability to manage their projects by creating, reading, updating, and deleting projects.

## Architecture

This feature follows the clean architecture, adopting the same structure as the tasks feature. It consists of the following layers:

- `Domain`: Contains the business logic and use cases for managing projects.
- `Data`: Contains the repositories and data sources for fetching and persisting project data.
- `Presentation`: Contains the UI components and the controller responsible for managing the state of the UI.

## Domain Layer
The domain layer handles the business logic and use cases related to projects. It includes the following classes:

### Entities
- `Project`: A data class representing a project.

### Repositories
- `ProjectRepository`: An interface defining the repository contract for projects.

### Use cases
- `GetProjects`: A use case that retrieves a list of projects.
- `AddProject`: A use case that adds a new project.
- `UpdateProject`: A use case that updates an existing project.
- `DeleteProject`: A use case that deletes an existing project.

## Data Layer
The data layer provides the necessary data sources for managing project data. It includes the following classes:

- `ProjectsRemoteDataSource`: An interface defining the remote data source contract for projects.
- `ProjectsRemoteDataSourceImpl`: An implementation of `ProjectsRemoteDataSource` using the AppWrite API as the underlying data store.

## Presentation Layer
The presentation layer handles the UI logic and user interactions related to projects. It includes the following classes:

### Controllers
- `ProjectsController`: A controller responsible for managing the state of projects and exposing the project data to the UI.

### Screens
- `ProjectsScreen`: A screen that displays the projects UI.
- `AddProjectScreen`: A screen that allows users to add a new project.

## Dependencies
The projects feature relies on the following external libraries:

- `Riverpod`: A state management library used to manage the project state.
- `AppWrite SDK`: A client library for interacting with the AppWrite backend services.

## Testing
The projects feature includes the following tests:

- Unit tests for the use cases in the domain layer.
- Integration tests for the repositories and data sources in the data layer.

## Known Issues
No known issues exist at the moment.