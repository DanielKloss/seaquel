<script lang="ts">
  import { Shadow } from 'svelte-loading-spinners';
  import Finished from "../../../lib/finished.svelte";

  export let data: PageData;
 
  let studio = data.studio;

  $: finished = studio.finished;

  let loading = false;
  let uploaded = false;
  let error = false;

  let files: FileList;

  async function changed(){
    loading = true
    let name = String(studio.id) + " - " + String(studio.current_scene) + ".mp4";
    let blob = files[0].slice(0, files[0].size); 
    let fileToUpload = new File([blob], name);
    let url = 'https://file.io/'
    var data = new FormData()
    data.append('file', fileToUpload)
    let response = await fetch(url, {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer ' + import.meta.env.VITE_FILEIO_API_KEY
      },
      body: data
    });

    if(response.status != 200){
      uploaded = false;
      error = true;
      return;
    }

    response = await fetch('/api/scene', {
      method: 'POST',
      headers: {
        'content-type': 'application/json'
      },
      body: JSON.stringify({studioId: studio.id})
    });

    if(response.status != 200){
      uploaded = false;
      error = true;
      return;
    }

    let newData = await response.json()
    
    studio.current_scene = newData.current_scene;

    finished = newData.finished;
    uploaded = true;
    error = false;
    loading = false;
  }
</script>

<main class="page">
  {#if finished}
    <Finished/>
  {:else}
    <h1 class="instructionsTitle">{studio.studio_scenes[studio.current_scene].scene.name}</h1>
    {#if loading}
    <div class="loading">
      <Shadow size="60" color="#000000" unit="px" duration="1.75s"/>
      <p>Uploading Scene</p>
    </div>
    {:else}
    <div class="instructions">
      {#if uploaded}
        <div class="importantNote">
          <img class="iconImage" src="../icons/check.png" alt="uploaded" />
          <p>Video successfully uploaded. Your director should now have the next task on their phone.</p>
        </div>
      {:else if error}
        <div class="importantNote">
          <img class="iconImage" src="../icons/cancel.png" alt="error" />
          <p>Something went wrong. The video was not uploaded. Sorry! Check your wifi connection and try again.</p>
        </div>
      {/if}
      <div class="importantNote">
        <img class="iconImage" src="../icons/warning.png" alt="warning" />
        <p>Once you ACCEPT your video you cannot go back. Your team must move onto the next task.</p>
      </div>
    </div>
    
    <label class="file">
      <input type="file" name="video" accept="video/*" bind:files on:change={() => changed()}/>
      <div class="button">
        <img class="iconImage" src="../icons/camera.png" alt="action" />
        <p>RECORD A TASK</p>
      </div>
    </label>
    {/if}
  {/if}
</main>

<style>
  .page {
    display: flex;
    flex-direction: column;
    font-family: "Trebuchet MS";
  }

  .loading {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 4rem;
    margin-top: 4rem;
  }

  .instructions {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1rem;
    padding: 1rem;
  }

  .instructionsTitle {
    background-color: #fde047;
    letter-spacing: 0.35rem;
    text-align: center;
    padding: 1rem;
    font-weight: bold;
  }

  .importantNote {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 1rem;
    font-weight: bolder;
    text-align: center;
    line-height: 1.25rem;
    border: 0.2rem solid black;
    padding: 1rem;
  }

  .iconImage {
    aspect-ratio: 1/1;
    width: 3rem;
  }

  input[type="file"] {
    opacity: 0;
  }

  .button {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 1rem;
    font-weight: bolder;
    text-transform: uppercase;
    letter-spacing: 0.35rem;
    padding: 1rem;
    background-color: #fde047;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  } 
</style>