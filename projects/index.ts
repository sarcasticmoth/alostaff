import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    console.log(`----- start main -----`);

    console.log(`----- boards -----`);

    var boards = await prisma.board.findMany();
    var categories = await prisma.category.findMany();
    var moderators = await prisma.moderator.findMany();
    var polls = await prisma.poll.findMany();
    var posts = await prisma.post.findMany();
    var threads = await prisma.thread.findMany();
    var users = await prisma.user.findMany();

    console.log(`\t boards : ${ boards.length }`);
    console.log(`\t categories : ${ categories.length }`);
    console.log(`\t moderators : ${ moderators.length }`);
    console.log(`\t polls : ${ polls.length }`);
    console.log(`\t posts : ${ posts.length }`);
    console.log(`\t threads : ${ threads.length }`);
    console.log(`\t users : ${ users.length }`);

    console.log(`----- end main -----`);
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
