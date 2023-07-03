<script lang="ts">
  export let data: PageData;
 
  let studio = data.studio;

  $: finished = studio.finished;

  let files: FileList;

  async function changed(){
    let blob = files[0].slice(0, files[0].size); 
    let fileToUpload = new File([blob], 'name.png');
    let url = 'https://file.io/'
    var data = new FormData()
    data.append('file', fileToUpload)
    await fetch(url, {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer ' + import.meta.env.VITE_FILEIO_API_KEY
      },
      body: data
    });
    await fetch('/api/scene', {
      method: 'POST',
      headers: {
        'content-type': 'application/json'
      },
      body: JSON.stringify({studioId: studio.id})
    });
  }
</script>

<main class="page">
  {#if finished}
    <p>YOU ARE FINISHED</p>
  {:else}
    <h1 class="instructionsTitle">Camera Crew Instructions</h1>
    <div class="instructions">
      <p class="instruction">1. When your team is ready to film a task press the button below. This will take you to your phone camera.</p>
      <p class="instruction">2. Choose between the front and rear facing camera.</p>
      <p class="instruction">3. Press your record button to record your actors.</p>
      <p class="instruction">4. Once you've finished you will get a choice to accept the take or retry.</p>
      <p class="instruction">5a. If you accept the take, the video will be uploaded for fan approval.</p>
      <p class="instruction">5b. If you retry you will be returned to your camera to try again until you are happy.</p>
      <div class="importantNote">
        <img class="iconImage" src="../icons/warning.png" alt="warning" />
        <p>Once you accept a take you cannot go back. You must move onto the next task.</p>
      </div>
    </div>
    <label class="file">
      <input type="file" name="video" accept="video/*" bind:files on:change={() => changed()}/>
      <div class="button">
        <img class="iconImage" src="../icons/camera.png" alt="action" />
        <p>ACTION</p>
      </div>
    </label>
  {/if}
</main>

<style>
  .page {
    display: flex;
    flex-direction: column;
    font-family: "Trebuchet MS";
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

  .instruction {
    line-height: 1.25rem;
    letter-spacing: 0.025rem;
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