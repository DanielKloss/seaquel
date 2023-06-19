/*
  Warnings:

  - You are about to drop the `studio_scene` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "studio_scene";

-- CreateTable
CREATE TABLE "studio" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "scene_number" INTEGER NOT NULL,

    CONSTRAINT "studio_pkey" PRIMARY KEY ("id")
);
