# louezz

## Features

- User Registration: Users can register for a new account.
- Email Validation: Accounts are activated using secure email validation codes.
- User Authentication: Existing users can log in to their accounts securely.
- Car Management: Users can create, update, and share their cars.

#### Class diagram
![Class diagram](img/louezz.png)

## Technologies Used

### Backend (Louezz-api)

- Spring Boot 3
- Spring Security 6
- JWT Token Authentication
- Spring Data JPA
- JSR-303 and Spring Validation
- OpenAPI and Swagger UI Documentation
- Docker
- GitHub Actions

### Frontend (Louezz-ui)

- Angular
- Component-Based Architecture
- Lazy Loading
- Authentication Guard
- Bootstrap

# Running the project
## The docker compose file:
Run the comand:
```
docker-compose up
```
To enter into mysql database run the command:
```
docker exec -it louezz-db-1 mysql -u root -p
```
## Louezz-api:
Run the comand:
```
mvn spring-boot:run
```
## Louezz-ui:
run the command:
```
ng serve -o
```