/*
  Warnings:

  - The primary key for the `scene_role` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "scene_role" DROP CONSTRAINT "scene_role_pkey",
ADD CONSTRAINT "scene_role_pkey" PRIMARY KEY ("scene_id", "role_id", "line");
