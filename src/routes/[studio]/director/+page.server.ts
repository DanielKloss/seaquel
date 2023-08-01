import PrismaClient from "../../../prisma";

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    const prisma = new PrismaClient();

  let scenes = await prisma.scene.findMany({
    where: {
      studio_scenes: {
        some: {
          studio_id: parseInt(params.studio),
        }
      }
    },
    orderBy: {
      id: "asc",
    },
    select: {
      id: true,
      name: true,
      location: true,
      context: true,
      scene_roles: {
        select: {
          line: true,
          role: {
            select: {
              name: true,
            },
          },
        },
      },
    },
  });

  console.log(scenes)

  let studio = await prisma.studio.findUnique({
    select: {
      name: true,
      current_scene: true,
      start_scene: true,
      finished: true
    },
    where: {
      id: parseInt(params.studio)
    },
  });

  await prisma.$disconnect();

  return { scenes, studio };
}
