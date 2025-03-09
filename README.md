## Prerequisites

Before you start, make sure you have the following installed:
- Ruby 3.3.5
- Rails 8.0.1
- PostgreSQL

## 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/fyurchik/project-management-system.git
cd project-management-system
```
## Prerequisites
Run bundle to install the required Ruby gems:

```bash
bundle install
```

## Setup Environment Variables
Create the .env file:

```bash
touch .env
```

Inside the .env file, set the following variables:

```bash
DEVISE_JWT_SECRET_KEY=your_jwt_secret_key_here
```

To generate the DEVISE_JWT_SECRET_KEY, run the following command:

```bash
rails secret
```

### Database Setup
```bash
rails db:create
rails db:migrate
```

### Running the Application
```bash
rails s
```

### Running Tests
```bash
bundle exec rspec
```

