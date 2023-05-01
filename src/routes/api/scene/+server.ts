import { PrismaClient } from '@prisma/client';

/** @type {import('./$types').RequestHandler} */
export async function POST({ request }) {
    let requestData = await request.json();

    const prisma = new PrismaClient();

    let response = await prisma.studio_scene.update({
      where: {
        id: requestData.studioId,
      },
      data: {
        scene_number: {
          increment: 1,
        },
      },
    });

    return new Response(JSON.stringify(response));
}