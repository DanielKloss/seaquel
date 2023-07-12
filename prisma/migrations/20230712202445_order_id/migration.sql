/*
  Warnings:

  - You are about to drop the column `points` on the `studio` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "studio" DROP COLUMN "points";

-- AlterTable
ALTER TABLE "studio_scene" ADD COLUMN     "order_id" INTEGER NOT NULL DEFAULT 0;
