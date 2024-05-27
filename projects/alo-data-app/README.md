# project

```powershell
npx ts-node .\index.ts
```

```powershell
npx prisma migrate diff --from-empty --to-schema-datamodel prisma/schema.prisma --script > prisma/migrations/0_init/migration.sql

npx prisma migrate dev --create-only

npx prisma migrate dev
```

## structure

alo-data-app
- src
- - controllers/
- - models/
- - routes/
- - services/
- - index.js
- package.json
- README.md

## sites

https://ianodad.medium.com/building-a-mvc-application-with-nextjs-and-prisma-a4be9276b9f2
