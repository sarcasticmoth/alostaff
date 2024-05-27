"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
const max_len = 21;
const max_len_1 = 12;
const pad = (str, length, char = "-") => str.padStart((str.length + length) / 2, char).padEnd(length, char);
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        console.log(pad(" start ", max_len));
        const avatars = yield prisma.board.findMany();
        const boards = yield prisma.board.findMany();
        const categories = yield prisma.category.findMany();
        const images = yield prisma.image.findMany();
        const moderators = yield prisma.moderator.findMany();
        const posts = yield prisma.post.findMany();
        const threads = yield prisma.thread.findMany();
        const users = yield prisma.user.findMany();
        console.log(`${"avatars".padEnd(max_len_1, " ")} : ${avatars.length}`);
        console.log(`${"boards".padEnd(max_len_1, " ")} : ${boards.length}`);
        console.log(`${"categories".padEnd(max_len_1, " ")} : ${categories.length}`);
        console.log(`${"images".padEnd(max_len_1, " ")} : ${images.length}`);
        console.log(`${"moderators".padEnd(max_len_1, " ")} : ${moderators.length}`);
        console.log(`${"posts".padEnd(max_len_1, " ")} : ${posts.length}`);
        console.log(`${"threads".padEnd(max_len_1, " ")} : ${threads.length}`);
        console.log(`${"users".padEnd(max_len_1, " ")} : ${users.length}`);
        console.log(pad(" end ", max_len));
    });
}
main()
    .then(() => __awaiter(void 0, void 0, void 0, function* () {
    yield prisma.$disconnect();
}))
    .catch((e) => __awaiter(void 0, void 0, void 0, function* () {
    console.error(e);
    yield prisma.$disconnect();
    process.exit(1);
}));
