-- CreateTable
CREATE TABLE "scene" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "context" TEXT NOT NULL,

    CONSTRAINT "scene_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "icon" TEXT NOT NULL,

    CONSTRAINT "role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "scene_role" (
    "line" TEXT NOT NULL,
    "scene_id" INTEGER NOT NULL,
    "role_id" INTEGER NOT NULL,

    CONSTRAINT "scene_role_pkey" PRIMARY KEY ("scene_id","role_id")
);

-- AddForeignKey
ALTER TABLE "scene_role" ADD CONSTRAINT "scene_role_scene_id_fkey" FOREIGN KEY ("scene_id") REFERENCES "scene"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scene_role" ADD CONSTRAINT "scene_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
