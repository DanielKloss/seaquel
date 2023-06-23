import PrismaClient from "../../../prisma";

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
    const prisma = new PrismaClient();

    let scenes = await prisma.scene.findMany({
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
                            name: true
                        }
                    }
                }
            }
        }
    });

    let studio = await prisma.studio.findUnique({
      select: {
        name: true,
        scene_number: true,
      },
      where: {
        id: parseInt(params.studio)
      },
    });

    await prisma.$disconnect();

    return { scenes, studio };
}