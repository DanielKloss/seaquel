import PrismaClient from "../../../prisma";

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
  const prisma = new PrismaClient();

  let studio = await prisma.studio.findUnique({
      select: {
        id:true,
        name: true,
        current_scene: true,
        start_scene: true,
        finished: true
    },
    where: {
      id: parseInt(params.studio),
    },
  });

  await prisma.$disconnect();

  return { studio };
}
