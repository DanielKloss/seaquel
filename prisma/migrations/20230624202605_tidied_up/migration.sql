/*
  Warnings:

  - You are about to drop the column `current_scene_id` on the `studio` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "scene" ALTER COLUMN "studio_id" SET DEFAULT 0;

-- AlterTable
ALTER TABLE "studio" DROP COLUMN "current_scene_id",
ADD COLUMN     "current_scene" INTEGER NOT NULL DEFAULT 0;
