/*
  Warnings:

  - You are about to drop the column `studio_id` on the `scene` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "scene" DROP CONSTRAINT "scene_studio_id_fkey";

-- AlterTable
ALTER TABLE "scene" DROP COLUMN "studio_id";

-- CreateTable
CREATE TABLE "studio_scene" (
    "studio_id" INTEGER NOT NULL,
    "scene_id" INTEGER NOT NULL,

    CONSTRAINT "studio_scene_pkey" PRIMARY KEY ("studio_id","scene_id")
);

-- AddForeignKey
ALTER TABLE "studio_scene" ADD CONSTRAINT "studio_scene_studio_id_fkey" FOREIGN KEY ("studio_id") REFERENCES "studio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "studio_scene" ADD CONSTRAINT "studio_scene_scene_id_fkey" FOREIGN KEY ("scene_id") REFERENCES "scene"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
