<script lang="ts">
  import { page } from "$app/stores";

  let studio = $page.params.studio;
  let tasks = [];
  let error = ""
  
  async function addPoints(){
    let points = 0;

    let response = await fetch('/api/points', {
      method: 'POST',
      headers: {
        'content-type': 'application/json'
      },
      body: JSON.stringify({studioId: studio, points: points})
    });

    if(response.status != 200){
      error = "There was an error. Points not uploaded"
    }
  }
</script>

<!--THIS CONTROLLER NEEDS TO BE ABLE TO ENTER POINTS FOR EACH TASK SEPERATELY-->

<main class="page">
  <h1 class="title">IP Rep</h1>
  <div class="controls">
    {#each tasks as task}
      <input type="number" bind:value={task.points}/>
      <p>Bonus?</p>
      <input type="checkbox" bind:checked={task.bonus}/>
    {/each}
  </div>
  <p>{error}</p>
  <button class="button" on:click={() => addPoints()}>SEND POINTS</button>
  <input type="file" name="video" accept="video/*"/>
  <button class="button">
    <p>CAPTURE</p>
  </button>
</main>

<style>
  .page {
    display: flex;
    flex-direction: column;
    font-family: "Trebuchet MS";
  }

  .title {
    background-color: #fde047;
    letter-spacing: 0.35rem;
    text-align: center;
    padding: 1rem;
    font-weight: bold;
  }

  .controls {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    gap: 1rem;
    padding: 1rem;
  }

  input[type="number"]{
    text-align: center;
    font-size: 2rem;
    width: 5rem;
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