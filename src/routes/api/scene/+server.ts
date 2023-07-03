import { PrismaClient } from '@prisma/client';

/** @type {import('./$types').RequestHandler} */
export async function POST({ request }) {
  let requestData = await request.json();
  let newScene;
  const prisma = new PrismaClient();
  
  let studio = await prisma.studio.findUnique({
    select: {
      current_scene: true
    },
    where: {
      id: parseInt(requestData.studioId),
    }
  });

  if (studio && studio.current_scene < 7) {
    newScene = studio.current_scene++;
  } else {
    newScene = 0;
  }

  let response = await prisma.studio.update({
    where: {
      id: parseInt(requestData.studioId),
    },
    data: {
      current_scene: newScene
    }
  });

  return new Response(JSON.stringify(response));
}