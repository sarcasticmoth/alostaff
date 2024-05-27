import board from './board';
import category from './category';
import post from './post'
import thread from './thread'
import user from "./user";
import Router from "koa-router";

const router: Router = new Router();

router.use("/api/board", board.routes(), board.allowedMethods());
router.use("/api/category", category.routes(), category.allowedMethods());
router.use("/api/post", post.routes(), post.allowedMethods());
router.use("/api/thread", thread.routes(), thread.allowedMethods());
router.use("/api/user", user.routes(), user.allowedMethods());

export default router;
