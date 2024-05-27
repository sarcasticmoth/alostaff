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
- public
- - index.html
- - styles.css
- - scripts.js
- src
- - components
- - - 
- - services
- - - somethingService.js
- - utils
- - - formatDate.js
- - app.js
- - index.js
- package.json
- README.md

