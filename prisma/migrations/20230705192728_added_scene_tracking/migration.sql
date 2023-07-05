-- AlterTable
ALTER TABLE "studio" ADD COLUMN     "finished" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "start_scene" INTEGER NOT NULL DEFAULT 0;
