# Library Management System

A Java-based web application for managing library operations such as book catalog management, book issue/return, fine calculation, student/employee registration, search, and borrowing history.

The project follows a traditional **Java Servlet + JSP** architecture and uses **Oracle Database** for persistence.

## Features

### Authentication & User Roles
- Login system for:
  - Administrator
  - Librarian/Employee
  - Student
- Session-based user information and role handling.
- Logout functionality.
- Active/inactive library-status handling for users.

### Book Management
- Add new books to the library.
- Store book information such as:
  - Title
  - Author
  - Publisher
  - Price
  - Number of pages
  - Category
  - Book ID range
  - Purchase date
  - Branch
  - Book count
  - Additional comments
- Remove books.
- Search books.
- View available/book catalog information.

### Issue & Return Management
- Issue books to students/employees.
- Record issue date and expected return date.
- Return issued books.
- Maintain issue/return records.
- Track the current borrower of a book.

### Fine Management
- Calculate fines for overdue books.
- Display fine-related records.
- Maintain actual return dates.
- Delete/clear processed fine records where applicable.

### Student Services
- View student status.
- View borrowing/book history.
- Request book reissue.
- OTP-based reissue flow through email.

### Email / OTP
- Uses JavaMail to send OTP/reissue-related emails through Gmail SMTP.
- The email sender configuration is currently hard-coded in the source and must be configured before deployment.

## Technology Stack

| Technology | Usage |
|---|---|
| Java | Application logic |
| Java Servlets | Request handling and backend controllers |
| JSP | Dynamic web pages/UI |
| HTML/CSS | Frontend structure and styling |
| JavaScript | Client-side validation and interactions |
| jQuery | JavaScript utilities |
| Oracle Database | Persistent data storage |
| JDBC | Database connectivity |
| Oracle JDBC Driver | Oracle DB connection |
| JavaMail | Email/OTP functionality |
| Apache Tomcat | Servlet/JSP runtime |
| Eclipse | Original project/development environment |

## Architecture

The application uses a traditional MVC-like separation:

```text
Browser
   │
   ▼
JSP / HTML / JavaScript
   │
   ▼
Java Servlets
   │
   ├── Authentication
   ├── Book Management
   ├── Issue / Return
   ├── Fine Calculation
   ├── Registration / Status
   └── Email / OTP
   │
   ▼
JDBC
   │
   ▼
Oracle Database
```

The JSP files provide the user interface, while the servlet classes in `src/myservletpackage` process requests and communicate with Oracle through JDBC.

## Project Structure

```text
library-management-system/
│
├── src/
│   └── myservletpackage/
│       ├── SendEmail.java
│       ├── add_book.java
│       ├── book_issue.java
│       ├── calculate_fine.java
│       ├── issue_return.java
│       ├── login.java
│       ├── register_user.java
│       └── stu_status.java
│
├── WebContent/
│   ├── index.jsp
│   ├── myjavascript.js
│   │
│   ├── WEB-INF/
│   │   ├── web.xml
│   │   └── lib/
│   │       ├── mail-1.4.7.jar
│   │       └── ojdbc14.jar
│   │
│   ├── images/
│   │
│   └── jsp/
│       ├── admin.jsp
│       ├── librarian.jsp
│       ├── student.jsp
│       │
│       ├── button_controls_jsp/
│       │   ├── add_book.jsp
│       │   ├── book_issue_history.jsp
│       │   ├── calculate_fine.jsp
│       │   ├── employee_details.jsp
│       │   ├── issue_return_book.jsp
│       │   ├── registration_user.jsp
│       │   ├── remove_book.jsp
│       │   ├── search_book.jsp
│       │   ├── view_books.jsp
│       │   └── student/
│       │       ├── book_history.jsp
│       │       └── stu_status2.jsp
│       │
│       └── master_pages/
│           ├── header.jsp
│           ├── footer.jsp
│           └── other shared headers/footers
│
├── ImportedClasses/
│   └── myservletpackage/
│       └── compiled .class files
│
├── .settings/
├── .classpath
└── .project
```

## Main Servlets

| Servlet | Responsibility |
|---|---|
| `login` | Authenticates administrator, students and employees |
| `add_book` | Adds and removes book records |
| `book_issue` | Handles book issue/return operations and issue records |
| `issue_return` | Retrieves book/user information and supports issue/return workflows |
| `calculate_fine` | Retrieves and processes fine information |
| `register_user` | Handles library-status/registration-related operations |
| `stu_status` | Handles student reissue requests and OTP verification flow |
| `SendEmail` | Sends email messages using JavaMail |

## Database

The application is designed for **Oracle Database XE** and connects through JDBC.

The current source uses a connection similar to:

```java
jdbc:oracle:thin:@localhost:1521:xe
```

The application interacts with tables including:

- `book_details`
- `student`
- `employee`
- `calculate_fine`

### Important

The repository does **not include a database schema/SQL dump**, so the database tables must be created separately before the application can run successfully.

From the application code, `book_details` contains fields related to:

```text
id
end_id
title
auther
publisher
price
pages
category
purchase_date
branch
book_count
ad_comment
issue_id
issue_date
return_date
```

The `calculate_fine` table is used for issue/return and fine tracking, including fields such as:

```text
book_id
issue_id
issue_date
return_date
iss_return
fine
ac_return_date
RECORD_TIME
```

The exact Oracle data types and constraints should be defined in the database according to the application's expected values.

## Setup & Installation

### Prerequisites

Install the following:

- Java JDK
- Eclipse IDE for Enterprise Java/Web Developers
- Apache Tomcat
- Oracle Database XE
- Oracle JDBC Driver
- A configured Gmail account if the OTP/email feature is required

### 1. Clone the repository

```bash
git clone https://github.com/divyansh1169/library-management-system.git
cd library-management-system
```

### 2. Configure Oracle Database

Make sure Oracle Database XE is running locally.

The current application expects an Oracle connection similar to:

```text
Host: localhost
Port: 1521
SID/Service: xe
```

Update the JDBC connection strings and credentials in the servlet source files to match your local Oracle setup.

> Do not commit real database passwords or other credentials to GitHub.

### 3. Configure JavaMail

The project includes:

```text
WebContent/WEB-INF/lib/mail-1.4.7.jar
```

The email implementation uses Gmail SMTP over SSL.

Before using the OTP/reissue feature, configure the sender credentials in `SendEmail.java`.

For a real deployment, credentials should be stored securely using environment variables or another secrets-management mechanism rather than being hard-coded.

### 4. Import into Eclipse

1. Open Eclipse.
2. Select **File → Import**.
3. Import the project as an existing Eclipse project.
4. Configure the project with a compatible JDK.
5. Configure Apache Tomcat.
6. Add the project to the Tomcat server.
7. Make sure the Oracle JDBC JAR is available on the application's classpath.

### 5. Configure the Database Driver

The project contains:

```text
WebContent/WEB-INF/lib/ojdbc14.jar
```

Make sure the Oracle JDBC driver is compatible with the Oracle Database/JDK version being used.

### 6. Run the Application

Deploy the project to Tomcat and start the server.

The application context used by the JSP forms is:

```text
/library_project
```

The home page can then be accessed through the corresponding Tomcat URL, for example:

```text
http://localhost:8080/library_project/
```

The exact URL depends on the Tomcat port and deployed context name.

## Application Flow

### Login

```text
User
  │
  ▼
index.jsp
  │
  ▼
login servlet
  │
  ├── Administrator
  ├── Employee/Librarian
  └── Student
```

The login servlet checks the supplied credentials and retrieves user information from the appropriate Oracle table.

### Book Issue

```text
Select Book
     │
     ▼
Select Student/Employee
     │
     ▼
Set Issue & Return Dates
     │
     ▼
book_issue servlet
     │
     ├── Update book_details
     └── Create calculate_fine record
```

### Book Return

```text
Returned Book
     │
     ▼
issue_return / book_issue
     │
     ├── Update book status
     ├── Store actual return date
     └── Update fine information
```

### Reissue / OTP

```text
Student requests reissue
        │
        ▼
stu_status servlet
        │
        ├── Generate/send OTP
        │
        ▼
Email via JavaMail
        │
        ▼
OTP verification
        │
        ▼
Update issue/return information
```

## Frontend

The UI is implemented primarily using JSP, HTML, CSS and JavaScript.

The project includes:

- Login page
- Administrator dashboard
- Librarian dashboard
- Student dashboard
- Book search interface
- Add/remove book pages
- Book issue/return interface
- Fine calculation page
- Student book-history page
- User registration/status interface
- Shared header/footer JSP components
- Background and library-related images

Client-side validation and interaction logic is contained in:

```text
WebContent/myjavascript.js
```

jQuery is also included in the web application.

## Important Security Notes

This project appears to be an academic/legacy Java web application and should be treated as a learning project before production deployment.

Before deploying it publicly, consider addressing the following:

- Replace hard-coded database credentials with environment variables/secrets.
- Replace hard-coded email credentials with secure configuration.
- Avoid printing passwords to the console.
- Use `PreparedStatement` consistently instead of constructing SQL with string concatenation.
- Hash passwords instead of storing/checking them as plain text.
- Add proper authentication and authorization checks to every protected operation.
- Add CSRF protection to state-changing requests.
- Validate and sanitize all user input on the server.
- Use HTTPS in production.
- Close JDBC resources with `try-with-resources`.
- Upgrade outdated dependencies where compatible.
- Remove unnecessary compiled `.class` files from source control.
- Add a database schema/migration system.
- Add automated tests.

## Known Project Limitations

Based on the current repository:

- No database schema/SQL setup script is included.
- Several database connection strings and credentials are embedded directly in Java source.
- Email configuration contains placeholder credentials.
- The project contains precompiled `.class` files under `ImportedClasses`.
- Some source functionality appears to depend on classes that are not present as Java source in the repository.
- The application uses older Java EE/JSP/Servlet-era dependencies and an older Oracle JDBC JAR.
- Some JSP files retain generic titles such as `Insert title here`.
- There is an extra conflicted-copy JSP file in the repository.
- The application uses a mixture of parameterized JDBC statements and dynamically constructed SQL strings.

These are useful areas to clean up if the project is being prepared as a modern portfolio project.

## Future Improvements

Possible improvements include:

- Migrate from JSP/Servlets to Spring Boot + Spring MVC/REST.
- Use Spring Data JPA/Hibernate for database access.
- Add a proper service and repository layer.
- Introduce DTOs and validation.
- Use BCrypt/Argon2 for password hashing.
- Implement role-based authorization.
- Replace hard-coded configuration with environment-based configuration.
- Add database migrations using Flyway or Liquibase.
- Build a responsive modern frontend.
- Add REST APIs.
- Add unit and integration tests.
- Add Docker support.
- Add CI/CD with GitHub Actions.
- Add a proper database schema and seed data.
- Add dashboard statistics for books, users, issues and fines.
- Improve error handling and logging.

## Screenshots

Add screenshots of the application here:

```markdown
![Login Page](screenshots/login.png)

![Admin Dashboard](screenshots/admin-dashboard.png)

![Book Management](screenshots/book-management.png)

![Issue and Return](screenshots/issue-return.png)
```

Create a `screenshots/` directory in the repository and replace the filenames above with your actual screenshots.

## Learning Outcomes

This project demonstrates practical experience with:

- Java web application development
- Java Servlets
- JSP
- JDBC
- Oracle Database
- SQL CRUD operations
- HTTP request/response handling
- Session management
- Form handling
- Client-side JavaScript validation
- Email integration using JavaMail
- Library inventory management
- Book issue/return workflows
- Fine calculation
- Eclipse/Tomcat deployment

## Author

**Divyansh Saxena**

GitHub:  
https://github.com/divyansh1169

Repository:  
https://github.com/divyansh1169/library-management-system

---

## License

No explicit license file is currently included in the repository.

If you plan to make this project open source, add an appropriate `LICENSE` file and update this section accordingly.
