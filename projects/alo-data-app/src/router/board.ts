import Router from "koa-router";
import { PrismaClient } from "@prisma/client";

const router : Router = new Router();
const prisma = new PrismaClient();

router.get('/', async (ctx) => {
    try {
        ctx.body = await prisma.board.findMany();
        ctx.status = 200;
    } catch(err) {
        ctx.status = 500;
        ctx.body = err;
    }
});

export default router;