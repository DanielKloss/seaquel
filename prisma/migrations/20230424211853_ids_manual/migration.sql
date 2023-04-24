-- AlterTable
ALTER TABLE "role" ALTER COLUMN "id" DROP DEFAULT;
DROP SEQUENCE "role_id_seq";

-- AlterTable
ALTER TABLE "scene" ALTER COLUMN "id" DROP DEFAULT;
DROP SEQUENCE "scene_id_seq";
