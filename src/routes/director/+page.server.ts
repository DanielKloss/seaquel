import PrismaClient from "../../prisma";

/** @type {import('./$types').PageServerLoad} */
export async function load() {
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

    await prisma.$disconnect();

    return { scenes };
}
