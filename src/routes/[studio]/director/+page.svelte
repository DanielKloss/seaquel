<script lang="ts">
  import { createClient } from '@supabase/supabase-js'
  import Finished from '../../../lib/finished.svelte';

  export let data: PageData;

  $: scene = data.scenes[data.studio.current_scene];
  $: roles = [...new Set(scene.scene_roles.map(sr => sr.role.name))];
  $: finished = data.studio.finished;
  //let finished = true;

  const supabase = createClient(import.meta.env.VITE_SUPABASE_URL, import.meta.env.VITE_SUPABASE_KEY)

  supabase
    .channel('schema-db-changes')
    .on(
      'postgres_changes',
      {
        event: 'UPDATE',
        schema: 'public',
      },
      (payload) => {
        if (payload.new.current_scene == data.studio.start_scene){
          finished = true;
        } else {
          scene = data.scenes[payload.new.current_scene];
        }
      }
    )
    .subscribe()
</script>

<main class="page">
  {#if finished}
    <Finished/>
  {:else}
    <div>
      <h1 class="sceneTitle">{scene.name}</h1>
      <div class="infoContainer">
        <img class="smallIconImage" src="../icons/map.png" alt="map icon" />
        <p class="sceneInfo">{scene.location}</p>
      </div>
      {#if scene.scene_roles.length > 0}
        <div class="infoContainer">
          <img class="smallIconImage" src="../icons/theater.png" alt="theater icon" />
          <ul>
            {#each roles as role}
              <li class="sceneInfo">{role}</li>
            {/each}
          </ul>
        </div>
      {/if}
      <div class="infoContainer">
        <img class="smallIconImage" src="../icons/megaphone.png" alt="context icon" />
        <p class="sceneInfo">{scene.context}</p>
      </div>
    </div>
    {#if scene.scene_roles.length > 0}
      <div class="scriptContainer">
        <h2 class="scriptHeader">SCRIPT</h2>
        {#each scene.scene_roles as role}
          <div class="lineContainer">
            <div class="left">
              <h3 class="scriptRole">{role.role.name}</h3>
              <p class="scriptLine">{role.line}</p>
            </div>
            <img class="iconImage" src="../icons/{role.role.name}.png" alt={role.role.name} />
          </div>
        {/each}
      </div>
    {/if}
  {/if}
</main>

<style>
  .page {
    display: flex;
    flex-direction: column;
    font-family: "Trebuchet MS";
  }

  .sceneTitle {
    background-color: #fde047;
    letter-spacing: 0.35rem;
    text-align: center;
    padding: 1rem;
    font-weight: bold;
  }

  .infoContainer {
    display: flex;
    align-items: center;
    gap: 1rem;
    padding: 1rem;
  }

  .sceneInfo {
    line-height: 1.25rem;
    letter-spacing: 0.025rem;
  }

  .scriptContainer {
    display: flex;
    flex-direction: column;
    font-family: "Courier New";
  }

  .scriptHeader {
    background-color: #94a3b8;
    letter-spacing: 0.35rem;
    text-align: center;
    padding: 1rem;
    font-weight: bold;
  }

  .scriptLine {
    letter-spacing: 0.2rem;
    line-height: 2rem;
  }

  .lineContainer {
    display: grid;
    grid-template-columns: 1fr auto;
    padding: 2rem;
    align-items: center;
    gap: 2rem;
  }

  .scriptRole {
    text-transform: uppercase;
    letter-spacing: 0.35rem;
    font-size: 0.75rem;
    font-weight: bolder;
    border-bottom: solid black 0.1rem;
    padding-bottom: 0.75rem;
  }

  .iconImage {
    aspect-ratio: 1/1;
    width: 3rem;
  }

  .smallIconImage {
    aspect-ratio: 1/1;
    width: 2rem;
  }

  .left {
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }
</style>