import Router from "koa-router";
import { PrismaClient, user } from "@prisma/client";

const router : Router = new Router();
const prisma = new PrismaClient();

(BigInt.prototype as any).toJSON = function() {
    return this.toString()
}

interface Dictionary {
    [key:string]:user[];
}

router.get('/', async (ctx) => {
    try {
        ctx.body = await prisma.user.findMany();
        ctx.status = 200;
    } catch(err) {
        ctx.status = 500;
        ctx.body = err;
    }
});

router.get('/stats', async (ctx) => {
    try {
        let data = await prisma.user.findMany();
        let users:Dictionary = {};

        if(data === null) {
            console.log(`no users found...`);
        } else {
            for(let d in data) {
                let g = data[d].group;

                if(g === null) {
                    g = "null";
                }

                if(users[g] === undefined) {
                    users[g] = []
                }

                users[g].push(data[d]);
            }
        }

        ctx.body = users;
        ctx.status = 200;
    } catch(err) {
        ctx.status = 500;
        ctx.body = err;
    }
});

router.get('/:id', async (ctx) => {
    try {
        const user_id = Number(ctx.params.id);

        console.log(`looking for user id: ${user_id}...`);

        let alo_user = await prisma.user.findFirst({
            where: {
                id: user_id
            }
        });

        if(alo_user === null) {
            ctx.body = 'no user found';
            console.log('no user found');
        } else {
            ctx.body = alo_user;
            console.log(alo_user);
        }

        ctx.status = 200;

    } catch (err) {
        ctx.status = 500;
        ctx.body = err;
    }
});

export default router;