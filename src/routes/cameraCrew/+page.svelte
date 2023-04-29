<script lang="ts">
  let files: FileList;

  async function changed(){
    let url = 'https://file.io/'
    var data = new FormData()
    data.append('file', files[0])
    await fetch(url, {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer ' + import.meta.env.VITE_FILEIO_API_KEY
      },
      body: data
    });
  }
</script>

<label for="picture">Take a video:</label>

<input type="file" name="video" accept="video" bind:files on:change={() => changed()}/>