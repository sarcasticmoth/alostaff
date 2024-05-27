import Koa from "koa";
import cors from 'koa-cors';
import logger from 'koa-logger';
import router from './router'

import { koaBody } from "koa-body";

const port = 3030;

const app = new Koa();

app.use(cors());
app.use(koaBody());
app.use(logger());
app.use(router.routes());
app.use(router.allowedMethods());

app.listen(port, () => {
    console.log(`[server]: Server is running at http://localhost:${port}`);
});
