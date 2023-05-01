import { PrismaClient } from '@prisma/client';

/** @type {import('./$types').RequestHandler} */
export async function POST({ request }) {
    let requestData = await request.json();

    const prisma = new PrismaClient();

    await prisma.studio_scene.update({
      where: {
        id: requestData.studioId,
      },
      data: {
        scene_number: {
          increment: 1,
        },
      },
    });

    return new Response();
}