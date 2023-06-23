/*
  Warnings:

  - You are about to drop the column `scene_number` on the `studio` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "scene" ADD COLUMN     "studio_id" INTEGER NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE "studio" DROP COLUMN "scene_number";

-- AddForeignKey
ALTER TABLE "scene" ADD CONSTRAINT "scene_studio_id_fkey" FOREIGN KEY ("studio_id") REFERENCES "studio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
