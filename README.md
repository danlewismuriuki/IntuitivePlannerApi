# Introduction

TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project.

# Getting Started

TODO: Guide users through getting your code up and running on their own system. In this section you can talk about:

1. Installation process
2. Software dependencies
3. Latest releases
4. API references

# Build and Test

TODO: Describe and show how to build your code and run the tests.

# Contribute

TODO: Explain how other users and developers can contribute to make your code better.

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:

- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)

## Setup

1. Clone the repository
2. Install dependencies: `npm install`
3. Set up your `.env` file with the necessary environment variables
4. Generate Prisma client: `npx prisma generate`
5. Run migrations: `npx prisma migrate dev`
6. Start the development server: `npm run dev`

## Scripts

- `npm run build`: Compile TypeScript to JavaScript
- `npm start`: Start the production server
- `npm run dev`: Start the development server with hot-reloading
- `npm run prisma:generate`: Generate Prisma client
- `npm run prisma:migrate`: Run Prisma migrations
- `npm run prisma:studio`: Open Prisma Studio

## API Endpoints

- POST `/api/create_customer`: Create a new customer
- PUT `/api/edit_customer/:id`: Edit an existing customer
- GET `/api/get_customers`: Get all customers
- GET `/api/get_customer/:id`: Get a specific customer by ID
