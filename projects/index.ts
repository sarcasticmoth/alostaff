import {PrismaClient} from "@prisma/client";

const prisma = new PrismaClient();

const max_len : number = 21;
const max_len_1 : number = 12;

const pad = (str: string, length: number, char = "-") =>
    str.padStart((str.length + length) / 2, char).padEnd(length, char);

async function main() {
    console.log(pad(" start ", max_len));

    const avatars = await prisma.board.findMany();
    const boards = await prisma.board.findMany();
    const categories = await prisma.category.findMany();
    const images = await prisma.image.findMany();
    const moderators = await prisma.moderator.findMany();
    const posts = await prisma.post.findMany();
    const threads = await prisma.thread.findMany();
    const users = await prisma.user.findMany();

    console.log(`${"avatars".padEnd(max_len_1, " ")} : ${avatars.length}`);
    console.log(`${"boards".padEnd(max_len_1, " ")} : ${boards.length}`)
    console.log(`${"categories".padEnd(max_len_1, " ")} : ${categories.length}`);
    console.log(`${"images".padEnd(max_len_1, " ")} : ${images.length}`);
    console.log(`${"moderators".padEnd(max_len_1, " ")} : ${moderators.length}`);
    console.log(`${"posts".padEnd(max_len_1, " ")} : ${posts.length}`);
    console.log(`${"threads".padEnd(max_len_1, " ")} : ${threads.length}`);
    console.log(`${"users".padEnd(max_len_1, " ")} : ${users.length}`);

    console.log(pad(" end ", max_len));
}

main()
    .then(async () => {
        await prisma.$disconnect();
    })
    .catch(async (e) => {
        console.error(e);
        await prisma.$disconnect();
        process.exit(1);
    });
