import PrismaClient from "../../../prisma";

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
  const prisma = new PrismaClient();

  let studio = await prisma.studio.findUnique({
    select: {
      id: true,
      name: true,
      current_scene: true,
      start_scene: true,
      finished: true,
      studio_scenes: {
        select: {
          scene: true
        },
        orderBy: {
          scene_id: "asc",
        },
        where: {
          studio_id: parseInt(params.studio),
        }
      }
    },
    where: {
      id: parseInt(params.studio),
    },
  });

  await prisma.$disconnect();

  return { studio };
}
