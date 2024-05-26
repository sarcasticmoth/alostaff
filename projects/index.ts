import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    console.log(`----- start main -----`);

    console.log(`----- boards -----`);

    var boards = await prisma.board.findMany();
    console.log(`board count: ${boards.length}`);

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
