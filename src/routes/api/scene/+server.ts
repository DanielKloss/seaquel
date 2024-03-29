import { PrismaClient } from '@prisma/client';

/** @type {import('./$types').RequestHandler} */
export async function POST({ request }) {
  let requestData = await request.json();
  let newScene;
  let IsFinished = false;
  const prisma = new PrismaClient();
  
  let studio = await prisma.studio.findUnique({
    select: {
      current_scene: true,
      start_scene: true
    },
    where: {
      id: parseInt(requestData.studioId),
    }
  });

  if (studio && studio.current_scene < 6) {
    newScene = studio.current_scene + 1;
  } else {
    newScene = 0;
  }

  if (studio.start_scene == newScene) {
    IsFinished = true;
  }

  let response = await prisma.studio.update({
    where: {
      id: parseInt(requestData.studioId),
    },
    data: {
      current_scene: newScene,
      finished: IsFinished
    }
  });

  await prisma.$disconnect();

  return new Response(JSON.stringify(response));
}